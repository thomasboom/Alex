import 'package:flutter/material.dart';
import '../models/chat_state.dart';
import '../services/conversation_service.dart';
import '../services/ollama_service.dart';
import '../services/safety_service.dart';
import '../utils/logger.dart';
import '../widgets/chat_message.dart';
import '../widgets/help_resources_dialog.dart';
import '../l10n/app_localizations.dart';

/// Business logic service for chat functionality
class ChatBusinessLogic {
  /// Send a message
  static Future<void> sendMessage(
    BuildContext context,
    ChatState state,
    String message,
    Function(bool) setLoading,
    Function(List<ChatMessage>) updateMessages, {
    bool skipHistory = false,
  }) async {
    if (message.trim().isEmpty) return;

    AppLogger.userAction('Send message');

    // Check for sensitive content before processing
    if (SafetyService.containsSensitiveContent(message)) {
      AppLogger.w('Sensitive content detected in user message');
      await handleSensitiveContent(
        context,
        state,
        setLoading,
        updateMessages,
        skipHistory: skipHistory,
      );
      return;
    }

    if (!skipHistory) {
      ConversationService.addMessage(message, true);
    }

    state.messageController.clear();
    state.focusNode.requestFocus();

    setLoading(true);
    updateMessages([
      ChatMessage(
        text: "",
        isUser: false,
        timestamp: DateTime.now(),
        isLoading: true,
      ),
    ]);

    try {
      AppLogger.d('Getting AI response for user message');
      final aiResponse = await getAIResponse(message);

      if (!skipHistory) {
        ConversationService.addMessage(aiResponse, false);
      }

      updateMessages([
        ChatMessage(
          text: aiResponse,
          isUser: false,
          timestamp: DateTime.now(),
          isLoading: false,
        ),
      ]);

      AppLogger.i('AI response sent to user, length: ${aiResponse.length}');
    } catch (e) {
      AppLogger.e('Failed to get AI response', e);
      if (!context.mounted) return;
      final l10n = AppLocalizations.of(context)!;
      updateMessages([
        ChatMessage(
          text: l10n.messageProcessingError,
          isUser: false,
          timestamp: DateTime.now(),
          isLoading: false,
        ),
      ]);
    } finally {
      setLoading(false);
      if (!skipHistory) {
        await ConversationService.saveContext();
      }
    }
  }

  /// Get AI response from Ollama service
  static Future<String> getAIResponse(String userMessage) async {
    return await OllamaService.getCompletion(userMessage);
  }

  /// Handle sensitive content by showing help resources
  static Future<void> handleSensitiveContent(
    BuildContext context,
    ChatState state,
    Function(bool) setLoading,
    Function(List<ChatMessage>) updateMessages, {
    bool skipHistory = false,
  }) async {
    AppLogger.i('Handling sensitive content with help resources');

    state.messageController.clear();
    state.focusNode.requestFocus();

    if (state.safetyDialogShownThisSession) {
      AppLogger.i(
        'Safety dialog already shown this session, showing brief reminder',
      );

      updateMessages([
        ChatMessage(
          text:
              "I've noticed you're struggling. Please consider reaching out to a crisis hotline - they have trained professionals who can help. Resources like the 988 Lifeline are available 24/7.",
          isUser: false,
          timestamp: DateTime.now(),
          isLoading: false,
        ),
      ]);
      setLoading(false);
      return;
    }

    final helpResources = SafetyService.getHelpResources();
    final safeResponse = SafetyService.generateSafeResponse();

    updateMessages([
      ChatMessage(
        text: safeResponse,
        isUser: false,
        timestamp: DateTime.now(),
        isLoading: false,
      ),
    ]);

    setLoading(false);

    await Future.delayed(const Duration(milliseconds: 500));
    if (context.mounted) {
      await showHelpResourcesDialog(
        context: context,
        helpResources: helpResources,
        onClose: () => state.safetyDialogShownThisSession = true,
      );
    }
  }
}
