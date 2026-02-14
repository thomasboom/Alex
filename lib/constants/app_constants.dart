/// Application-wide constants
library;

import 'package:flutter/material.dart';

/// Application-wide constants
class AppConstants {
  // App metadata
  static const String appName = 'Alex';

  // Speech recognition
  static const Duration speechListenDuration = Duration(seconds: 30);
  static const Duration speechPauseDuration = Duration(seconds: 5);

  // Animation durations
  static const Duration snackbarAnimationDuration = Duration(milliseconds: 300);
  static const Duration snackbarShowDuration = Duration(seconds: 4);

  // Message limits for summarization (optimized for efficiency)
  static const int summarizationThreshold = 100;
  static const int summarizationUpdateThreshold = 200;
  static const int summarizationTimeIntervalMinutes = 60;
  static const int maxMessagesForContext = 200;

  // UI spacing and sizing
  static const double chatBubbleMaxWidth = 0.8;
  static const double glowEffectWidth = 180;
  static const EdgeInsets inputPadding = EdgeInsets.all(20);
  static const EdgeInsets messageMargin = EdgeInsets.only(bottom: 24);

  // File names
  static const String conversationContextFile = 'conversation_context.json';
  static const String envFileName = 'assets/.env';

  // Welcome messages for variety in the chat interface
  static const List<String> welcomeMessages = [
    "Hey, whatsup?",
    "What's on your mind today?",
    "I'm here whenever you're ready to chat.",
    "How are you feeling right now?",
    "Ready for a good conversation?",
    "What's been happening in your world?",
    "I'm all ears if you need to talk.",
    "How can I brighten your day?",
    "What's the latest adventure in your life?",
    "Got any exciting plans brewing?",
    "How's your energy level today?",
    "What's making you smile lately?",
    "Care to share what's on your heart?",
    "What's the best thing that happened today?",
    "I'm curious - what's been inspiring you?",
    "How can I make your day better?",
    "What's the most interesting thought you've had today?",
    "Feeling chatty? I'm all yours!",
    "What's cooking in that brilliant mind of yours?",
    "How are you doing, really?",
    "What's the highlight of your week so far?",
    "Got any dreams or goals you're working on?",
    "What's something you're grateful for today?",
    "How can I help you unwind?",
    "What's the most fun thing you've done recently?",
    "I'm here and ready to listen!",
    "What's been challenging you lately?",
    "How can I bring some joy to your day?",
    "What's something you're looking forward to?",
    "Care for some friendly conversation?",
    "What's the best advice you've received lately?",
    "How are you taking care of yourself today?",
    "What's something that always makes you laugh?",
    "I'm genuinely interested - how are you?",
    "What's been the most surprising thing lately?",
    "How can I be a good friend to you right now?",
    "What's something you're passionate about?",
    "Feeling reflective? I'm here to chat.",
    "What's the most beautiful thing you've seen today?",
    "How can I help you feel more at ease?",
  ];

  // Input placeholder texts for variety
  static const List<String> placeholderTexts = [
    "Express yourself...",
    "What's on your mind?",
    "Share your thoughts...",
    "Type your message...",
    "How are you feeling?",
    "What's happening?",
    "Tell me something...",
    "I'm listening...",
    "Your thoughts matter...",
    "Speak your mind...",
    "What's new with you?",
    "How can I help?",
    "Let's talk about...",
    "Share what's on your heart...",
    "I'm here for you...",
    "What's bothering you?",
    "What's making you happy?",
    "Tell me more...",
    "I want to hear...",
    "Your story matters...",
  ];

  // Private constructor to prevent instantiation
  AppConstants._();
}
