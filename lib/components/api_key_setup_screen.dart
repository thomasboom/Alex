import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/settings_service.dart';
import '../l10n/app_localizations.dart';
import '../l10n/app_localizations_en.dart';

class ApiKeySetupScreen extends StatefulWidget {
  final bool isInitialSetup;
  final VoidCallback? onCompleted;

  const ApiKeySetupScreen({
    super.key,
    this.isInitialSetup = true,
    this.onCompleted,
  });

  @override
  State<ApiKeySetupScreen> createState() => _ApiKeySetupScreenState();
}

class _ApiKeySetupScreenState extends State<ApiKeySetupScreen> {
  final TextEditingController _apiKeyController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _endpointController = TextEditingController();
  bool _isSaving = false;
  bool _obscureApiKey = true;
  bool _isOver18 = false;
  String _selectedModel = 'deepseek-v3.1:671b';

  final List<String> _modelOptions = [
    'deepseek-v3.1:671b',
    'ministral-3:14b-cloud',
    'gpt-oss:20b-cloud',
    'devstral-small-2:24b-cloud',
  ];

  @override
  void initState() {
    super.initState();
    _apiKeyController.text = SettingsService.customApiKey;
    _modelController.text = SettingsService.customModel;
    _selectedModel = _modelOptions.contains(SettingsService.customModel)
        ? SettingsService.customModel
        : _modelOptions[0];
    _endpointController.text = SettingsService.apiEndpoint;
    _isOver18 = SettingsService.isOver18;
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    _modelController.dispose();
    _endpointController.dispose();
    super.dispose();
  }

  Future<void> _saveApiKey() async {
    if (_apiKeyController.text.trim().isEmpty) {
      _showErrorSnackBar('Please enter your API key');
      return;
    }

    setState(() => _isSaving = true);

    try {
      SettingsService.setCustomApiKey(_apiKeyController.text.trim());
      SettingsService.setCustomModel(_selectedModel);
      SettingsService.setApiEndpoint(_endpointController.text.trim());
      SettingsService.setIsOver18(_isOver18);

      if (mounted) {
        if (widget.isInitialSetup && widget.onCompleted != null) {
          widget.onCompleted!();
        } else {
          Navigator.of(context).pop(true);
        }
      }
    } catch (e) {
      _showErrorSnackBar('Failed to save API key. Please try again.');
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.playfairDisplay()),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context) ?? AppLocalizationsEn();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface.withValues(alpha: 0.98),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!widget.isInitialSetup)
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        _buildHeader(l10n),
                        const SizedBox(height: 32),
                        _buildApiKeyInput(l10n),
                        const SizedBox(height: 24),
                        _buildModelInput(l10n),
                        const SizedBox(height: 24),
                        _buildEndpointInput(l10n),
                        const SizedBox(height: 24),
                        _buildAgeVerification(l10n),
                        const SizedBox(height: 32),
                        _buildSaveButton(l10n),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.isInitialSetup ? l10n.welcomeMessage : l10n.settings,
          style: GoogleFonts.playfairDisplay(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          widget.isInitialSetup
              ? 'To start using Alex, you need to configure your Ollama API key.'
              : 'Update your Ollama API configuration.',
          style: GoogleFonts.playfairDisplay(
            fontSize: 15,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.7),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
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
                Icons.info_outline,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Get your API key from https://ollama.com/settings/keys\n\nYour API key is stored securely on your device only.',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 13,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.8),
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildApiKeyInput(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.apiKey,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _apiKeyController,
          obscureText: _obscureApiKey,
          decoration: InputDecoration(
            hintText: l10n.enterApiKey,
            hintStyle: GoogleFonts.playfairDisplay(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.3),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureApiKey
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
              onPressed: () {
                setState(() => _obscureApiKey = !_obscureApiKey);
              },
            ),
          ),
          style: GoogleFonts.playfairDisplay(),
        ),
      ],
    );
  }

  Widget _buildModelInput(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.model,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          l10n.enterModelDesc,
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
              value: _selectedModel,
              dropdownColor: Theme.of(context).colorScheme.surface,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              style: GoogleFonts.playfairDisplay(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              items: _modelOptions.map((model) {
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
                  setState(() {
                    _selectedModel = value;
                    _modelController.text = value;
                  });
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

  Widget _buildEndpointInput(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.apiEndpoint,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _endpointController,
          decoration: InputDecoration(
            hintText: l10n.endpointPlaceholder,
            hintStyle: GoogleFonts.playfairDisplay(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.3),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
          ),
          style: GoogleFonts.playfairDisplay(),
        ),
      ],
    );
  }

  Widget _buildAgeVerification(AppLocalizations l10n) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _isOver18,
            activeColor: Theme.of(context).colorScheme.primary,
            onChanged: (value) {
              setState(() {
                _isOver18 = value ?? false;
              });
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isOver18 = !_isOver18;
              });
            },
            child: Text(
              'I am 18 or older (unlocks full personality)',
              style: GoogleFonts.playfairDisplay(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
                height: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton(AppLocalizations l10n) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _isSaving ? null : _saveApiKey,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: _isSaving
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              )
            : Text(
                widget.isInitialSetup ? 'Get Started' : l10n.settings,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
