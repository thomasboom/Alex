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

  /// Generic method to update profile fields
  static void updateField({
    String? nickname,
    String? displayName,
    CommunicationStyle? communicationStyle,
    HumorLevel? humorLevel,
    EmotionalSupportIntensity? emotionalSupportIntensity,
    String? customInstructions,
    List<String>? preferredTopics,
    List<String>? avoidedTopics,
  }) {
    if (_profile == null) return;
    _profile = _profile!.copyWith(
      nickname: nickname,
      displayName: displayName,
      communicationStyle: communicationStyle,
      humorLevel: humorLevel,
      emotionalSupportIntensity: emotionalSupportIntensity,
      customInstructions: customInstructions,
      preferredTopics: preferredTopics,
      avoidedTopics: avoidedTopics,
      updatedAt: DateTime.now(),
    );
    saveProfile();
  }

  /// Update entire profile
  static void updateProfile(UserProfile updatedProfile) {
    _profile = updatedProfile.copyWith(updatedAt: DateTime.now());
    saveProfile();
  }

  /// Toggle a topic in the preferred or avoided list
  static void toggleTopic(
    String topic, {
    required bool isPreferred,
    required bool add,
  }) {
    if (_profile == null) return;
    final currentList = isPreferred
        ? List<String>.from(_profile!.preferredTopics)
        : List<String>.from(_profile!.avoidedTopics);

    if (add && !currentList.contains(topic)) {
      currentList.add(topic);
    } else if (!add) {
      currentList.remove(topic);
    } else {
      return; // No change needed
    }

    updateField(
      preferredTopics: isPreferred ? currentList : null,
      avoidedTopics: isPreferred ? null : currentList,
    );
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
