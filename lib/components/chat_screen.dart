import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/api_key_setup_screen.dart';
import '../models/chat_state.dart';
import '../services/chat_business_logic.dart';
import '../services/chat_speech_handler.dart';
import '../services/chat_summarization_handler.dart';
import '../services/chat_safety_handler.dart';
import '../services/conversation_service.dart';
import '../services/settings_service.dart';
import '../utils/logger.dart';
import '../widgets/chat_message.dart';
import '../widgets/chat_ui_components.dart';
import '../l10n/app_localizations.dart';
import '../constants/app_theme.dart';
import 'settings_screen.dart';

/// Main chat screen component that handles the chat interface
class ChatScreen extends StatefulWidget {
  final VoidCallback? onApiKeyMissing;

  const ChatScreen({super.key, this.onApiKeyMissing});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatState _state = ChatState();
  late FocusNode _focusNode;
  late AppLocalizations _l10n;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..requestFocus();
    _initializeServices();
    _startSummarizationTimer();
    ChatSafetyHandler.resetSafetyDialogFlag(_state);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _l10n = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    _state.dispose();
    _state.summarizationTimer?.cancel();
    ChatSummarizationHandler.triggerSummarizationIfNeeded(_state);
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _initializeServices() async {
    AppLogger.i('Initializing chat screen services');
    await ConversationService.initialize();
    _restoreConversationHistory();
    await ChatSafetyHandler.initializeSafetyService();
    if (mounted) {
      await ChatSpeechHandler.initializeSpeech(
        context,
        _state,
        (fn) => setState(fn),
      );
    }
    AppLogger.i('Chat screen services initialized');
  }

  void _restoreConversationHistory() {
    final savedMessages = ConversationService.context.messages;
    if (!mounted || savedMessages.isEmpty) return;

    final restoredWidgets = savedMessages
        .map(
          (message) => ChatMessage(
            text: message.text,
            isUser: message.isUser,
            timestamp: message.timestamp,
          ),
        )
        .toList();

    setState(() {
      _state.messages
        ..clear()
        ..addAll(restoredWidgets);
    });

    AppLogger.i('Restored ${restoredWidgets.length} saved chat messages');
  }

  /// Start periodic timer for time-based summarization
  void _startSummarizationTimer() {
    ChatSummarizationHandler.startSummarizationTimer(
      _state,
      (fn) => setState(fn),
    );
  }

  /// Send a message using the business logic service
  Future<void> _sendMessage(String message) async {
    if (!SettingsService.hasApiKeyConfigured) {
      _showApiKeyRequiredDialog();
      return;
    }

    await ChatBusinessLogic.sendMessage(
      context,
      _state,
      message,
      (loading) => setState(() => _state.isLoading = loading),
      (messages) => setState(() {
        _state.messages.clear();
        _state.messages.addAll(messages);
      }),
      skipHistory: _state.isGhostMode,
    );
  }

  void _showApiKeyRequiredDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            _l10n.apiKeyRequired,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: Text(
            _l10n.configureApiKeyInSettings,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(_l10n.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ApiKeySetupScreen(isInitialSetup: false),
                  ),
                ).then((_) {
                  widget.onApiKeyMissing?.call();
                });
              },
              child: Text(_l10n.apiKey),
            ),
          ],
        );
      },
    );
  }

  /// Toggle speech recognition
  Future<void> _toggleSpeechRecognition() async {
    await ChatSpeechHandler.toggleSpeechRecognition(_state);
    setState(() {});
  }

  /// Toggle ghost mode
  void _toggleGhostMode() {
    AppLogger.userAction('Toggle ghost mode: ${!_state.isGhostMode}');

    if (!_state.isGhostMode) {
      _state.saveOriginalMessages(_state.messages);
    }

    _state.isGhostMode = !_state.isGhostMode;

    if (_state.isGhostMode) {
      _state.messages.clear();
    } else {
      _state.messages.clear();
      _state.messages.addAll(_state.getOriginalMessages());
      _state.clearOriginalMessages();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = _state.isGhostMode
        ? AppTheme.ghostTheme
        : Theme.of(context);

    return Theme(
      data: currentTheme,
      child: Builder(
        builder: (themedContext) => Focus(
          autofocus: true,
          child: KeyboardListener(
            focusNode: _focusNode,
            onKeyEvent: (KeyEvent event) {
              if (event is KeyDownEvent) {
                if (event.logicalKey == LogicalKeyboardKey.keyQ &&
                    HardwareKeyboard.instance.isControlPressed) {
                  exit(0);
                } else if (event.logicalKey == LogicalKeyboardKey.comma &&
                    HardwareKeyboard.instance.isControlPressed) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                }
              }
            },
            child: Stack(
              children: [
                ChatUIComponents.buildChatLayout(
                  context: themedContext,
                  child: _state.messages.isEmpty
                      ? ChatUIComponents.buildEmptyState(
                          themedContext,
                          _state.getLocalizedWelcomeMessage(themedContext),
                        )
                      : _state.messages.isNotEmpty
                      ? Center(child: _state.messages[0])
                      : ChatUIComponents.buildEmptyState(
                          themedContext,
                          _state.getLocalizedWelcomeMessage(themedContext),
                        ),
                  bottomInput: Row(
                    children: [
                      Expanded(
                        child: ChatUIComponents.buildInputField(
                          themedContext,
                          _state,
                          _state.getLocalizedPlaceholderText(themedContext),
                          _sendMessage,
                          _toggleSpeechRecognition,
                        ),
                      ),
                      const SizedBox(width: 12),
                      ChatUIComponents.buildSendButton(
                        themedContext,
                        _state.isLoading,
                        () => _sendMessage(_state.messageController.text),
                      ),
                    ],
                  ),
                  floatingActionButton: null,
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FloatingActionButton(
                        heroTag: 'ghost',
                        onPressed: _toggleGhostMode,
                        backgroundColor: Theme.of(
                          themedContext,
                        ).colorScheme.primary,
                        foregroundColor: Theme.of(
                          themedContext,
                        ).colorScheme.onPrimary,
                        mini: true,
                        child: Icon(
                          _state.isGhostMode
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      FloatingActionButton(
                        heroTag: 'settings',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingsScreen(),
                            ),
                          );
                        },
                        backgroundColor: Theme.of(
                          themedContext,
                        ).colorScheme.primary,
                        foregroundColor: Theme.of(
                          themedContext,
                        ).colorScheme.onPrimary,
                        mini: true,
                        child: const Icon(Icons.settings, size: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
