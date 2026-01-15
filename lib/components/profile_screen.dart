import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/user_profile_service.dart';
import '../models/user_profile.dart';
import '../l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late AppLocalizations _l10n;
  final _nicknameController = TextEditingController();
  final _displayNameController = TextEditingController();

  @override
  void dispose() {
    _nicknameController.dispose();
    _displayNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _l10n = AppLocalizations.of(context)!;
    final profile = UserProfileService.profile;

    _nicknameController.text = profile.nickname;
    _displayNameController.text = profile.displayName;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _l10n.profile,
          style: GoogleFonts.playfairDisplay(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface.withValues(alpha: 0.95),
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          children: [
            _buildNameSection(profile),
            const SizedBox(height: 24),
            _buildCommunicationStyleSection(profile),
            const SizedBox(height: 24),
            _buildHumorLevelSection(profile),
            const SizedBox(height: 24),
            _buildEmotionalSupportSection(profile),
          ],
        ),
      ),
    );
  }

  Widget _buildNameSection(UserProfile profile) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Row(
              children: [
                Icon(
                  Icons.person_outline,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  _l10n.yourName,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _l10n.nicknameDescription,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 13,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _nicknameController,
                  decoration: InputDecoration(
                    labelText: _l10n.nickname,
                    labelStyle: GoogleFonts.playfairDisplay(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: _l10n.nicknameHint,
                  ),
                  style: GoogleFonts.playfairDisplay(),
                  onChanged: (value) {
                    UserProfileService.updateNickname(value);
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  _l10n.displayNameDescription,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 13,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _displayNameController,
                  decoration: InputDecoration(
                    labelText: _l10n.displayName,
                    labelStyle: GoogleFonts.playfairDisplay(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: _l10n.displayNameHint,
                  ),
                  style: GoogleFonts.playfairDisplay(),
                  onChanged: (value) {
                    UserProfileService.updateDisplayName(value);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommunicationStyleSection(UserProfile profile) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Row(
              children: [
                Icon(
                  Icons.chat_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  _l10n.communicationStyle,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          _buildStyleOption(
            _l10n.formal,
            _l10n.formalDescription,
            CommunicationStyle.formal,
            profile.communicationStyle,
          ),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          _buildStyleOption(
            _l10n.semiFormal,
            _l10n.semiFormalDescription,
            CommunicationStyle.semiFormal,
            profile.communicationStyle,
          ),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          _buildStyleOption(
            _l10n.balanced,
            _l10n.balancedDescription,
            CommunicationStyle.balanced,
            profile.communicationStyle,
          ),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          _buildStyleOption(
            _l10n.casual,
            _l10n.casualDescription,
            CommunicationStyle.casual,
            profile.communicationStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildHumorLevelSection(UserProfile profile) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Row(
              children: [
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  _l10n.humorLevel,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          _buildHumorLevelOption(
            _l10n.minimal,
            HumorLevel.minimal,
            profile.humorLevel,
          ),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          _buildHumorLevelOption(_l10n.low, HumorLevel.low, profile.humorLevel),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          _buildHumorLevelOption(
            _l10n.balanced,
            HumorLevel.balanced,
            profile.humorLevel,
          ),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          _buildHumorLevelOption(
            _l10n.high,
            HumorLevel.high,
            profile.humorLevel,
          ),
        ],
      ),
    );
  }

  Widget _buildEmotionalSupportSection(UserProfile profile) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Row(
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  _l10n.emotionalSupport,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          _buildEmotionalSupportOption(
            _l10n.minimal,
            EmotionalSupportIntensity.minimal,
            profile.emotionalSupportIntensity,
          ),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          _buildEmotionalSupportOption(
            _l10n.low,
            EmotionalSupportIntensity.low,
            profile.emotionalSupportIntensity,
          ),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          _buildEmotionalSupportOption(
            _l10n.balanced,
            EmotionalSupportIntensity.balanced,
            profile.emotionalSupportIntensity,
          ),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          _buildEmotionalSupportOption(
            _l10n.high,
            EmotionalSupportIntensity.high,
            profile.emotionalSupportIntensity,
          ),
        ],
      ),
    );
  }

  Widget _buildStyleOption(
    String title,
    String subtitle,
    CommunicationStyle value,
    CommunicationStyle current,
  ) {
    final isSelected = value == current;
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.08)
            : null,
      ),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.playfairDisplay(
            fontSize: 12,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.7),
            height: 1.3,
          ),
        ),
        trailing: isSelected
            ? Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                width: 24,
                height: 24,
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 16,
                ),
              )
            : null,
        onTap: () {
          setState(() {
            UserProfileService.updateCommunicationStyle(value);
          });
        },
      ),
    );
  }

  Widget _buildHumorLevelOption(
    String title,
    HumorLevel value,
    HumorLevel current,
  ) {
    final isSelected = value == current;
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.08)
            : null,
      ),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        trailing: isSelected
            ? Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                width: 24,
                height: 24,
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 16,
                ),
              )
            : null,
        onTap: () {
          setState(() {
            UserProfileService.updateHumorLevel(value);
          });
        },
      ),
    );
  }

  Widget _buildEmotionalSupportOption(
    String title,
    EmotionalSupportIntensity value,
    EmotionalSupportIntensity current,
  ) {
    final isSelected = value == current;
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.08)
            : null,
      ),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        trailing: isSelected
            ? Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                width: 24,
                height: 24,
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 16,
                ),
              )
            : null,
        onTap: () {
          setState(() {
            UserProfileService.updateEmotionalSupportIntensity(value);
          });
        },
      ),
    );
  }
}
