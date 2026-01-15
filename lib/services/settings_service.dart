import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:crypto/crypto.dart';
import '../utils/logger.dart';
import 'conversation_service.dart';

/// Service for managing user settings and preferences
class SettingsService {
  static const String _fileName = 'user_settings.json';

  // Supported locales
  static const List<String> supportedLocales = ['en', 'nl', 'es', 'fr'];

  // Default settings - theme and security preferences
  static const Map<String, dynamic> _defaultSettings = {
    'themeMode': 'system',
    'pinLockEnabled': false,
    'pinCode': '',
    'apiKeySource': 'custom',
    'customApiKey': '',
    'primaryColor': 'blue',
    'accentColor': 'blue',
    'apiEndpoint': 'https://ollama.com/api',
    'customModel': 'deepseek-v3.1:671b',
    'locale': 'en',
  };

  static Map<String, dynamic> _settings = Map.from(_defaultSettings);

  // Stream controller for theme changes
  static final StreamController<String> _themeController =
      StreamController<String>.broadcast();
  static Stream<String> get themeChangeStream => _themeController.stream;

  // Stream controller for color changes
  static final StreamController<String> _colorController =
      StreamController<String>.broadcast();
  static Stream<String> get colorChangeStream => _colorController.stream;

  // Stream controller for locale changes
  static final StreamController<String> _localeController =
      StreamController<String>.broadcast();
  static Stream<String> get localeChangeStream => _localeController.stream;

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }

  static Map<String, dynamic> get settings => Map.from(_settings);

  /// Load settings from local storage
  static Future<void> loadSettings() async {
    AppLogger.d('Loading user settings from local storage');
    try {
      final file = await _localFile;
      if (await file.exists()) {
        final contents = await file.readAsString();
        final data = jsonDecode(contents);
        _settings = Map.from(_defaultSettings)..addAll(data);
        AppLogger.i('User settings loaded successfully');
      } else {
        AppLogger.i('No existing settings file found, using defaults');
        _settings = Map.from(_defaultSettings);
      }
    } catch (e) {
      AppLogger.e('Error loading user settings', e);
      _settings = Map.from(_defaultSettings);
    }
  }

  /// Save settings to local storage
  static Future<void> saveSettings() async {
    AppLogger.d('Saving user settings to local storage');
    try {
      final file = await _localFile;
      final contents = jsonEncode(_settings);
      await file.writeAsString(contents);
      AppLogger.i('User settings saved successfully');
    } catch (e) {
      AppLogger.e('Error saving user settings', e);
    }
  }

  /// Get a specific setting value
  static T getSetting<T>(String key, T defaultValue) {
    return _settings.containsKey(key) ? _settings[key] as T : defaultValue;
  }

  /// Set a specific setting value
  static void setSetting(String key, dynamic value) {
    // Validate locale before setting
    if (key == 'locale' && value is String) {
      if (!supportedLocales.contains(value)) {
        AppLogger.w('Invalid locale: $value, defaulting to en');
        value = 'en';
      }
    }

    _settings[key] = value;
    AppLogger.d('Setting updated: $key = $value');

    // Notify listeners if theme mode changed
    if (key == 'themeMode') {
      _themeController.add(value);
    }

    // Notify listeners if color settings changed
    if (key == 'primaryColor' || key == 'accentColor') {
      _colorController.add(value);
    }

    // Notify listeners if locale changed
    if (key == 'locale') {
      _localeController.add(value);
    }
  }

  /// Reset settings to default
  static void resetSettings() {
    _settings = Map.from(_defaultSettings);
    AppLogger.i('User settings reset to defaults');
  }

  // Convenience getters for settings
  static String get themeMode => getSetting('themeMode', 'system');
  static bool get pinLockEnabled => getSetting('pinLockEnabled', false);
  static String get pinCode => getSetting('pinCode', '');
  static String get apiKeySource => getSetting('apiKeySource', 'custom');
  static String get customApiKey => getSetting('customApiKey', '');
  static String get primaryColor => getSetting('primaryColor', 'blue');
  static String get accentColor => getSetting('accentColor', 'blue');
  static String get apiEndpoint =>
      getSetting('apiEndpoint', 'https://ollama.com/api');
  static String get customModel =>
      getSetting('customModel', 'deepseek-v3.1:671b');

  static String get localeCode {
    final locale = getSetting('locale', 'en');
    return supportedLocales.contains(locale) ? locale : 'en';
  }

  static bool get hasApiKeyConfigured {
    return apiKeySource == 'custom' && customApiKey.isNotEmpty;
  }

  static Locale get locale => Locale(localeCode);

  /// Set PIN lock with hashed password
  static void setPinLock(String pin) {
    final hashedPin = _hashPin(pin);
    setSetting('pinCode', hashedPin);
    setSetting('pinLockEnabled', true);
    saveSettings();
    AppLogger.i('PIN lock enabled with new PIN');
  }

  /// Disable PIN lock
  static void disablePinLock() {
    setSetting('pinCode', '');
    setSetting('pinLockEnabled', false);
    saveSettings();
    AppLogger.i('PIN lock disabled');
  }

  /// Verify PIN against stored hash
  static bool verifyPin(String pin) {
    if (!pinLockEnabled || pinCode.isEmpty) {
      return true; // No PIN set, always allow access
    }

    final hashedInput = _hashPin(pin);
    return hashedInput == pinCode;
  }

  /// Hash PIN using SHA-256 for secure storage
  static String _hashPin(String pin) {
    final bytes = utf8.encode(pin);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Set API key source (inbuilt or custom)
  static void setApiKeySource(String source) {
    setSetting('apiKeySource', source);
    saveSettings();
    AppLogger.i('API key source set to: $source');
  }

  /// Set custom API key
  static void setCustomApiKey(String apiKey) {
    setSetting('customApiKey', apiKey);
    saveSettings();
    AppLogger.i('Custom API key updated');
  }

  /// Get the current API key based on the selected source
  static String getCurrentApiKey() {
    if (apiKeySource == 'custom' && customApiKey.isNotEmpty) {
      return customApiKey;
    }
    return '';
  }

  /// Set custom API endpoint
  static void setApiEndpoint(String endpoint) {
    setSetting('apiEndpoint', endpoint);
    saveSettings();
    AppLogger.i('API endpoint set to: $endpoint');
  }

  /// Set custom model
  static void setCustomModel(String model) {
    setSetting('customModel', model);
    saveSettings();
    AppLogger.i('Custom model set to: $model');
  }

  /// Clear all conversation history
  static Future<void> clearAllHistory() async {
    AppLogger.i('Clearing all conversation history');
    await ConversationService.clearAllHistory();
  }
}
