import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:async';
import '../constants/chat_constants.dart';
import '../widgets/chat_message.dart';
import '../l10n/app_localizations.dart';

/// State management class for chat screen
class ChatState {
  // Controllers
  final TextEditingController messageController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  // Messages and UI state
  final List<ChatMessage> messages = [];
  bool isLoading = false;

  // Current dynamic content
  late String currentWelcomeMessage;

  // Speech recognition state
  late stt.SpeechToText speech;
  bool isListening = false;
  bool speechEnabled = false;
  String lastWords = '';

  // Summarization state
  Timer? summarizationTimer;
  DateTime? lastSummarizationTime;

  // Safety state
  bool safetyDialogShownThisSession = false;

  /// Constructor - initialize dynamic content
  ChatState() {
    currentWelcomeMessage = _getRandomWelcomeMessage();
  }

  /// Get a random welcome message from available options
  String _getRandomWelcomeMessage() {
    final random =
        DateTime.now().millisecondsSinceEpoch %
        ChatConstants.welcomeMessages.length;
    return ChatConstants.welcomeMessages[random];
  }

  /// Get localized welcome message
  String getLocalizedWelcomeMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return l10n.welcomeMessage;
  }

  /// Get localized placeholder text
  String getLocalizedPlaceholderText(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return l10n.placeholderText;
  }

  /// Refresh the welcome message with localized version
  void refreshWelcomeMessage() {
    currentWelcomeMessage = _getRandomWelcomeMessage();
  }

  /// Dispose of all resources
  void dispose() {
    focusNode.dispose();
    messageController.dispose();
    speech.stop();
    summarizationTimer?.cancel();
  }
}
