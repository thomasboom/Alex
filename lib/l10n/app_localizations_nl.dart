// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Alex - AI Companion';

  @override
  String get appName => 'Alex';

  @override
  String get welcomeBack => 'Welkom Terug';

  @override
  String get enterPinSubtitle =>
      'Voer uw PIN in om toegang te krijgen tot de app';

  @override
  String get incorrectPin => 'Onjuiste PIN. Probeer het opnieuw.';

  @override
  String get settings => 'Instellingen';

  @override
  String get appearance => 'Uiterlijk';

  @override
  String get colorPalette => 'Kleurenpalet';

  @override
  String get primaryColor => 'Hoofdkleur';

  @override
  String get chooseColorTheme => 'Kies het hoofdkleurenschema voor de app';

  @override
  String get apiConfiguration => 'API Configuratie';

  @override
  String get apiKeySource => 'API Sleutelbron';

  @override
  String get chooseApiKeySource =>
      'Kies of u de ingebouwde API-sleutel wilt gebruiken of uw eigen aangepaste sleutel opgeven';

  @override
  String get inbuiltApiKeyWarning =>
      '⚠️ De ingebouwde API-sleutel raakt sneller de limieten. Aangepaste sleutels bieden hogere limieten en betere prestaties.';

  @override
  String get inbuiltApiKey => 'Ingebouwde API-sleutel';

  @override
  String get usePreconfiguredKey =>
      'Gebruik de vooraf geconfigureerde API-sleutel';

  @override
  String get customApiKey => 'Aangepaste API-sleutel';

  @override
  String get customKeyConfigured => 'Aangepaste sleutel is geconfigureerd';

  @override
  String get enterOwnApiKey => 'Voer uw eigen API-sleutel in';

  @override
  String get security => 'Beveiliging';

  @override
  String get pinLock => 'PIN-slot';

  @override
  String get pinLockEnabledDesc => 'App is beveiligd met een PIN-code';

  @override
  String get pinLockDisabledDesc => 'Beveilig uw app met een 4-cijferige PIN';

  @override
  String get changePin => 'PIN wijzigen';

  @override
  String get dataManagement => 'Gegevensbeheer';

  @override
  String get exportConversations => 'Gesprekken exporteren';

  @override
  String get exportConversationsDesc =>
      'Exporteer uw gespreksgeschiedenis naar een tekstbestand voor back-up of delen.';

  @override
  String get exportToPlainText => 'Exporteren naar platte tekst';

  @override
  String get exportToJSON => 'Exporteren naar JSON';

  @override
  String get clearData => 'Gegevens wissen';

  @override
  String get clearDataWarning =>
      'Wis Alex permanent, inclusief alle gespreksgeschiedenis en herinneringen. Deze actie kan niet ongedaan worden gemaakt.';

  @override
  String get permanentlyDeleteAlex => 'Alex permanent verwijderen';

  @override
  String get themePreference => 'Themavoorkeur';

  @override
  String get chooseThemeDesc => 'Kies hoe de app eruitziet en aanvoelt';

  @override
  String get system => 'Systeem';

  @override
  String get followSystemTheme => 'Volg systeemthema';

  @override
  String get light => 'Licht';

  @override
  String get alwaysLightTheme => 'Altijd licht thema gebruiken';

  @override
  String get dark => 'Donker';

  @override
  String get alwaysDarkTheme => 'Altijd donker thema gebruiken';

  @override
  String get permanentlyDeleteConfirmTitle => 'Alex permanent verwijderen?';

  @override
  String get permanentlyDeleteConfirmDesc =>
      'Deze actie kan niet ongedaan worden gemaakt. Alex en alle gespreksgeschiedenis worden permanent verwijderd.';

  @override
  String get cancel => 'Annuleren';

  @override
  String get deletePermanently => 'Permanent verwijderen';

  @override
  String get alexDeletedSuccess =>
      'Alex permanent verwijderd. Alle herinneringen en gespreksgeschiedenis verwijderd.';

  @override
  String get deleteFailed =>
      'Kon Alex niet permanent verwijderen. Probeer het opnieuw.';

  @override
  String get exportSuccess => 'Gesprekken succesvol geëxporteerd';

  @override
  String get exportJSONSuccess => 'Gesprekken succesvol geëxporteerd naar JSON';

  @override
  String get exportFailed =>
      'Kon gesprekken niet exporteren. Probeer het opnieuw.';

  @override
  String get saveExportedConversations => 'Geëxporteerde gesprekken opslaan';

  @override
  String get saveExportedConversationsJSON =>
      'Geëxporteerde gesprekken opslaan (JSON)';

  @override
  String get setPinLock => 'PIN-slot instellen';

  @override
  String get enterPinToSecure =>
      'Voer een 4-cijferige PIN in om uw app te beveiligen';

  @override
  String get newPin => 'Nieuwe PIN';

  @override
  String get confirmPin => 'PIN bevestigen';

  @override
  String get setPin => 'PIN instellen';

  @override
  String get pinLockEnabledSuccess => 'PIN-slot succesvol ingeschakeld';

  @override
  String get disablePinLock => 'PIN-slot uitschakelen?';

  @override
  String get disablePinLockDesc =>
      'Weet u zeker dat u het PIN-slot wilt uitschakelen? Uw app vereist geen PIN meer voor toegang.';

  @override
  String get pinLockDisabledSuccess => 'PIN-slot uitgeschakeld';

  @override
  String get disable => 'Uitschakelen';

  @override
  String get currentPin => 'Huidige PIN';

  @override
  String get confirmNewPin => 'Nieuwe PIN bevestigen';

  @override
  String get pinChangedSuccess => 'PIN succesvol gewijzigd';

  @override
  String get customApiKeyLabel => 'Aangepaste API-sleutel';

  @override
  String get enterCustomApiKeyDesc =>
      'Voer uw aangepaste Ollama API-sleutel in. U kunt er een krijgen op https://ollama.com/settings/keys';

  @override
  String get apiKeySecurityNote =>
      '🔒 Uw API-sleutel wordt veilig alleen op uw apparaat opgeslagen en wordt nooit naar onze servers verzonden.';

  @override
  String get apiKey => 'API-sleutel';

  @override
  String get enterApiKey => 'Voer uw API-sleutel in...';

  @override
  String get model => 'Model';

  @override
  String get enterModelDesc =>
      'Voer het Ollama-model in dat u wilt gebruiken (bijv. llama3, mistral)';

  @override
  String get modelPlaceholder => 'bijv. llama3';

  @override
  String get apiEndpoint => 'API-eindpunt';

  @override
  String get enterEndpointDesc => 'Voer de URL van het Ollama API-eindpunt in';

  @override
  String get endpointPlaceholder => 'https://api.ollama.com';

  @override
  String get apiEndpointUpdated => 'API-eindpunt bijgewerkt';

  @override
  String get enterPin => 'PIN invoeren';

  @override
  String get enterPinToContinue => 'Voer uw 4-cijferige PIN in om door te gaan';

  @override
  String get useDifferentMethod => 'Gebruik een andere methode';

  @override
  String get typeAMessage => 'Typ een bericht...';

  @override
  String get chatEmpty => 'Hoe kan ik u vandaag helpen?';

  @override
  String get welcomeMessage => 'Hé, hoe is het?';

  @override
  String get placeholderText => 'Wat heb je in gedachten?';

  @override
  String get language => 'Taal';

  @override
  String get chooseLanguage => 'Kies uw voorkeurstaal';

  @override
  String get english => 'Engels';

  @override
  String get dutch => 'Nederlands';

  @override
  String get spanish => 'Spaans';

  @override
  String get french => 'Frans';

  @override
  String get colorBlue => 'Blauw';

  @override
  String get colorPurple => 'Paars';

  @override
  String get colorGreen => 'Groen';

  @override
  String get colorOrange => 'Oranje';

  @override
  String get colorPink => 'Roze';

  @override
  String get colorTeal => 'Groenblauw';

  @override
  String get colorIndigo => 'Indigo';

  @override
  String get colorCyan => 'Cyaan';

  @override
  String get colorAmber => 'Amber';

  @override
  String get colorLime => 'Limoen';

  @override
  String get colorBrown => 'Bruin';

  @override
  String get colorDeepPurple => 'Donkerpaars';

  @override
  String get colorDeepOrange => 'Donkeroranje';

  @override
  String get colorLightBlue => 'Lichtblauw';

  @override
  String get colorYellow => 'Geel';
}
