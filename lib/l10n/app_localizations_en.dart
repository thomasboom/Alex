// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Alex - AI Companion';

  @override
  String get appName => 'Alex';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get enterPinSubtitle => 'Enter your PIN to access the app';

  @override
  String get incorrectPin => 'Incorrect PIN. Please try again.';

  @override
  String get settings => 'Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get colorPalette => 'Color Palette';

  @override
  String get primaryColor => 'Primary Color';

  @override
  String get chooseColorTheme => 'Choose the main color theme for the app';

  @override
  String get apiConfiguration => 'API Configuration';

  @override
  String get apiKeySource => 'API Key Source';

  @override
  String get chooseApiKeySource =>
      'Choose whether to use the inbuilt API key or provide your own custom key';

  @override
  String get inbuiltApiKeyWarning =>
      '⚠️ Inbuilt API key will hit rate limits much sooner. Custom keys provide higher limits and better performance.';

  @override
  String get inbuiltApiKey => 'Inbuilt API Key';

  @override
  String get usePreconfiguredKey => 'Use the pre-configured API key';

  @override
  String get customApiKey => 'Custom API Key';

  @override
  String get customKeyConfigured => 'Custom key is configured';

  @override
  String get enterOwnApiKey => 'Enter your own API key';

  @override
  String get security => 'Security';

  @override
  String get pinLock => 'PIN Lock';

  @override
  String get pinLockEnabledDesc => 'App is protected with a PIN code';

  @override
  String get pinLockDisabledDesc => 'Secure your app with a 4-digit PIN';

  @override
  String get changePin => 'Change PIN';

  @override
  String get dataManagement => 'Data Management';

  @override
  String get exportConversations => 'Export Conversations';

  @override
  String get exportConversationsDesc =>
      'Export your conversation history to a plain text file for backup or sharing.';

  @override
  String get exportToPlainText => 'Export to Plain Text';

  @override
  String get exportToJSON => 'Export to JSON';

  @override
  String get clearData => 'Clear Data';

  @override
  String get clearDataWarning =>
      'Permanently delete Alex, including all conversation history and memories. This action cannot be undone.';

  @override
  String get permanentlyDeleteAlex => 'Permanently Delete Alex';

  @override
  String get themePreference => 'Theme Preference';

  @override
  String get chooseThemeDesc => 'Choose how the app looks and feels';

  @override
  String get system => 'System';

  @override
  String get followSystemTheme => 'Follow system theme';

  @override
  String get light => 'Light';

  @override
  String get alwaysLightTheme => 'Always use light theme';

  @override
  String get dark => 'Dark';

  @override
  String get alwaysDarkTheme => 'Always use dark theme';

  @override
  String get permanentlyDeleteConfirmTitle => 'Permanently Delete Alex?';

  @override
  String get permanentlyDeleteConfirmDesc =>
      'This action cannot be undone. Alex and all conversation history will be permanently deleted.';

  @override
  String get cancel => 'Cancel';

  @override
  String get deletePermanently => 'Delete Permanently';

  @override
  String get alexDeletedSuccess =>
      'Alex permanently deleted. All memories and conversation history removed.';

  @override
  String get deleteFailed =>
      'Failed to permanently delete Alex. Please try again.';

  @override
  String get exportSuccess => 'Conversations exported successfully';

  @override
  String get exportJSONSuccess => 'Conversations exported to JSON successfully';

  @override
  String get exportFailed =>
      'Failed to export conversations. Please try again.';

  @override
  String get saveExportedConversations => 'Save Exported Conversations';

  @override
  String get saveExportedConversationsJSON =>
      'Save Exported Conversations (JSON)';

  @override
  String get setPinLock => 'Set PIN Lock';

  @override
  String get enterPinToSecure => 'Enter a 4-digit PIN to secure your app';

  @override
  String get newPin => 'New PIN';

  @override
  String get confirmPin => 'Confirm PIN';

  @override
  String get setPin => 'Set PIN';

  @override
  String get pinLockEnabledSuccess => 'PIN lock enabled successfully';

  @override
  String get disablePinLock => 'Disable PIN Lock?';

  @override
  String get disablePinLockDesc =>
      'Are you sure you want to disable PIN lock? Your app will no longer require a PIN to access.';

  @override
  String get pinLockDisabledSuccess => 'PIN lock disabled';

  @override
  String get disable => 'Disable';

  @override
  String get currentPin => 'Current PIN';

  @override
  String get confirmNewPin => 'Confirm New PIN';

  @override
  String get pinChangedSuccess => 'PIN changed successfully';

  @override
  String get customApiKeyLabel => 'Custom API Key';

  @override
  String get enterCustomApiKeyDesc =>
      'Enter your custom Ollama API key. You can get one from https://ollama.com/settings/keys';

  @override
  String get apiKeySecurityNote =>
      '🔒 Your API key is stored securely on your device only and is never transmitted to our servers.';

  @override
  String get apiKey => 'API Key';

  @override
  String get enterApiKey => 'Enter your API key...';

  @override
  String get model => 'Model';

  @override
  String get enterModelDesc =>
      'Enter the Ollama model to use (e.g., llama3, mistral)';

  @override
  String get modelPlaceholder => 'e.g. llama3';

  @override
  String get apiEndpoint => 'API Endpoint';

  @override
  String get enterEndpointDesc => 'Enter the Ollama API endpoint URL';

  @override
  String get endpointPlaceholder => 'https://api.ollama.com';

  @override
  String get apiEndpointUpdated => 'API endpoint updated';

  @override
  String get enterPin => 'Enter PIN';

  @override
  String get enterPinToContinue => 'Please enter your 4-digit PIN to continue';

  @override
  String get useDifferentMethod => 'Use Different Method';

  @override
  String get typeAMessage => 'Type a message...';

  @override
  String get chatEmpty => 'How can I help you today?';

  @override
  String get welcomeMessage => 'Hey, whatsup?';

  @override
  String get placeholderText => 'What\'s on your mind?';

  @override
  String get language => 'Language';

  @override
  String get chooseLanguage => 'Choose your preferred language';

  @override
  String get english => 'English';

  @override
  String get dutch => 'Dutch';

  @override
  String get spanish => 'Spanish';

  @override
  String get french => 'French';

  @override
  String get colorBlue => 'Blue';

  @override
  String get colorPurple => 'Purple';

  @override
  String get colorGreen => 'Green';

  @override
  String get colorOrange => 'Orange';

  @override
  String get colorPink => 'Pink';

  @override
  String get colorTeal => 'Teal';

  @override
  String get colorIndigo => 'Indigo';

  @override
  String get colorCyan => 'Cyan';

  @override
  String get colorAmber => 'Amber';

  @override
  String get colorLime => 'Lime';

  @override
  String get colorBrown => 'Brown';

  @override
  String get colorDeepPurple => 'Deep Purple';

  @override
  String get colorDeepOrange => 'Deep Orange';

  @override
  String get colorLightBlue => 'Light Blue';

  @override
  String get colorYellow => 'Yellow';

  @override
  String get disclaimer => 'Proof of Concept';

  @override
  String get disclaimerText =>
      'This application is a Proof of Concept (PoC) and NOT a full-featured production application. It is experimental software for demonstration and development purposes only. The AI may produce unexpected, inaccurate, or inappropriate responses. Security features are for demonstration only and not suitable for protecting sensitive data. Use at your own risk.';
}
