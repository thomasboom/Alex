// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Alex - KI-Begleiter';

  @override
  String get appName => 'Alex';

  @override
  String get welcomeBack => 'Willkommen zurück';

  @override
  String get enterPinSubtitle =>
      'Geben Sie Ihre PIN ein, um auf die App zuzugreifen';

  @override
  String get incorrectPin => 'Falsche PIN. Bitte versuchen Sie es erneut.';

  @override
  String get settings => 'Einstellungen';

  @override
  String get appearance => 'Darstellung';

  @override
  String get colorPalette => 'Farbpalette';

  @override
  String get primaryColor => 'Primärfarbe';

  @override
  String get chooseColorTheme => 'Wählen Sie das Hauptfarbschema für die App';

  @override
  String get apiConfiguration => 'API-Konfiguration';

  @override
  String get apiKeySource => 'API-Schlüsselquelle';

  @override
  String get chooseApiKeySource =>
      'Wählen Sie, ob Sie den integrierten API-Schlüssel verwenden oder Ihren eigenen benutzerdefinierten Schlüssel bereitstellen möchten';

  @override
  String get inbuiltApiKeyWarning =>
      '⚠️ Der integrierte API-Schlüssel erreicht viel früher die Ratenbegrenzung. Benutzerdefinierte Schlüssel bieten höhere Limits und eine bessere Leistung.';

  @override
  String get inbuiltApiKey => 'Integrierter API-Schlüssel';

  @override
  String get usePreconfiguredKey =>
      'Verwenden Sie den vorab konfigurierten API-Schlüssel';

  @override
  String get customApiKey => 'Benutzerdefinierter API-Schlüssel';

  @override
  String get customKeyConfigured =>
      'Benutzerdefinierter Schlüssel ist konfiguriert';

  @override
  String get enterOwnApiKey => 'Geben Sie Ihren eigenen API-Schlüssel ein';

  @override
  String get security => 'Sicherheit';

  @override
  String get pinLock => 'PIN-Sperre';

  @override
  String get pinLockEnabledDesc => 'App ist mit einer PIN geschützt';

  @override
  String get pinLockDisabledDesc =>
      'Sichern Sie Ihre App mit einer 4-stelligen PIN';

  @override
  String get changePin => 'PIN ändern';

  @override
  String get dataManagement => 'Datenverwaltung';

  @override
  String get exportConversations => 'Unterhaltungen exportieren';

  @override
  String get exportConversationsDesc =>
      'Exportieren Sie Ihren Unterhaltungsverlauf in eine Nur-Text-Datei zur Sicherung oder zum Teilen.';

  @override
  String get exportToPlainText => 'Als Nur-Text exportieren';

  @override
  String get exportToJSON => 'Als JSON exportieren';

  @override
  String get clearData => 'Daten löschen';

  @override
  String get clearDataWarning =>
      'Alex dauerhaft löschen, einschließlich des gesamten Unterhaltungsverlaufs und aller Erinnerungen. Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get permanentlyDeleteAlex => 'Alex dauerhaft löschen';

  @override
  String get themePreference => 'Design-Präferenz';

  @override
  String get chooseThemeDesc =>
      'Wählen Sie, wie die App aussieht und sich anfühlt';

  @override
  String get system => 'System';

  @override
  String get followSystemTheme => 'Systemdesign folgen';

  @override
  String get light => 'Hell';

  @override
  String get alwaysLightTheme => 'Immer helles Design verwenden';

  @override
  String get dark => 'Dunkel';

  @override
  String get alwaysDarkTheme => 'Immer dunkles Design verwenden';

  @override
  String get permanentlyDeleteConfirmTitle => 'Alex dauerhaft löschen?';

  @override
  String get permanentlyDeleteConfirmDesc =>
      'Diese Aktion kann nicht rückgängig gemacht werden. Alex und der gesamte Unterhaltungsverlauf werden dauerhaft gelöscht.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get deletePermanently => 'Dauerhaft löschen';

  @override
  String get alexDeletedSuccess =>
      'Alex dauerhaft gelöscht. Alle Erinnerungen und der Unterhaltungsverlauf entfernt.';

  @override
  String get deleteFailed =>
      'Alex konnte nicht dauerhaft gelöscht werden. Bitte versuchen Sie es erneut.';

  @override
  String get exportSuccess => 'Unterhaltungen erfolgreich exportiert';

  @override
  String get exportJSONSuccess =>
      'Unterhaltungen erfolgreich als JSON exportiert';

  @override
  String get exportFailed =>
      'Unterhaltungen konnten nicht exportiert werden. Bitte versuchen Sie es erneut.';

  @override
  String get saveExportedConversations =>
      'Exportierte Unterhaltungen speichern';

  @override
  String get saveExportedConversationsJSON =>
      'Exportierte Unterhaltungen speichern (JSON)';

  @override
  String get setPinLock => 'PIN-Sperre festlegen';

  @override
  String get enterPinToSecure =>
      'Geben Sie eine 4-stellige PIN ein, um Ihre App zu sichern';

  @override
  String get newPin => 'Neue PIN';

  @override
  String get confirmPin => 'PIN bestätigen';

  @override
  String get setPin => 'PIN festlegen';

  @override
  String get pinLockEnabledSuccess => 'PIN-Sperre erfolgreich aktiviert';

  @override
  String get disablePinLock => 'PIN-Sperre deaktivieren?';

  @override
  String get disablePinLockDesc =>
      'Möchten Sie die PIN-Sperre wirklich deaktivieren? Für den Zugriff auf Ihre App wird keine PIN mehr benötigt.';

  @override
  String get pinLockDisabledSuccess => 'PIN-Sperre deaktiviert';

  @override
  String get disable => 'Deaktivieren';

  @override
  String get currentPin => 'Aktuelle PIN';

  @override
  String get confirmNewPin => 'Neue PIN bestätigen';

  @override
  String get pinChangedSuccess => 'PIN erfolgreich geändert';

  @override
  String get customApiKeyLabel => 'Benutzerdefinierter API-Schlüssel';

  @override
  String get enterCustomApiKeyDesc =>
      'Geben Sie Ihren benutzerdefinierten Ollama-API-Schlüssel ein. Sie können einen unter https://ollama.com/settings/keys erhalten';

  @override
  String get apiKeySecurityNote =>
      '🔒 Ihr API-Schlüssel wird nur sicher auf Ihrem Gerät gespeichert und niemals an unsere Server übertragen.';

  @override
  String get apiKey => 'API-Schlüssel';

  @override
  String get enterApiKey => 'Geben Sie Ihren API-Schlüssel ein...';

  @override
  String get model => 'Modell';

  @override
  String get enterModelDesc =>
      'Geben Sie das zu verwendende Ollama-Modell ein (z. B. llama3, mistral)';

  @override
  String get modelPlaceholder => 'z. B. llama3';

  @override
  String get apiEndpoint => 'API-Endpunkt';

  @override
  String get enterEndpointDesc =>
      'Geben Sie die URL des Ollama-API-Endpunkts ein';

  @override
  String get endpointPlaceholder => 'https://api.ollama.com';

  @override
  String get apiEndpointUpdated => 'API-Endpunkt aktualisiert';

  @override
  String get enterPin => 'PIN eingeben';

  @override
  String get enterPinToContinue =>
      'Bitte geben Sie Ihre 4-stellige PIN ein, um fortzufahren';

  @override
  String get useDifferentMethod => 'Andere Methode verwenden';

  @override
  String get typeAMessage => 'Nachricht eingeben...';

  @override
  String get chatEmpty => 'Wie kann ich Ihnen heute helfen?';

  @override
  String get welcomeMessage => 'Hey, was geht?';

  @override
  String get placeholderText => 'Was beschäftigt Sie?';

  @override
  String get language => 'Sprache';

  @override
  String get chooseLanguage => 'Wählen Sie Ihre bevorzugte Sprache';

  @override
  String get english => 'Englisch';

  @override
  String get dutch => 'Niederländisch';

  @override
  String get spanish => 'Spanisch';

  @override
  String get french => 'Französisch';

  @override
  String get german => 'Deutsch';

  @override
  String get colorBlue => 'Blau';

  @override
  String get colorPurple => 'Lila';

  @override
  String get colorGreen => 'Grün';

  @override
  String get colorOrange => 'Orange';

  @override
  String get colorPink => 'Rosa';

  @override
  String get colorTeal => 'Türkis';

  @override
  String get colorIndigo => 'Indigo';

  @override
  String get colorCyan => 'Cyan';

  @override
  String get colorAmber => 'Bernstein';

  @override
  String get colorLime => 'Limette';

  @override
  String get colorBrown => 'Braun';

  @override
  String get colorDeepPurple => 'Dunkellila';

  @override
  String get colorDeepOrange => 'Dunkelorange';

  @override
  String get colorLightBlue => 'Hellblau';

  @override
  String get colorYellow => 'Gelb';

  @override
  String get disclaimer => 'Konzeptnachweis';

  @override
  String get disclaimerText =>
      'Diese Anwendung ist ein Konzeptnachweis (PoC) und KEINE voll funktionsfähige Produktionsanwendung. Es ist experimentelle Software nur zu Demonstrations- und Entwicklungszwecken. Die KI kann unerwartete, ungenaue oder unangemessene Antworten produzieren. Sicherheitsfunktionen dienen nur der Demonstration und sind nicht zum Schutz sensibler Daten geeignet. Nutzung auf eigene Gefahr.';

  @override
  String get profile => 'Profil';

  @override
  String get yourName => 'Ihr Name';

  @override
  String get nickname => 'Spitzname';

  @override
  String get nicknameDescription => 'Wie Alex Sie ansprechen soll';

  @override
  String get nicknameHint => 'Geben Sie Ihren bevorzugten Spitznamen ein';

  @override
  String get displayName => 'Anzeigename';

  @override
  String get displayNameDescription => 'Ihr vollständiger Name (optional)';

  @override
  String get displayNameHint => 'Geben Sie Ihren Namen ein';

  @override
  String get communicationStyle => 'Kommunikationsstil';

  @override
  String get formal => 'Formell';

  @override
  String get formalDescription => 'Professionelle und höfliche Sprache';

  @override
  String get semiFormal => 'Halbformell';

  @override
  String get semiFormalDescription => 'Freundlich aber professionell';

  @override
  String get balanced => 'Ausgewogen';

  @override
  String get balancedDescription => 'Natürliches und freundliches Gespräch';

  @override
  String get casual => 'Locker';

  @override
  String get casualDescription => 'Entspannt und informell';

  @override
  String get humorLevel => 'Humorlevel';

  @override
  String get minimal => 'Minimal';

  @override
  String get low => 'Niedrig';

  @override
  String get high => 'Hoch';

  @override
  String get emotionalSupport => 'Emotionale Unterstützung';

  @override
  String get customInstructions => 'Benutzerdefinierte Anweisungen';

  @override
  String get noCustomInstructions =>
      'Noch keine benutzerdefinierten Anweisungen';

  @override
  String get customInstructionsHint =>
      'Fügen Sie Anweisungen wie \"Nenne mich Alex\" oder \"Ich bevorzuge kurze Antworten\" hinzu, um Ihre Erfahrung anzupassen';

  @override
  String get addCustomInstruction => 'Benutzerdefinierte Anweisung hinzufügen';

  @override
  String get instructionHint => 'z. B. Nenne mich bei meinem Spitznamen';

  @override
  String get addInstruction => 'Anweisung hinzufügen';

  @override
  String get deleteInstruction => 'Anweisung löschen?';

  @override
  String get deleteInstructionConfirm =>
      'Möchten Sie diese Anweisung wirklich löschen?';

  @override
  String get delete => 'Löschen';

  @override
  String get personalization => 'Personalisierung';

  @override
  String get personalizationDesc =>
      'Passen Sie an, wie Alex mit Ihnen interagiert';

  @override
  String get rememberThis => 'Das merken';

  @override
  String get memorySaved => 'Erinnerung gespeichert';

  @override
  String get apiKeyRequired => 'API-Schlüssel erforderlich';

  @override
  String get configureApiKeyInSettings =>
      'Bitte konfigurieren Sie Ihren Ollama-API-Schlüssel in den Einstellungen, um die App zu verwenden.';

  @override
  String get pinFieldHint => '1234';

  @override
  String get speechRecognitionError => 'Spracherkennungsfehler aufgetreten';

  @override
  String get noSpeechInputDetected =>
      'Keine Spracheingabe erkannt. Bitte sprechen Sie lauter oder überprüfen Sie Ihr Mikrofon.';

  @override
  String get speechRecognizerNotAvailable =>
      'Spracherkennung nicht verfügbar. Bitte überprüfen Sie die Mikrofonberechtigungen.';

  @override
  String get microphonePermissionDenied =>
      'Mikrofonberechtigung verweigert. Bitte aktivieren Sie den Mikrofonzugriff in den Einstellungen.';

  @override
  String get speechNetworkError =>
      'Netzwerkfehler. Bitte überprüfen Sie Ihre Internetverbindung.';

  @override
  String get speechRecognitionTimeout =>
      'Zeitüberschreitung der Spracherkennung. Bitte versuchen Sie es erneut.';

  @override
  String get gotIt => 'Verstanden';

  @override
  String get messageProcessingError =>
      'Entschuldigung, ich konnte Ihre Nachricht gerade nicht verarbeiten.';

  @override
  String get startUsingAlexDescription =>
      'Um Alex zu verwenden, müssen Sie Ihren Ollama-API-Schlüssel konfigurieren.';

  @override
  String get updateApiConfiguration =>
      'Aktualisieren Sie Ihre Ollama-API-Konfiguration.';

  @override
  String get getApiKeyUrl =>
      'Holen Sie sich Ihren API-Schlüssel von https://ollama.com/settings/keys\n\nIhr API-Schlüssel wird nur sicher auf Ihrem Gerät gespeichert.';

  @override
  String get ageVerificationText =>
      'Ich bin 18 oder älter (schaltet die volle Persönlichkeit frei)';

  @override
  String get getStarted => 'Loslegen';

  @override
  String get enterApiKeyError => 'Bitte geben Sie Ihren API-Schlüssel ein';

  @override
  String get saveApiKeyError =>
      'API-Schlüssel konnte nicht gespeichert werden. Bitte versuchen Sie es erneut.';
}
