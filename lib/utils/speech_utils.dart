import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/material.dart';
import '../widgets/floating_snackbar.dart';
import '../l10n/app_localizations.dart';
import 'platform_utils.dart';

/// Utility class for speech recognition operations
class SpeechUtils {
  /// Initialize speech recognition
  static Future<bool> initializeSpeech({
    required Function(dynamic) onError,
    required Function(String) onStatus,
  }) async {
    try {
      final speech = stt.SpeechToText();

      return await speech.initialize(onError: onError, onStatus: onStatus);
    } catch (e) {
      return false;
    }
  }

  /// Start listening for speech
  static Future<bool> startListening({
    required stt.SpeechToText speech,
    required Function(dynamic) onResult,
  }) async {
    try {
      return await speech.listen(
        onResult: onResult,
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 5),
      );
    } catch (e) {
      return false;
    }
  }

  /// Stop listening for speech
  static Future<void> stopListening(stt.SpeechToText speech) async {
    try {
      await speech.stop();
    } catch (e) {
      // Ignore errors when stopping
    }
  }

  /// Handle speech recognition errors
  static void handleSpeechError(BuildContext context, dynamic error) {
    final l10n = AppLocalizations.of(context)!;
    String errorMessage = l10n.speechRecognitionError;

    if (error.toString().contains('no speech input')) {
      errorMessage = l10n.noSpeechInputDetected;
    } else if (error.toString().contains('recognizer not available')) {
      errorMessage = l10n.speechRecognizerNotAvailable;
    } else if (error.toString().contains('permission')) {
      errorMessage = l10n.microphonePermissionDenied;
    } else if (error.toString().contains('network')) {
      errorMessage = l10n.speechNetworkError;
    } else if (error.toString().contains('timeout')) {
      errorMessage = l10n.speechRecognitionTimeout;
    }

    if (context.mounted) {
      FloatingSnackbar.show(
        context,
        message: errorMessage,
        actionLabel: error.toString().contains('permission')
            ? 'Settings'
            : null,
        onActionPressed: error.toString().contains('permission')
            ? () {
                // User should be directed to app settings
              }
            : null,
        duration: const Duration(seconds: 4),
      );
    }
  }

  /// Show platform not supported message
  static void showPlatformNotSupportedMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (context.mounted) {
      FloatingSnackbar.show(
        context,
        message: PlatformUtils.getSpeechRecognitionMessage(),
        actionLabel: l10n.gotIt,
        onActionPressed: () {},
        duration: const Duration(seconds: 6),
      );
    }
  }
}
