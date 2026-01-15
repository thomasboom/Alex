import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';
import '../utils/logger.dart';
import 'conversation_service.dart';

class SettingsService {
  static const String _settingsPrefix = 'settings_';

  static const List<String> supportedLocales = ['en', 'nl', 'es', 'fr'];

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
    'isOver18': false,
  };

  static Map<String, dynamic> _settings = Map.from(_defaultSettings);
  static SharedPreferences? _prefs;

  static final StreamController<String> _themeController =
      StreamController<String>.broadcast();
  static Stream<String> get themeChangeStream => _themeController.stream;

  static final StreamController<String> _colorController =
      StreamController<String>.broadcast();
  static Stream<String> get colorChangeStream => _colorController.stream;

  static final StreamController<String> _localeController =
      StreamController<String>.broadcast();
  static Stream<String> get localeChangeStream => _localeController.stream;

  static Map<String, dynamic> get settings => Map.from(_settings);

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await loadSettings();
  }

  static Future<void> loadSettings() async {
    AppLogger.d('Loading user settings from shared preferences');
    try {
      _settings = Map.from(_defaultSettings);
      for (final key in _defaultSettings.keys) {
        final fullKey = '$_settingsPrefix$key';
        final value = _prefs?.get(fullKey);
        if (value != null) {
          _settings[key] = value;
        }
      }
      AppLogger.i('User settings loaded successfully');
    } catch (e) {
      AppLogger.e('Error loading user settings', e);
      _settings = Map.from(_defaultSettings);
    }
  }

  static Future<void> saveSettings() async {
    AppLogger.d('Saving user settings to shared preferences');
    try {
      for (final entry in _settings.entries) {
        final fullKey = '$_settingsPrefix${entry.key}';
        final value = entry.value;
        if (value is String) {
          await _prefs?.setString(fullKey, value);
        } else if (value is bool) {
          await _prefs?.setBool(fullKey, value);
        } else if (value is int) {
          await _prefs?.setInt(fullKey, value);
        } else if (value is double) {
          await _prefs?.setDouble(fullKey, value);
        } else if (value is List<String>) {
          await _prefs?.setStringList(fullKey, value);
        }
      }
      AppLogger.i('User settings saved successfully');
    } catch (e) {
      AppLogger.e('Error saving user settings', e);
    }
  }

  static T getSetting<T>(String key, T defaultValue) {
    return _settings.containsKey(key) ? _settings[key] as T : defaultValue;
  }

  static void setSetting(String key, dynamic value) {
    if (key == 'locale' && value is String) {
      if (!supportedLocales.contains(value)) {
        AppLogger.w('Invalid locale: $value, defaulting to en');
        value = 'en';
      }
    }

    _settings[key] = value;
    AppLogger.d('Setting updated: $key = $value');

    if (key == 'themeMode') {
      _themeController.add(value);
    }

    if (key == 'primaryColor' || key == 'accentColor') {
      _colorController.add(value);
    }

    if (key == 'locale') {
      _localeController.add(value);
    }
  }

  static void resetSettings() {
    _settings = Map.from(_defaultSettings);
    AppLogger.i('User settings reset to defaults');
  }

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

  static bool get isOver18 => getSetting('isOver18', false);

  static bool get hasApiKeyConfigured {
    return apiKeySource == 'custom' && customApiKey.isNotEmpty;
  }

  static Locale get locale => Locale(localeCode);

  static void setPinLock(String pin) {
    final hashedPin = _hashPin(pin);
    setSetting('pinCode', hashedPin);
    setSetting('pinLockEnabled', true);
    saveSettings();
    AppLogger.i('PIN lock enabled with new PIN');
  }

  static void disablePinLock() {
    setSetting('pinCode', '');
    setSetting('pinLockEnabled', false);
    saveSettings();
    AppLogger.i('PIN lock disabled');
  }

  static bool verifyPin(String pin) {
    if (!pinLockEnabled || pinCode.isEmpty) {
      return true;
    }

    final hashedInput = _hashPin(pin);
    return hashedInput == pinCode;
  }

  static String _hashPin(String pin) {
    final bytes = utf8.encode(pin);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static void setApiKeySource(String source) {
    setSetting('apiKeySource', source);
    saveSettings();
    AppLogger.i('API key source set to: $source');
  }

  static void setCustomApiKey(String apiKey) {
    setSetting('customApiKey', apiKey);
    saveSettings();
    AppLogger.i('Custom API key updated');
  }

  static String getCurrentApiKey() {
    if (apiKeySource == 'custom' && customApiKey.isNotEmpty) {
      return customApiKey;
    }
    return '';
  }

  static void setApiEndpoint(String endpoint) {
    setSetting('apiEndpoint', endpoint);
    saveSettings();
    AppLogger.i('API endpoint set to: $endpoint');
  }

  static void setCustomModel(String model) {
    setSetting('customModel', model);
    saveSettings();
    AppLogger.i('Custom model set to: $model');
  }

  static void setIsOver18(bool value) {
    setSetting('isOver18', value);
    saveSettings();
    AppLogger.i('Age verification set to: $value');
  }

  static Future<void> clearAllHistory() async {
    AppLogger.i('Clearing all conversation history');
    await ConversationService.clearAllHistory();
  }
}
