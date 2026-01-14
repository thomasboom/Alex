import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_nl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('nl'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Alex - AI Companion'**
  String get appTitle;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Alex'**
  String get appName;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @enterPinSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your PIN to access the app'**
  String get enterPinSubtitle;

  /// No description provided for @incorrectPin.
  ///
  /// In en, this message translates to:
  /// **'Incorrect PIN. Please try again.'**
  String get incorrectPin;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @colorPalette.
  ///
  /// In en, this message translates to:
  /// **'Color Palette'**
  String get colorPalette;

  /// No description provided for @primaryColor.
  ///
  /// In en, this message translates to:
  /// **'Primary Color'**
  String get primaryColor;

  /// No description provided for @chooseColorTheme.
  ///
  /// In en, this message translates to:
  /// **'Choose the main color theme for the app'**
  String get chooseColorTheme;

  /// No description provided for @apiConfiguration.
  ///
  /// In en, this message translates to:
  /// **'API Configuration'**
  String get apiConfiguration;

  /// No description provided for @apiKeySource.
  ///
  /// In en, this message translates to:
  /// **'API Key Source'**
  String get apiKeySource;

  /// No description provided for @chooseApiKeySource.
  ///
  /// In en, this message translates to:
  /// **'Choose whether to use the inbuilt API key or provide your own custom key'**
  String get chooseApiKeySource;

  /// No description provided for @inbuiltApiKeyWarning.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Inbuilt API key will hit rate limits much sooner. Custom keys provide higher limits and better performance.'**
  String get inbuiltApiKeyWarning;

  /// No description provided for @inbuiltApiKey.
  ///
  /// In en, this message translates to:
  /// **'Inbuilt API Key'**
  String get inbuiltApiKey;

  /// No description provided for @usePreconfiguredKey.
  ///
  /// In en, this message translates to:
  /// **'Use the pre-configured API key'**
  String get usePreconfiguredKey;

  /// No description provided for @customApiKey.
  ///
  /// In en, this message translates to:
  /// **'Custom API Key'**
  String get customApiKey;

  /// No description provided for @customKeyConfigured.
  ///
  /// In en, this message translates to:
  /// **'Custom key is configured'**
  String get customKeyConfigured;

  /// No description provided for @enterOwnApiKey.
  ///
  /// In en, this message translates to:
  /// **'Enter your own API key'**
  String get enterOwnApiKey;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @pinLock.
  ///
  /// In en, this message translates to:
  /// **'PIN Lock'**
  String get pinLock;

  /// No description provided for @pinLockEnabledDesc.
  ///
  /// In en, this message translates to:
  /// **'App is protected with a PIN code'**
  String get pinLockEnabledDesc;

  /// No description provided for @pinLockDisabledDesc.
  ///
  /// In en, this message translates to:
  /// **'Secure your app with a 4-digit PIN'**
  String get pinLockDisabledDesc;

  /// No description provided for @changePin.
  ///
  /// In en, this message translates to:
  /// **'Change PIN'**
  String get changePin;

  /// No description provided for @dataManagement.
  ///
  /// In en, this message translates to:
  /// **'Data Management'**
  String get dataManagement;

  /// No description provided for @exportConversations.
  ///
  /// In en, this message translates to:
  /// **'Export Conversations'**
  String get exportConversations;

  /// No description provided for @exportConversationsDesc.
  ///
  /// In en, this message translates to:
  /// **'Export your conversation history to a plain text file for backup or sharing.'**
  String get exportConversationsDesc;

  /// No description provided for @exportToPlainText.
  ///
  /// In en, this message translates to:
  /// **'Export to Plain Text'**
  String get exportToPlainText;

  /// No description provided for @exportToJSON.
  ///
  /// In en, this message translates to:
  /// **'Export to JSON'**
  String get exportToJSON;

  /// No description provided for @clearData.
  ///
  /// In en, this message translates to:
  /// **'Clear Data'**
  String get clearData;

  /// No description provided for @clearDataWarning.
  ///
  /// In en, this message translates to:
  /// **'Permanently delete Alex, including all conversation history and memories. This action cannot be undone.'**
  String get clearDataWarning;

  /// No description provided for @permanentlyDeleteAlex.
  ///
  /// In en, this message translates to:
  /// **'Permanently Delete Alex'**
  String get permanentlyDeleteAlex;

  /// No description provided for @themePreference.
  ///
  /// In en, this message translates to:
  /// **'Theme Preference'**
  String get themePreference;

  /// No description provided for @chooseThemeDesc.
  ///
  /// In en, this message translates to:
  /// **'Choose how the app looks and feels'**
  String get chooseThemeDesc;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @followSystemTheme.
  ///
  /// In en, this message translates to:
  /// **'Follow system theme'**
  String get followSystemTheme;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @alwaysLightTheme.
  ///
  /// In en, this message translates to:
  /// **'Always use light theme'**
  String get alwaysLightTheme;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @alwaysDarkTheme.
  ///
  /// In en, this message translates to:
  /// **'Always use dark theme'**
  String get alwaysDarkTheme;

  /// No description provided for @permanentlyDeleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Permanently Delete Alex?'**
  String get permanentlyDeleteConfirmTitle;

  /// No description provided for @permanentlyDeleteConfirmDesc.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone. Alex and all conversation history will be permanently deleted.'**
  String get permanentlyDeleteConfirmDesc;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @deletePermanently.
  ///
  /// In en, this message translates to:
  /// **'Delete Permanently'**
  String get deletePermanently;

  /// No description provided for @alexDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Alex permanently deleted. All memories and conversation history removed.'**
  String get alexDeletedSuccess;

  /// No description provided for @deleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to permanently delete Alex. Please try again.'**
  String get deleteFailed;

  /// No description provided for @exportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Conversations exported successfully'**
  String get exportSuccess;

  /// No description provided for @exportJSONSuccess.
  ///
  /// In en, this message translates to:
  /// **'Conversations exported to JSON successfully'**
  String get exportJSONSuccess;

  /// No description provided for @exportFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to export conversations. Please try again.'**
  String get exportFailed;

  /// No description provided for @saveExportedConversations.
  ///
  /// In en, this message translates to:
  /// **'Save Exported Conversations'**
  String get saveExportedConversations;

  /// No description provided for @saveExportedConversationsJSON.
  ///
  /// In en, this message translates to:
  /// **'Save Exported Conversations (JSON)'**
  String get saveExportedConversationsJSON;

  /// No description provided for @setPinLock.
  ///
  /// In en, this message translates to:
  /// **'Set PIN Lock'**
  String get setPinLock;

  /// No description provided for @enterPinToSecure.
  ///
  /// In en, this message translates to:
  /// **'Enter a 4-digit PIN to secure your app'**
  String get enterPinToSecure;

  /// No description provided for @newPin.
  ///
  /// In en, this message translates to:
  /// **'New PIN'**
  String get newPin;

  /// No description provided for @confirmPin.
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get confirmPin;

  /// No description provided for @setPin.
  ///
  /// In en, this message translates to:
  /// **'Set PIN'**
  String get setPin;

  /// No description provided for @pinLockEnabledSuccess.
  ///
  /// In en, this message translates to:
  /// **'PIN lock enabled successfully'**
  String get pinLockEnabledSuccess;

  /// No description provided for @disablePinLock.
  ///
  /// In en, this message translates to:
  /// **'Disable PIN Lock?'**
  String get disablePinLock;

  /// No description provided for @disablePinLockDesc.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to disable PIN lock? Your app will no longer require a PIN to access.'**
  String get disablePinLockDesc;

  /// No description provided for @pinLockDisabledSuccess.
  ///
  /// In en, this message translates to:
  /// **'PIN lock disabled'**
  String get pinLockDisabledSuccess;

  /// No description provided for @disable.
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get disable;

  /// No description provided for @currentPin.
  ///
  /// In en, this message translates to:
  /// **'Current PIN'**
  String get currentPin;

  /// No description provided for @confirmNewPin.
  ///
  /// In en, this message translates to:
  /// **'Confirm New PIN'**
  String get confirmNewPin;

  /// No description provided for @pinChangedSuccess.
  ///
  /// In en, this message translates to:
  /// **'PIN changed successfully'**
  String get pinChangedSuccess;

  /// No description provided for @customApiKeyLabel.
  ///
  /// In en, this message translates to:
  /// **'Custom API Key'**
  String get customApiKeyLabel;

  /// No description provided for @enterCustomApiKeyDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter your custom Ollama API key. You can get one from https://ollama.com/settings/keys'**
  String get enterCustomApiKeyDesc;

  /// No description provided for @apiKeySecurityNote.
  ///
  /// In en, this message translates to:
  /// **'🔒 Your API key is stored securely on your device only and is never transmitted to our servers.'**
  String get apiKeySecurityNote;

  /// No description provided for @apiKey.
  ///
  /// In en, this message translates to:
  /// **'API Key'**
  String get apiKey;

  /// No description provided for @enterApiKey.
  ///
  /// In en, this message translates to:
  /// **'Enter your API key...'**
  String get enterApiKey;

  /// No description provided for @model.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get model;

  /// No description provided for @enterModelDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter the Ollama model to use (e.g., llama3, mistral)'**
  String get enterModelDesc;

  /// No description provided for @modelPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'e.g. llama3'**
  String get modelPlaceholder;

  /// No description provided for @apiEndpoint.
  ///
  /// In en, this message translates to:
  /// **'API Endpoint'**
  String get apiEndpoint;

  /// No description provided for @enterEndpointDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter the Ollama API endpoint URL'**
  String get enterEndpointDesc;

  /// No description provided for @endpointPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'https://api.ollama.com'**
  String get endpointPlaceholder;

  /// No description provided for @apiEndpointUpdated.
  ///
  /// In en, this message translates to:
  /// **'API endpoint updated'**
  String get apiEndpointUpdated;

  /// No description provided for @enterPin.
  ///
  /// In en, this message translates to:
  /// **'Enter PIN'**
  String get enterPin;

  /// No description provided for @enterPinToContinue.
  ///
  /// In en, this message translates to:
  /// **'Please enter your 4-digit PIN to continue'**
  String get enterPinToContinue;

  /// No description provided for @useDifferentMethod.
  ///
  /// In en, this message translates to:
  /// **'Use Different Method'**
  String get useDifferentMethod;

  /// No description provided for @typeAMessage.
  ///
  /// In en, this message translates to:
  /// **'Type a message...'**
  String get typeAMessage;

  /// No description provided for @chatEmpty.
  ///
  /// In en, this message translates to:
  /// **'How can I help you today?'**
  String get chatEmpty;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Hey, whatsup?'**
  String get welcomeMessage;

  /// No description provided for @placeholderText.
  ///
  /// In en, this message translates to:
  /// **'What\'s on your mind?'**
  String get placeholderText;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred language'**
  String get chooseLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @dutch.
  ///
  /// In en, this message translates to:
  /// **'Dutch'**
  String get dutch;

  /// No description provided for @spanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @colorBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get colorBlue;

  /// No description provided for @colorPurple.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get colorPurple;

  /// No description provided for @colorGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorGreen;

  /// No description provided for @colorOrange.
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get colorOrange;

  /// No description provided for @colorPink.
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get colorPink;

  /// No description provided for @colorTeal.
  ///
  /// In en, this message translates to:
  /// **'Teal'**
  String get colorTeal;

  /// No description provided for @colorIndigo.
  ///
  /// In en, this message translates to:
  /// **'Indigo'**
  String get colorIndigo;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'fr', 'nl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'nl':
      return AppLocalizationsNl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
