class UserProfile {
  String id;
  String displayName;
  String nickname;
  List<String> preferredTopics;
  List<String> avoidedTopics;
  CommunicationStyle communicationStyle;
  ContentPreference contentPreference;
  HumorLevel humorLevel;
  EmotionalSupportIntensity emotionalSupportIntensity;
  String customInstructions;
  DateTime createdAt;
  DateTime updatedAt;

  UserProfile({
    String? id,
    this.displayName = '',
    this.nickname = '',
    this.preferredTopics = const [],
    this.avoidedTopics = const [],
    this.communicationStyle = CommunicationStyle.balanced,
    this.contentPreference = ContentPreference.adult,
    this.humorLevel = HumorLevel.balanced,
    this.emotionalSupportIntensity = EmotionalSupportIntensity.balanced,
    this.customInstructions = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString(),
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'displayName': displayName,
    'nickname': nickname,
    'preferredTopics': preferredTopics,
    'avoidedTopics': avoidedTopics,
    'communicationStyle': communicationStyle.toString(),
    'contentPreference': contentPreference.toString(),
    'humorLevel': humorLevel.toString(),
    'emotionalSupportIntensity': emotionalSupportIntensity.toString(),
    'customInstructions': customInstructions,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json['id'],
    displayName: json['displayName'] ?? '',
    nickname: json['nickname'] ?? '',
    preferredTopics:
        (json['preferredTopics'] as List<dynamic>?)?.cast<String>() ?? [],
    avoidedTopics:
        (json['avoidedTopics'] as List<dynamic>?)?.cast<String>() ?? [],
    communicationStyle: _parseCommunicationStyle(json['communicationStyle']),
    contentPreference: _parseContentPreference(json['contentPreference']),
    humorLevel: _parseHumorLevel(json['humorLevel']),
    emotionalSupportIntensity: _parseEmotionalSupportIntensity(
      json['emotionalSupportIntensity'],
    ),
    customInstructions: json['customInstructions'] ?? '',
    createdAt: json['createdAt'] != null
        ? DateTime.parse(json['createdAt'])
        : DateTime.now(),
    updatedAt: json['updatedAt'] != null
        ? DateTime.parse(json['updatedAt'])
        : DateTime.now(),
  );

  static CommunicationStyle _parseCommunicationStyle(String? value) {
    if (value == null) return CommunicationStyle.balanced;
    return CommunicationStyle.values.firstWhere(
      (e) => e.toString() == value,
      orElse: () => CommunicationStyle.balanced,
    );
  }

  static ContentPreference _parseContentPreference(String? value) {
    if (value == null) return ContentPreference.adult;
    return ContentPreference.values.firstWhere(
      (e) => e.toString() == value,
      orElse: () => ContentPreference.adult,
    );
  }

  static HumorLevel _parseHumorLevel(String? value) {
    if (value == null) return HumorLevel.balanced;
    return HumorLevel.values.firstWhere(
      (e) => e.toString() == value,
      orElse: () => HumorLevel.balanced,
    );
  }

  static EmotionalSupportIntensity _parseEmotionalSupportIntensity(
    String? value,
  ) {
    if (value == null) return EmotionalSupportIntensity.balanced;
    return EmotionalSupportIntensity.values.firstWhere(
      (e) => e.toString() == value,
      orElse: () => EmotionalSupportIntensity.balanced,
    );
  }

  UserProfile copyWith({
    String? id,
    String? displayName,
    String? nickname,
    List<String>? preferredTopics,
    List<String>? avoidedTopics,
    CommunicationStyle? communicationStyle,
    ContentPreference? contentPreference,
    HumorLevel? humorLevel,
    EmotionalSupportIntensity? emotionalSupportIntensity,
    String? customInstructions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      nickname: nickname ?? this.nickname,
      preferredTopics: preferredTopics ?? this.preferredTopics,
      avoidedTopics: avoidedTopics ?? this.avoidedTopics,
      communicationStyle: communicationStyle ?? this.communicationStyle,
      contentPreference: contentPreference ?? this.contentPreference,
      humorLevel: humorLevel ?? this.humorLevel,
      emotionalSupportIntensity:
          emotionalSupportIntensity ?? this.emotionalSupportIntensity,
      customInstructions: customInstructions ?? this.customInstructions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

enum CommunicationStyle { formal, semiFormal, balanced, casual, veryCasual }

enum ContentPreference { general, teen, mature, adult }

enum HumorLevel { minimal, low, balanced, high, veryHigh }

enum EmotionalSupportIntensity { minimal, low, balanced, high, veryHigh }
