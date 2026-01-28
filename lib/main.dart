import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'components/api_key_setup_screen.dart';
import 'components/chat_screen.dart';
import 'constants/app_theme.dart';
import 'constants/app_constants.dart';
import 'services/settings_service.dart';
import 'services/user_profile_service.dart';
import 'services/custom_instructions_service.dart';
import 'utils/logger.dart';
import 'widgets/pin_entry_dialog.dart';
import 'l10n/app_localizations.dart';

/// Widget that wraps the main app content and handles PIN lock
class PinLockWrapper extends StatefulWidget {
  final Widget child;
  final bool showPinDialog;

  const PinLockWrapper({
    super.key,
    required this.child,
    this.showPinDialog = false,
  });

  @override
  State<PinLockWrapper> createState() => _PinLockWrapperState();
}

class _PinLockWrapperState extends State<PinLockWrapper> {
  bool _showPinDialog = false;

  @override
  void initState() {
    super.initState();
    _checkPinLockStatus();
  }

  @override
  void didUpdateWidget(PinLockWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    _checkPinLockStatus();
  }

  void _checkPinLockStatus() {
    final isPinLockEnabled = SettingsService.pinLockEnabled;
    final hasPinCode = SettingsService.pinCode.isNotEmpty;

    AppLogger.d(
      'PIN Lock Status - Enabled: $isPinLockEnabled, Has Code: $hasPinCode',
    );

    if (isPinLockEnabled && hasPinCode && !_showPinDialog) {
      AppLogger.i('PIN lock is active, showing PIN dialog');
      setState(() {
        _showPinDialog = true;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showPinEntryDialog();
      });
    } else if (!isPinLockEnabled || !hasPinCode) {
      AppLogger.d('PIN lock not active, hiding PIN dialog');
      setState(() {
        _showPinDialog = false;
      });
    }
  }

  /// Method to refresh PIN lock status (can be called when settings change)
  void refreshPinLockStatus() {
    _checkPinLockStatus();
  }

  Future<void> _showPinEntryDialog() async {
    final l10n = AppLocalizations.of(context)!;
    final pinCorrect = await showPinEntryDialog(
      context,
      title: l10n.welcomeBack,
      subtitle: l10n.enterPinSubtitle,
    );

    if (pinCorrect && mounted) {
      setState(() {
        _showPinDialog = false;
      });
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.incorrectPin),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          _showPinEntryDialog();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_showPinDialog)
          const PinEntryDialog(
            title: 'Welcome Back',
            subtitle: 'Enter your PIN to access the app',
          ),
      ],
    );
  }
}

void main() async {
  await dotenv.load(fileName: AppConstants.envFileName);
  AppLogger.init();
  await SettingsService.initialize();
  await UserProfileService.initialize();
  await CustomInstructionsService.initialize();

  WidgetsFlutterBinding.ensureInitialized();

  AppLogger.d('PIN Lock Enabled: ${SettingsService.pinLockEnabled}');
  AppLogger.d('PIN Code Set: ${SettingsService.pinCode.isNotEmpty}');
  AppLogger.d('API Key Configured: ${SettingsService.hasApiKeyConfigured}');

  runApp(AlexApp(hasApiKey: SettingsService.hasApiKeyConfigured));
}

class AlexApp extends StatefulWidget {
  final bool hasApiKey;

  const AlexApp({super.key, required this.hasApiKey});

  @override
  State<AlexApp> createState() => _AlexAppState();
}

class _AlexAppState extends State<AlexApp> {
  late Stream<String> _themeStream;
  late Stream<String> _colorStream;
  late Stream<String> _localeStream;
  Locale _currentLocale = const Locale('en');
  bool _apiKeyConfigured = false;

  @override
  void initState() {
    super.initState();
    _themeStream = SettingsService.themeChangeStream;
    _colorStream = SettingsService.colorChangeStream;
    _localeStream = SettingsService.localeChangeStream;
    _currentLocale = SettingsService.locale;
    _apiKeyConfigured = widget.hasApiKey;
    _localeStream.listen((localeCode) {
      if (mounted) {
        setState(() {
          _currentLocale = Locale(localeCode);
        });
      }
    });
  }

  ThemeMode _getThemeMode() {
    final themeMode = SettingsService.themeMode;
    switch (themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  void _onApiKeyConfigured() {
    setState(() {
      _apiKeyConfigured = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_apiKeyConfigured) {
      return MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _getThemeMode(),
        locale: _currentLocale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('nl'),
          Locale('es'),
          Locale('fr'),
          Locale('de'),
        ],
        home: ApiKeySetupScreen(
          isInitialSetup: true,
          onCompleted: _onApiKeyConfigured,
          key: const ValueKey('api_key_setup'),
        ),
      );
    }

    return StreamBuilder<String>(
      stream: _themeStream,
      builder: (context, themeSnapshot) {
        return StreamBuilder<String>(
          stream: _colorStream,
          builder: (context, colorSnapshot) {
            return MaterialApp(
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: _getThemeMode(),
              locale: _currentLocale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
        supportedLocales: const [
          Locale('en'),
          Locale('nl'),
          Locale('es'),
          Locale('fr'),
          Locale('de'),
        ],
              home: PinLockWrapper(
                child: ChatScreen(onApiKeyMissing: () => _onApiKeyConfigured()),
              ),
            );
          },
        );
      },
    );
  }
}
