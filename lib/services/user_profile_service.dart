import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_profile.dart';
import '../utils/logger.dart';

class UserProfileService {
  static const String _profileKey = 'user_profile';
  static UserProfile? _profile;
  static SharedPreferences? _prefs;

  static final StreamController<UserProfile> _profileController =
      StreamController<UserProfile>.broadcast();
  static Stream<UserProfile> get profileChangeStream =>
      _profileController.stream;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await loadProfile();
  }

  static Future<void> loadProfile() async {
    AppLogger.d('Loading user profile from shared preferences');
    try {
      final profileJson = _prefs?.getString(_profileKey);
      if (profileJson != null) {
        _profile = UserProfile.fromJson(json.decode(profileJson));
        AppLogger.i('User profile loaded successfully');
      } else {
        _profile = UserProfile();
        AppLogger.i('No existing profile found, created new profile');
      }
      _profileController.add(_profile!);
    } catch (e) {
      AppLogger.e('Error loading user profile', e);
      _profile = UserProfile();
    }
  }

  static Future<void> saveProfile() async {
    if (_profile == null) return;
    AppLogger.d('Saving user profile to shared preferences');
    try {
      final profileJson = json.encode(_profile!.toJson());
      await _prefs?.setString(_profileKey, profileJson);
      AppLogger.i('User profile saved successfully');
      _profileController.add(_profile!);
    } catch (e) {
      AppLogger.e('Error saving user profile', e);
    }
  }

  static UserProfile get profile {
    if (_profile == null) {
      throw Exception(
        'UserProfileService not initialized. Call initialize() first.',
      );
    }
    return _profile!;
  }

  static bool get hasProfile => _profile != null;

  static void updateProfile(UserProfile updatedProfile) {
    _profile = updatedProfile.copyWith(updatedAt: DateTime.now());
    saveProfile();
  }

  static void updateNickname(String nickname) {
    if (_profile == null) return;
    _profile = _profile!.copyWith(
      nickname: nickname,
      updatedAt: DateTime.now(),
    );
    saveProfile();
  }

  static void updateDisplayName(String displayName) {
    if (_profile == null) return;
    _profile = _profile!.copyWith(
      displayName: displayName,
      updatedAt: DateTime.now(),
    );
    saveProfile();
  }

  static void updateCommunicationStyle(CommunicationStyle style) {
    if (_profile == null) return;
    _profile = _profile!.copyWith(
      communicationStyle: style,
      updatedAt: DateTime.now(),
    );
    saveProfile();
  }

  static void updateHumorLevel(HumorLevel level) {
    if (_profile == null) return;
    _profile = _profile!.copyWith(humorLevel: level, updatedAt: DateTime.now());
    saveProfile();
  }

  static void updateEmotionalSupportIntensity(
    EmotionalSupportIntensity intensity,
  ) {
    if (_profile == null) return;
    _profile = _profile!.copyWith(
      emotionalSupportIntensity: intensity,
      updatedAt: DateTime.now(),
    );
    saveProfile();
  }

  static void addPreferredTopic(String topic) {
    if (_profile == null) return;
    final topics = List<String>.from(_profile!.preferredTopics);
    if (!topics.contains(topic)) {
      topics.add(topic);
      _profile = _profile!.copyWith(
        preferredTopics: topics,
        updatedAt: DateTime.now(),
      );
      saveProfile();
    }
  }

  static void removePreferredTopic(String topic) {
    if (_profile == null) return;
    final topics = List<String>.from(_profile!.preferredTopics);
    topics.remove(topic);
    _profile = _profile!.copyWith(
      preferredTopics: topics,
      updatedAt: DateTime.now(),
    );
    saveProfile();
  }

  static void addAvoidedTopic(String topic) {
    if (_profile == null) return;
    final topics = List<String>.from(_profile!.avoidedTopics);
    if (!topics.contains(topic)) {
      topics.add(topic);
      _profile = _profile!.copyWith(
        avoidedTopics: topics,
        updatedAt: DateTime.now(),
      );
      saveProfile();
    }
  }

  static void removeAvoidedTopic(String topic) {
    if (_profile == null) return;
    final topics = List<String>.from(_profile!.avoidedTopics);
    topics.remove(topic);
    _profile = _profile!.copyWith(
      avoidedTopics: topics,
      updatedAt: DateTime.now(),
    );
    saveProfile();
  }

  static void updateCustomInstructions(String instructions) {
    if (_profile == null) return;
    _profile = _profile!.copyWith(
      customInstructions: instructions,
      updatedAt: DateTime.now(),
    );
    saveProfile();
  }

  static String getUserName() {
    if (_profile == null) return '';
    return _profile!.nickname.isNotEmpty
        ? _profile!.nickname
        : _profile!.displayName;
  }

  static void clearProfile() {
    _profile = UserProfile();
    saveProfile();
    AppLogger.i('User profile cleared');
  }

  static void dispose() {
    _profileController.close();
  }
}
