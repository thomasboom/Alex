import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import '../models/conversation_context.dart';
import '../models/user_profile.dart';
import 'conversation_service.dart';
import 'settings_service.dart';
import 'user_profile_service.dart';
import 'custom_instructions_service.dart';
import '../utils/logger.dart';

class OllamaService {
  static String get _baseUrl => SettingsService.apiEndpoint;
  static String get _model => SettingsService.customModel;

  static String get _apiKey {
    final apiKeySource = SettingsService.apiKeySource;
    if (apiKeySource == 'custom') {
      return SettingsService.customApiKey;
    }
    return '';
  }

  // Style descriptions as const maps for cleaner code
  static const Map<CommunicationStyle, String> _communicationStyleDescriptions =
      {
        CommunicationStyle.formal: 'Formal - use professional language',
        CommunicationStyle.semiFormal:
            'Semi-formal - friendly but professional',
        CommunicationStyle.balanced: 'Balanced - natural and friendly',
        CommunicationStyle.casual: 'Casual - relaxed and informal',
        CommunicationStyle.veryCasual: 'Very casual - casual and relaxed',
      };

  static const Map<HumorLevel, String> _humorLevelDescriptions = {
    HumorLevel.minimal: 'Minimal - serious and focused',
    HumorLevel.low: 'Low - occasional light touches',
    HumorLevel.balanced: 'Balanced - natural wit',
    HumorLevel.high: 'High - playful and witty',
    HumorLevel.veryHigh: 'Very high - very playful and humorous',
  };

  static const Map<EmotionalSupportIntensity, String>
  _emotionalSupportDescriptions = {
    EmotionalSupportIntensity.minimal: 'Minimal - matter-of-fact',
    EmotionalSupportIntensity.low: 'Low - supportive but brief',
    EmotionalSupportIntensity.balanced: 'Balanced - warm and caring',
    EmotionalSupportIntensity.high: 'High - very empathetic',
    EmotionalSupportIntensity.veryHigh: 'Very high - deeply empathetic',
  };

  static Future<String> _loadSystemPrompt() async {
    final localeCode = SettingsService.localeCode;
    final isOver18 = SettingsService.isOver18;
    final promptFile = isOver18
        ? 'system_prompt_$localeCode.json'
        : 'system_prompt_${localeCode}_safe.json';
    AppLogger.d(
      'Loading system prompt from assets/$promptFile (isOver18: $isOver18)',
    );
    try {
      final String response = await rootBundle.loadString('assets/$promptFile');
      final data = jsonDecode(response);
      final systemPrompt = data['systemPrompt'] ?? '';
      AppLogger.i('System prompt loaded successfully');
      return systemPrompt;
    } catch (e) {
      AppLogger.e('Failed to load system prompt for locale: $localeCode', e);
      AppLogger.w('Falling back to default locale: en');
      final fallbackFile = isOver18
          ? 'system_prompt_en.json'
          : 'system_prompt_en_safe.json';
      try {
        final String response = await rootBundle.loadString(
          'assets/$fallbackFile',
        );
        final data = jsonDecode(response);
        final systemPrompt = data['systemPrompt'] ?? '';
        AppLogger.i('Fallback system prompt loaded successfully');
        return systemPrompt;
      } catch (fallbackError) {
        AppLogger.e('Failed to load fallback system prompt', fallbackError);
        throw Exception('Failed to load system prompt: $e');
      }
    }
  }

  static String _buildContextPrompt(ConversationContext context) {
    final buffer = StringBuffer();

    if (context.summary.isNotEmpty) {
      buffer
        ..writeln('CONVERSATION SUMMARY:')
        ..writeln('=====================')
        ..writeln(context.summary)
        ..writeln();
    }

    if (UserProfileService.hasProfile) {
      final profile = UserProfileService.profile;
      buffer
        ..writeln('USER PROFILE:')
        ..writeln('=============');

      if (profile.nickname.isNotEmpty) {
        buffer.writeln('- User prefers to be called: ${profile.nickname}');
      }
      if (profile.displayName.isNotEmpty) {
        buffer.writeln('- Display name: ${profile.displayName}');
      }

      buffer.writeln(
        '- Communication style: ${_communicationStyleDescriptions[profile.communicationStyle]}',
      );
      buffer.writeln('- Humor: ${_humorLevelDescriptions[profile.humorLevel]}');
      buffer.writeln(
        '- Emotional support: ${_emotionalSupportDescriptions[profile.emotionalSupportIntensity]}',
      );

      if (profile.preferredTopics.isNotEmpty) {
        buffer.writeln(
          '- Preferred topics: ${profile.preferredTopics.join(', ')}',
        );
      }
      if (profile.avoidedTopics.isNotEmpty) {
        buffer.writeln(
          '- Topics to avoid: ${profile.avoidedTopics.join(', ')}',
        );
      }

      buffer.writeln();
    }

    final customInstructions =
        CustomInstructionsService.getInstructionsAsText();
    if (customInstructions.isNotEmpty) {
      buffer
        ..writeln('CUSTOM INSTRUCTIONS:')
        ..writeln('====================')
        ..writeln(customInstructions)
        ..writeln();
    }

    buffer
      ..writeln('INSTRUCTIONS:')
      ..writeln(
        '- Use this context to inform your responses and maintain continuity',
      )
      ..writeln('- Reference previous topics naturally when relevant')
      ..writeln('- Remember important details the user has shared')
      ..writeln(
        '- Build on our established friendship and conversation history',
      )
      ..writeln('- Be consistent with your personality and our relationship');

    if (UserProfileService.hasProfile) {
      buffer.writeln(
        '- Follow the user preferences and custom instructions above',
      );
    }

    return buffer.toString();
  }

  static Future<String> getCompletion(String prompt) async {
    AppLogger.d('Starting AI completion request');
    if (_apiKey.isEmpty) {
      AppLogger.w('Custom API key not configured');
      throw Exception(
        'Please configure your Ollama API key in Settings to use the app.',
      );
    }

    try {
      // Load system prompt from JSON file
      AppLogger.d('Loading system prompt');
      final baseSystemPrompt = await _loadSystemPrompt();

      // Get conversation context
      AppLogger.d('Building conversation context');
      final conversationContext = ConversationService.context;
      final contextPrompt = _buildContextPrompt(conversationContext);

      // Combine system prompt with conversation context
      final enhancedSystemPrompt = '$baseSystemPrompt\n\n$contextPrompt';
      AppLogger.d(
        'Enhanced system prompt created, length: ${enhancedSystemPrompt.length}',
      );

      AppLogger.d('API POST $_baseUrl/chat');
      final stopwatch = Stopwatch()..start();

      final chatMessages = <Map<String, String>>[
        {'role': 'system', 'content': enhancedSystemPrompt},
      ];

      for (final message in conversationContext.messages) {
        chatMessages.add({
          'role': message.isUser ? 'user' : 'assistant',
          'content': message.text,
        });
      }

      chatMessages.add({'role': 'user', 'content': prompt});

      final response = await http.post(
        Uri.parse('$_baseUrl/chat'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': _model,
          'messages': chatMessages,
          'stream': false,
        }),
      );

      stopwatch.stop();
      AppLogger.i('AI API call took ${stopwatch.elapsed.inMilliseconds}ms');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['message']['content'].trim();
        AppLogger.i(
          'AI completion successful, status: ${response.statusCode}, response length: ${content.length}',
        );
        return content;
      } else {
        AppLogger.e(
          'AI API request failed with status: ${response.statusCode}',
        );
        throw Exception(
          'Failed to get AI response: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      AppLogger.e('Error connecting to Ollama Cloud API', e);
      throw Exception('Error connecting to Ollama Cloud API: $e');
    }
  }
}
