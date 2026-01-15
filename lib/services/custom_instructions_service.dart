import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/memory_segment.dart';
import '../utils/logger.dart';

class CustomInstruction {
  final String id;
  final String text;
  final bool isActive;
  final DateTime createdAt;

  CustomInstruction({
    String? id,
    required this.text,
    this.isActive = true,
    DateTime? createdAt,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString(),
       createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'isActive': isActive,
    'createdAt': createdAt.toIso8601String(),
  };

  factory CustomInstruction.fromJson(Map<String, dynamic> json) =>
      CustomInstruction(
        id: json['id'],
        text: json['text'],
        isActive: json['isActive'] ?? true,
        createdAt: DateTime.parse(json['createdAt']),
      );

  CustomInstruction copyWith({
    String? id,
    String? text,
    bool? isActive,
    DateTime? createdAt,
  }) {
    return CustomInstruction(
      id: id ?? this.id,
      text: text ?? this.text,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class CustomInstructionsService {
  static const String _instructionsKey = 'custom_instructions';
  static List<CustomInstruction> _instructions = [];
  static SharedPreferences? _prefs;

  static final StreamController<List<CustomInstruction>>
  _instructionsController =
      StreamController<List<CustomInstruction>>.broadcast();
  static Stream<List<CustomInstruction>> get instructionsStream =>
      _instructionsController.stream;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await loadInstructions();
  }

  static Future<void> loadInstructions() async {
    AppLogger.d('Loading custom instructions from shared preferences');
    try {
      final instructionsJson = _prefs?.getString(_instructionsKey);
      if (instructionsJson != null) {
        final List<dynamic> decoded = json.decode(instructionsJson);
        _instructions = decoded
            .map((item) => CustomInstruction.fromJson(item))
            .toList();
        AppLogger.i('Loaded ${_instructions.length} custom instructions');
      } else {
        _instructions = [];
        AppLogger.i('No existing custom instructions found');
      }
      _instructionsController.add(List.from(_instructions));
    } catch (e) {
      AppLogger.e('Error loading custom instructions', e);
      _instructions = [];
    }
  }

  static Future<void> saveInstructions() async {
    AppLogger.d('Saving custom instructions to shared preferences');
    try {
      final instructionsJson = json.encode(
        _instructions.map((i) => i.toJson()).toList(),
      );
      await _prefs?.setString(_instructionsKey, instructionsJson);
      AppLogger.i('Saved ${_instructions.length} custom instructions');
      _instructionsController.add(List.from(_instructions));
    } catch (e) {
      AppLogger.e('Error saving custom instructions', e);
    }
  }

  static List<CustomInstruction> get instructions =>
      List.from(_instructions.where((i) => i.isActive));

  static List<CustomInstruction> get allInstructions =>
      List.from(_instructions);

  static String getInstructionsAsText() {
    final activeInstructions = instructions;
    if (activeInstructions.isEmpty) return '';
    return activeInstructions.map((i) => '- ${i.text}').join('\n');
  }

  static Future<void> addInstruction(String text) async {
    final instruction = CustomInstruction(text: text);
    _instructions.add(instruction);
    await saveInstructions();
    AppLogger.i('Added custom instruction: $text');
  }

  static Future<void> updateInstruction(String id, String newText) async {
    final index = _instructions.indexWhere((i) => i.id == id);
    if (index != -1) {
      _instructions[index] = _instructions[index].copyWith(text: newText);
      await saveInstructions();
      AppLogger.i('Updated custom instruction: $id');
    }
  }

  static Future<void> toggleInstruction(String id) async {
    final index = _instructions.indexWhere((i) => i.id == id);
    if (index != -1) {
      _instructions[index] = _instructions[index].copyWith(
        isActive: !_instructions[index].isActive,
      );
      await saveInstructions();
      AppLogger.i('Toggled custom instruction: $id');
    }
  }

  static Future<void> deleteInstruction(String id) async {
    _instructions.removeWhere((i) => i.id == id);
    await saveInstructions();
    AppLogger.i('Deleted custom instruction: $id');
  }

  static Future<void> reorderInstructions(
    List<CustomInstruction> reordered,
  ) async {
    _instructions = reordered;
    await saveInstructions();
    AppLogger.i('Reordered custom instructions');
  }

  static void clearAllInstructions() {
    _instructions.clear();
    saveInstructions();
    AppLogger.i('Cleared all custom instructions');
  }

  static void dispose() {
    _instructionsController.close();
  }
}

class ManualMemory {
  final String id;
  final String content;
  final MemoryType type;
  final double importance;
  final List<String> tags;
  final DateTime createdAt;
  final bool isManuallyAdded;

  ManualMemory({
    String? id,
    required this.content,
    this.type = MemoryType.longTerm,
    this.importance = 0.8,
    this.tags = const [],
    DateTime? createdAt,
    this.isManuallyAdded = true,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString(),
       createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'type': type.toString(),
    'importance': importance,
    'tags': tags,
    'createdAt': createdAt.toIso8601String(),
    'isManuallyAdded': isManuallyAdded,
  };

  factory ManualMemory.fromJson(Map<String, dynamic> json) => ManualMemory(
    id: json['id'],
    content: json['content'],
    type: MemoryType.values.firstWhere(
      (e) => e.toString() == json['type'],
      orElse: () => MemoryType.longTerm,
    ),
    importance: json['importance'] ?? 0.8,
    tags: (json['tags'] as List<dynamic>?)?.cast<String>() ?? [],
    createdAt: DateTime.parse(json['createdAt']),
    isManuallyAdded: json['isManuallyAdded'] ?? true,
  );

  MemorySegment toMemorySegment() {
    return MemorySegment(
      id: id,
      content: content,
      type: type,
      importance: importance,
      created: createdAt,
      lastAccessed: createdAt,
      accessCount: 1,
      topics: tags,
      metadata: {'isManuallyAdded': true, 'source': 'manual'},
    );
  }
}

class ManualMemoryService {
  static const String _memoriesKey = 'manual_memories';
  static List<ManualMemory> _memories = [];
  static SharedPreferences? _prefs;

  static final StreamController<List<ManualMemory>> _memoriesController =
      StreamController<List<ManualMemory>>.broadcast();
  static Stream<List<ManualMemory>> get memoriesStream =>
      _memoriesController.stream;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await loadMemories();
  }

  static Future<void> loadMemories() async {
    AppLogger.d('Loading manual memories from shared preferences');
    try {
      final memoriesJson = _prefs?.getString(_memoriesKey);
      if (memoriesJson != null) {
        final List<dynamic> decoded = json.decode(memoriesJson);
        _memories = decoded.map((item) => ManualMemory.fromJson(item)).toList();
        AppLogger.i('Loaded ${_memories.length} manual memories');
      } else {
        _memories = [];
        AppLogger.i('No existing manual memories found');
      }
      _memoriesController.add(List.from(_memories));
    } catch (e) {
      AppLogger.e('Error loading manual memories', e);
      _memories = [];
    }
  }

  static Future<void> saveMemories() async {
    AppLogger.d('Saving manual memories to shared preferences');
    try {
      final memoriesJson = json.encode(
        _memories.map((m) => m.toJson()).toList(),
      );
      await _prefs?.setString(_memoriesKey, memoriesJson);
      AppLogger.i('Saved ${_memories.length} manual memories');
      _memoriesController.add(List.from(_memories));
    } catch (e) {
      AppLogger.e('Error saving manual memories', e);
    }
  }

  static List<ManualMemory> get memories => List.from(_memories);

  static List<MemorySegment> getMemorySegments() {
    return _memories.map((m) => m.toMemorySegment()).toList();
  }

  static Future<void> addMemory(ManualMemory memory) async {
    _memories.add(memory);
    await saveMemories();
    AppLogger.i('Added manual memory: ${memory.content.substring(0, 50)}...');
  }

  static Future<void> addQuickMemory(
    String content, {
    MemoryType type = MemoryType.longTerm,
    List<String> tags = const [],
  }) async {
    final memory = ManualMemory(content: content, type: type, tags: tags);
    await addMemory(memory);
  }

  static Future<void> updateMemory(String id, ManualMemory updated) async {
    final index = _memories.indexWhere((m) => m.id == id);
    if (index != -1) {
      _memories[index] = updated;
      await saveMemories();
      AppLogger.i('Updated manual memory: $id');
    }
  }

  static Future<void> deleteMemory(String id) async {
    _memories.removeWhere((m) => m.id == id);
    await saveMemories();
    AppLogger.i('Deleted manual memory: $id');
  }

  static ManualMemory? getMemoryById(String id) {
    try {
      return _memories.firstWhere((m) => m.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<ManualMemory> searchMemories(String query) {
    final lowerQuery = query.toLowerCase();
    return _memories
        .where(
          (m) =>
              m.content.toLowerCase().contains(lowerQuery) ||
              m.tags.any((t) => t.toLowerCase().contains(lowerQuery)),
        )
        .toList();
  }

  static void clearAllMemories() {
    _memories.clear();
    saveMemories();
    AppLogger.i('Cleared all manual memories');
  }

  static int get memoryCount => _memories.length;

  static void dispose() {
    _memoriesController.close();
  }
}
