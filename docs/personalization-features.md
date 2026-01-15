# Alex AI Companion - Personalization Features

## Overview
This document outlines features to make Alex more personal and engaging as an AI companion.

---

## ✅ 1. User Profile Section (IMPLEMENTED)

### Description
Add a dedicated profile section where users can explicitly define their preferences and personal information.

### Features Implemented
- **Name/Nickname**: User can set how Alex should address them ✅
- **Communication Style**: Formal, casual, or somewhere in between ✅
- **Humor Level**: Minimal, balanced, or high humor ✅
- **Emotional Support Intensity**: Light, moderate, or extensive emotional support ✅

### Features NOT Implemented
- Preferred Topics (planned)
- Topics to Avoid (planned)
- Content Calibration (planned)

### Implementation Files
- `lib/models/user_profile.dart` - Model for user preferences
- `lib/services/user_profile_service.dart` - Service to manage profile data
- `lib/components/profile_screen.dart` - UI for profile editing
- `lib/components/settings_screen.dart` - Link to profile section

---

## 2. Manual Memory Control (PLANNED)

### Description
Allow users to explicitly save, edit, and delete memories beyond the automatic extraction system.

### Features
- **"Remember This" Button**: In-message context menu to save important information
- **Memory Editor**: UI to view and modify saved memories
- **Memory Search**: Query "what do you remember about me?"
- **Forget Specific Memories**: Delete individual memories

### Implementation Files
- `lib/services/custom_instructions_service.dart` - Has manual memory service
- `lib/components/chat_screen.dart` - Add message context menu
- `lib/components/memory_editor_screen.dart` - New UI for memory management

---

## ✅ 3. Custom Instructions (IMPLEMENTED)

### Description
Allow users to add personal guidelines that Alex follows in conversations.

### Features Implemented
- **Free-form Instructions**: Open text field for custom rules ✅
- **Enable/Disable Instructions**: Toggle instructions on/off ✅
- **Delete Instructions**: Remove individual instructions ✅

### System Prompt Integration
Custom instructions are injected into every AI request via `OllamaService._buildContextPrompt()`.

### Implementation Files
- `lib/services/custom_instructions_service.dart` - Service for custom instructions
- `lib/components/custom_instructions_screen.dart` - UI for managing instructions
- `lib/services/ollama_service.dart` - Injects custom instructions into system prompt
- `lib/components/settings_screen.dart` - Link to custom instructions

---

## 4. Relationship Tracking (PLANNED)

### Description
Track conversation milestones and shared experiences to create a sense of growing connection.

### Features
- **Conversation Milestones**: 1st conversation, 1 week, 1 month, 100 messages
- **Topics Explored**: Track topics the user has discussed
- **Shared Memories Count**: Show how many memories Alex has of the user
- **Relationship Level**: Tiered system (New Friend → Close Companion → Best Friends)

### Implementation Files
- `lib/services/relationship_tracker.dart` - (planned)
- `lib/models/relationship_state.dart` - (planned)
- `lib/components/relationship_status_card.dart` - (planned)

---

## 5. Adaptive Personality (PLANNED)

### Description
Dynamically adjust Alex's personality based on user interactions and feedback.

### Features
- **Implicit Learning**: Adjust based on user engagement patterns
- **Explicit Feedback**: Thumbs up/down on responses
- **Topic Adaptation**: Mirror user's enthusiasm about shared interests

### Implementation Files
- `lib/services/personality_adapter.dart` - (planned)
- `lib/models/personality_config.dart` - (planned)
- `lib/components/chat_screen.dart` - Add feedback buttons (planned)

---

## 6. Memory Search UI (PLANNED)

### Description
Transparent interface for users to query what Alex remembers about them.

### Features
- **Natural Language Query**: "What do you remember about me?"
- **Categorized View**: Memories organized by topic
- **Memory Details**: Show when memory was created, importance level

### Implementation Files
- `lib/components/memory_search_screen.dart` - (planned)
- `lib/services/memory_search_service.dart` - (planned)

---

## Implementation Priority

### ✅ Phase 1 (Completed)
1. User Profile Section
2. Custom Instructions

### Phase 2 (Next)
3. Manual Memory Control ("Remember This" feature)
4. Memory Search UI

### Phase 3 (Later)
5. Relationship Tracking
6. Adaptive Personality

---

## File Changes Summary

### ✅ New Files Created
- `lib/models/user_profile.dart`
- `lib/services/user_profile_service.dart`
- `lib/services/custom_instructions_service.dart`
- `lib/components/profile_screen.dart`
- `lib/components/custom_instructions_screen.dart`
- `docs/personalization-features.md`

### ✅ Files Modified
- `lib/services/ollama_service.dart` - Inject user preferences and custom instructions
- `lib/components/settings_screen.dart` - Added Personalization section
- `lib/main.dart` - Added service initialization
- `lib/l10n/*.arb` - Added localization strings

### Files to Create (Planned)
- `lib/services/relationship_tracker.dart`
- `lib/models/relationship_state.dart`
- `lib/services/personality_adapter.dart`
- `lib/components/memory_editor_screen.dart`
- `lib/components/memory_search_screen.dart`
- `lib/components/relationship_status_card.dart`

---

## Testing Strategy

### Unit Tests (Planned)
- User profile serialization/deserialization
- Custom instruction CRUD operations
- Relationship level calculations

### Widget Tests (Planned)
- Profile screen editing flow
- Custom instructions management
- Settings navigation

---

## Future Enhancements

1. **Manual Memory Control**: "Remember This" button in chat
2. **Memory Search**: Query what Alex remembers about you
3. **Relationship Tracking**: Milestones and friendship levels
4. **Multi-modal Memories**: Store images, voice notes as memories
5. **Adaptive Personality**: Learn from user feedback
