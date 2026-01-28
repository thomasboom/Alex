import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/settings_service.dart';
import '../services/summarization_service.dart';
import '../services/conversation_service.dart';
import '../components/profile_screen.dart';
import '../components/custom_instructions_screen.dart';
import '../services/user_profile_service.dart';
import '../services/custom_instructions_service.dart';
import '../utils/logger.dart';
import '../l10n/app_localizations.dart';

/// Settings screen for app preferences and configuration
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late AppLocalizations _l10n;

  @override
  Widget build(BuildContext context) {
    _l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _l10n.settings,
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
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        _buildLanguageSection(),
        const SizedBox(height: 24),
        _buildThemeSection(),
        const SizedBox(height: 24),
        _buildColorPaletteSection(),
        const SizedBox(height: 24),
        _buildApiSection(),
        const SizedBox(height: 24),
        _buildPersonalizationSection(),
        const SizedBox(height: 24),
        _buildSecuritySection(),
        const SizedBox(height: 24),
        _buildDataSection(),
        const SizedBox(height: 24),
        _buildDisclaimerSection(),
      ],
    );
  }

  Widget _buildDisclaimerSection() {
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
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  _l10n.disclaimer,
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
                  _l10n.disclaimerText,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 13,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSection() {
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
                  Icons.language_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  _l10n.language,
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
                  _l10n.chooseLanguage,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 13,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.outline.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildLanguageOption(title: _l10n.english, value: 'en'),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildLanguageOption(title: _l10n.dutch, value: 'nl'),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildLanguageOption(title: _l10n.spanish, value: 'es'),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildLanguageOption(title: _l10n.french, value: 'fr'),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildLanguageOption(title: _l10n.german, value: 'de'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption({required String title, required String value}) {
    final isSelected = SettingsService.localeCode == value;

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
        onTap: () async {
          setState(() {
            SettingsService.setSetting('locale', value);
          });
          await SettingsService.saveSettings();
        },
      ),
    );
  }

  Widget _buildThemeSection() {
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
                  Icons.palette_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  _l10n.appearance,
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
            child: _buildThemeModeSetting(),
          ),
        ],
      ),
    );
  }

  Widget _buildColorPaletteSection() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.05),
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
                  Icons.color_lens_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  _l10n.colorPalette,
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
                  _l10n.primaryColor,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  _l10n.chooseColorTheme,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 13,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.outline.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildColorOption(
                        title: _l10n.colorBlue,
                        color: Colors.blue,
                        value: 'blue',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorPurple,
                        color: Colors.purple,
                        value: 'purple',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorGreen,
                        color: Colors.green,
                        value: 'green',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorOrange,
                        color: Colors.orange,
                        value: 'orange',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorPink,
                        color: Colors.pink,
                        value: 'pink',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorTeal,
                        color: Colors.teal,
                        value: 'teal',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorIndigo,
                        color: Colors.indigo,
                        value: 'indigo',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorCyan,
                        color: Colors.cyan,
                        value: 'cyan',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorAmber,
                        color: Colors.amber,
                        value: 'amber',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorLime,
                        color: Colors.lime,
                        value: 'lime',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorBrown,
                        color: Colors.brown,
                        value: 'brown',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorDeepPurple,
                        color: Colors.deepPurple,
                        value: 'deepPurple',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorDeepOrange,
                        color: Colors.deepOrange,
                        value: 'deepOrange',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorLightBlue,
                        color: Colors.lightBlue,
                        value: 'lightBlue',
                        settingKey: 'primaryColor',
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                      _buildColorOption(
                        title: _l10n.colorYellow,
                        color: Colors.yellow,
                        value: 'yellow',
                        settingKey: 'primaryColor',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorOption({
    required String title,
    required Color color,
    required String value,
    required String settingKey,
  }) {
    final isSelected = SettingsService.settings[settingKey] == value;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? color.withValues(alpha: 0.08) : null,
      ),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected
                  ? color
                  : Theme.of(
                      context,
                    ).colorScheme.outline.withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          width: 32,
          height: 32,
        ),
        title: Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        trailing: isSelected
            ? Container(
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                width: 24,
                height: 24,
                child: const Icon(Icons.check, color: Colors.white, size: 16),
              )
            : null,
        onTap: () => _updateSetting(settingKey, value),
      ),
    );
  }

  Widget _buildApiSection() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.05),
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
                  Icons.api_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  _l10n.apiConfiguration,
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
            child: _buildApiKeySetting(),
          ),
        ],
      ),
    );
  }

  Widget _buildApiKeySetting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _l10n.customApiKey,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _l10n.enterCustomApiKeyDesc,
          style: GoogleFonts.playfairDisplay(
            fontSize: 13,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.7),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 20),
        _buildCustomApiKeyInput(),
        const SizedBox(height: 24),
        _buildModelSetting(),
        const SizedBox(height: 24),
        _buildEndpointSetting(),
      ],
    );
  }

  Widget _buildPersonalizationSection() {
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
                  _l10n.personalization,
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
          _buildPersonalizationOption(
            _l10n.profile,
            _l10n.personalizationDesc,
            Icons.edit_outlined,
            () => _openProfileScreen(),
          ),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          _buildPersonalizationOption(
            _l10n.customInstructions,
            _l10n.customInstructionsHint,
            Icons.lightbulb_outline,
            () => _openCustomInstructionsScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalizationOption(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        width: 40,
        height: 40,
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.playfairDisplay(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.playfairDisplay(
          fontSize: 12,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
          height: 1.3,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
      ),
      onTap: onTap,
    );
  }

  void _openProfileScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
    if (result == true && mounted) {
      setState(() {});
    }
  }

  void _openCustomInstructionsScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CustomInstructionsScreen()),
    );
    if (result == true && mounted) {
      setState(() {});
    }
  }

  Widget _buildSecuritySection() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.05),
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
                  Icons.security_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  _l10n.security,
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
            child: _buildPinLockSetting(),
          ),
        ],
      ),
    );
  }

  Widget _buildPinLockSetting() {
    final isPinLockEnabled = SettingsService.pinLockEnabled;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _l10n.pinLock,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isPinLockEnabled
                        ? _l10n.pinLockEnabledDesc
                        : _l10n.pinLockDisabledDesc,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 13,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.7),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: isPinLockEnabled,
              onChanged: (value) {
                if (value) {
                  _showSetPinDialog();
                } else {
                  _showDisablePinDialog();
                }
              },
            ),
          ],
        ),
        if (isPinLockEnabled) ...[
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.2),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ElevatedButton.icon(
              onPressed: _showChangePinDialog,
              icon: const Icon(Icons.edit_outlined),
              label: Text(
                _l10n.changePin,
                style: GoogleFonts.playfairDisplay(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDataSection() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.05),
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
                  Icons.storage_outlined,
                  color: Theme.of(context).colorScheme.error,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  _l10n.dataManagement,
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
              children: [
                _buildExportButton(),
                const SizedBox(height: 24),
                Container(
                  height: 1,
                  color: Theme.of(
                    context,
                  ).colorScheme.outline.withValues(alpha: 0.1),
                ),
                const SizedBox(height: 24),
                _buildDeleteHistoryButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeModeSetting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _l10n.themePreference,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _l10n.chooseThemeDesc,
          style: GoogleFonts.playfairDisplay(
            fontSize: 13,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.7),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            children: [
              _buildThemeOption(
                title: _l10n.system,
                subtitle: _l10n.followSystemTheme,
                value: 'system',
                icon: Icons.smartphone_outlined,
              ),
              Divider(
                height: 1,
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.2),
              ),
              _buildThemeOption(
                title: _l10n.light,
                subtitle: _l10n.alwaysLightTheme,
                value: 'light',
                icon: Icons.light_mode_outlined,
              ),
              Divider(
                height: 1,
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.2),
              ),
              _buildThemeOption(
                title: _l10n.dark,
                subtitle: _l10n.alwaysDarkTheme,
                value: 'dark',
                icon: Icons.dark_mode_outlined,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildThemeOption({
    required String title,
    required String subtitle,
    required String value,
    required IconData icon,
  }) {
    final isSelected = SettingsService.themeMode == value;

    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.08)
            : null,
      ),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(
                      context,
                    ).colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          width: 40,
          height: 40,
          child: Icon(
            icon,
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
            size: 20,
          ),
        ),
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
        onTap: () => _updateSetting('themeMode', value),
      ),
    );
  }

  Widget _buildExportButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _l10n.exportConversations,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _l10n.exportConversationsDesc,
          style: GoogleFonts.playfairDisplay(
            fontSize: 13,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.7),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.2),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ElevatedButton.icon(
            onPressed: _exportConversations,
            icon: const Icon(Icons.description_outlined),
            label: Text(
              _l10n.exportToPlainText,
              style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.2),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ElevatedButton.icon(
            onPressed: _exportConversationsJSON,
            icon: const Icon(Icons.code_outlined),
            label: Text(
              _l10n.exportToJSON,
              style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeleteHistoryButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _l10n.clearData,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _l10n.clearDataWarning,
          style: GoogleFonts.playfairDisplay(
            fontSize: 13,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.7),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withValues(alpha: 0.2),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ElevatedButton.icon(
            onPressed: _showDeleteConfirmationDialog,
            icon: const Icon(Icons.warning_amber_outlined),
            label: Text(
              _l10n.permanentlyDeleteAlex,
              style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
          ),
        ),
      ],
    );
  }

  void _updateSetting(String key, dynamic value) {
    setState(() {
      SettingsService.setSetting(key, value);
      SettingsService.saveSettings();
    });
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            _l10n.permanentlyDeleteConfirmTitle,
            style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600),
          ),
          content: Text(
            _l10n.permanentlyDeleteConfirmDesc,
            style: GoogleFonts.playfairDisplay(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(_l10n.cancel, style: GoogleFonts.playfairDisplay()),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteAllHistory();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
              ),
              child: Text(
                _l10n.deletePermanently,
                style: GoogleFonts.playfairDisplay(),
              ),
            ),
          ],
        );
      },
    );
  }

  void _deleteAllHistory() async {
    try {
      await SettingsService.clearAllHistory();
      SummarizationService.clearAllMemories();
      UserProfileService.clearProfile();
      CustomInstructionsService.clearAllInstructions();
      SettingsService.resetSettings();
      await SettingsService.saveSettings();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _l10n.alexDeletedSuccess,
              style: GoogleFonts.playfairDisplay(),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
        Future.delayed(const Duration(seconds: 2), () {
          SystemNavigator.pop();
        });
      }
    } catch (e) {
      AppLogger.e('Error deleting history', e);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _l10n.deleteFailed,
              style: GoogleFonts.playfairDisplay(),
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  void _exportConversations() async {
    try {
      final content = await ConversationService.exportToPlainText();

      final timestamp = DateTime.now().toIso8601String().split('T')[0];
      final defaultFileName = 'alex_conversations_$timestamp.txt';

      final result = await FilePicker.platform.saveFile(
        dialogTitle: _l10n.saveExportedConversations,
        fileName: defaultFileName,
        type: FileType.custom,
        allowedExtensions: ['txt'],
      );

      if (result == null) {
        AppLogger.i('User cancelled file picker');
        return;
      }

      await ConversationService.saveExportToPath(content, result);

      if (!mounted) return;

      _showSuccessSnackBar(_l10n.exportSuccess);
    } catch (e) {
      AppLogger.e('Error exporting conversations', e);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _l10n.exportFailed,
              style: GoogleFonts.playfairDisplay(),
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  void _exportConversationsJSON() async {
    try {
      final content = await ConversationService.exportToJSON();

      final timestamp = DateTime.now().toIso8601String().split('T')[0];
      final defaultFileName = 'alex_conversations_$timestamp.json';

      final result = await FilePicker.platform.saveFile(
        dialogTitle: _l10n.saveExportedConversationsJSON,
        fileName: defaultFileName,
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result == null) {
        AppLogger.i('User cancelled file picker');
        return;
      }

      await ConversationService.saveExportToPath(content, result);

      if (!mounted) return;

      _showSuccessSnackBar(_l10n.exportJSONSuccess);
    } catch (e) {
      AppLogger.e('Error exporting conversations to JSON', e);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _l10n.exportFailed,
              style: GoogleFonts.playfairDisplay(),
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  void _showSetPinDialog() {
    String newPin = '';
    String confirmPin = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                _l10n.setPinLock,
                style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _l10n.enterPinToSecure,
                    style: GoogleFonts.playfairDisplay(),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: _l10n.newPin,
                      labelStyle: GoogleFonts.playfairDisplay(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: _l10n.pinFieldHint,
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    obscureText: true,
                    style: GoogleFonts.playfairDisplay(),
                    onChanged: (value) => setState(() => newPin = value),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: _l10n.confirmPin,
                      labelStyle: GoogleFonts.playfairDisplay(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: _l10n.pinFieldHint,
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    obscureText: true,
                    style: GoogleFonts.playfairDisplay(),
                    onChanged: (value) => setState(() => confirmPin = value),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    _l10n.cancel,
                    style: GoogleFonts.playfairDisplay(),
                  ),
                ),
                ElevatedButton(
                  onPressed: (newPin.length == 4 && newPin == confirmPin)
                      ? () {
                          SettingsService.setPinLock(newPin);
                          Navigator.of(context).pop();
                          _showSuccessSnackBar(_l10n.pinLockEnabledSuccess);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: Text(
                    _l10n.setPin,
                    style: GoogleFonts.playfairDisplay(),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showDisablePinDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            _l10n.disablePinLock,
            style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600),
          ),
          content: Text(
            _l10n.disablePinLockDesc,
            style: GoogleFonts.playfairDisplay(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(_l10n.cancel, style: GoogleFonts.playfairDisplay()),
            ),
            ElevatedButton(
              onPressed: () {
                SettingsService.disablePinLock();
                Navigator.of(context).pop();
                _showSuccessSnackBar(_l10n.pinLockDisabledSuccess);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                foregroundColor: Theme.of(context).colorScheme.onTertiary,
              ),
              child: Text(_l10n.disable, style: GoogleFonts.playfairDisplay()),
            ),
          ],
        );
      },
    );
  }

  void _showChangePinDialog() {
    String currentPin = '';
    String newPin = '';
    String confirmPin = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                _l10n.changePin,
                style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: _l10n.currentPin,
                      labelStyle: GoogleFonts.playfairDisplay(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    obscureText: true,
                    style: GoogleFonts.playfairDisplay(),
                    onChanged: (value) => setState(() => currentPin = value),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: _l10n.newPin,
                      labelStyle: GoogleFonts.playfairDisplay(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: _l10n.pinFieldHint,
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    obscureText: true,
                    style: GoogleFonts.playfairDisplay(),
                    onChanged: (value) => setState(() => newPin = value),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: _l10n.confirmNewPin,
                      labelStyle: GoogleFonts.playfairDisplay(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: _l10n.pinFieldHint,
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    obscureText: true,
                    style: GoogleFonts.playfairDisplay(),
                    onChanged: (value) => setState(() => confirmPin = value),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    _l10n.cancel,
                    style: GoogleFonts.playfairDisplay(),
                  ),
                ),
                ElevatedButton(
                  onPressed:
                      (currentPin.length == 4 &&
                          newPin.length == 4 &&
                          newPin == confirmPin &&
                          SettingsService.verifyPin(currentPin))
                      ? () {
                          SettingsService.setPinLock(newPin);
                          Navigator.of(context).pop();
                          _showSuccessSnackBar(_l10n.pinChangedSuccess);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: Text(
                    _l10n.changePin,
                    style: GoogleFonts.playfairDisplay(),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.playfairDisplay()),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildCustomApiKeyInput() {
    final customApiKey = SettingsService.customApiKey;
    final TextEditingController apiKeyController = TextEditingController(
      text: customApiKey,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.security_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _l10n.apiKeySecurityNote,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.primary,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: apiKeyController,
          decoration: InputDecoration(
            labelText: _l10n.apiKey,
            labelStyle: GoogleFonts.playfairDisplay(),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: _l10n.enterApiKey,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          style: GoogleFonts.playfairDisplay(),
          obscureText: true,
          onChanged: (value) {
            if (value.isNotEmpty) {
              SettingsService.setCustomApiKey(value);
            }
          },
        ),
      ],
    );
  }

  Widget _buildModelSetting() {
    final selectedModel = SettingsService.customModel;
    final modelOptions = [
      'deepseek-v3.1:671b',
      'ministral-3:14b-cloud',
      'gpt-oss:20b-cloud',
      'devstral-small-2:24b-cloud',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _l10n.model,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _l10n.enterModelDesc,
          style: GoogleFonts.playfairDisplay(
            fontSize: 13,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.7),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: modelOptions.contains(selectedModel)
                  ? selectedModel
                  : modelOptions[0],
              dropdownColor: Theme.of(context).colorScheme.surface,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              style: GoogleFonts.playfairDisplay(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              items: modelOptions.map((model) {
                return DropdownMenuItem<String>(
                  value: model,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _getModelDisplayName(model),
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  SettingsService.setCustomModel(value);
                  setState(() {});
                  _showSuccessSnackBar(
                    'Model changed to ${_getModelDisplayName(value)}',
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  String _getModelDisplayName(String model) {
    switch (model) {
      case 'deepseek-v3.1:671b':
        return 'DeepSeek v3.1 (671B) - Recommended';
      case 'ministral-3:14b-cloud':
        return 'Mistral 3 (14B Cloud)';
      case 'gpt-oss:20b-cloud':
        return 'GPT-OSS (20B Cloud)';
      case 'devstral-small-2:24b-cloud':
        return 'Devstral Small 2 (24B Cloud)';
      default:
        return model;
    }
  }

  Widget _buildEndpointSetting() {
    final customEndpoint = SettingsService.apiEndpoint;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _l10n.apiEndpoint,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _l10n.enterEndpointDesc,
          style: GoogleFonts.playfairDisplay(
            fontSize: 13,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.7),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: TextField(
            controller: TextEditingController(text: customEndpoint),
            decoration: InputDecoration(
              labelText: _l10n.apiEndpoint,
              labelStyle: GoogleFonts.playfairDisplay(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: _l10n.endpointPlaceholder,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            style: GoogleFonts.playfairDisplay(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onSubmitted: (value) {
              if (value.trim().isNotEmpty) {
                SettingsService.setApiEndpoint(value.trim());
                _showSuccessSnackBar(_l10n.apiEndpointUpdated);
              }
            },
          ),
        ),
      ],
    );
  }
}
