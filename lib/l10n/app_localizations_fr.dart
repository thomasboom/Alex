// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Alex - AI Companion';

  @override
  String get appName => 'Alex';

  @override
  String get welcomeBack => 'Bon retour';

  @override
  String get enterPinSubtitle =>
      'Entrez votre PIN pour accéder à l\'application';

  @override
  String get incorrectPin => 'PIN incorrect. Veuillez réessayer.';

  @override
  String get settings => 'Paramètres';

  @override
  String get appearance => 'Apparence';

  @override
  String get colorPalette => 'Palette de couleurs';

  @override
  String get primaryColor => 'Couleur principale';

  @override
  String get chooseColorTheme =>
      'Choisissez le thème de couleur principal de l\'application';

  @override
  String get apiConfiguration => 'Configuration de l\'API';

  @override
  String get apiKeySource => 'Source de clé API';

  @override
  String get chooseApiKeySource =>
      'Choisissez d\'utiliser la clé API intégrée ou de fournir votre propre clé personnalisée';

  @override
  String get inbuiltApiKeyWarning =>
      '⚠️ La clé API intégrée atteindra les limites de taux beaucoup plus tôt. Les clés personnalisées offrent des limites plus élevées et de meilleures performances.';

  @override
  String get inbuiltApiKey => 'Clé API intégrée';

  @override
  String get usePreconfiguredKey => 'Utiliser la clé API préconfigurée';

  @override
  String get customApiKey => 'Clé API personnalisée';

  @override
  String get customKeyConfigured => 'Clé personnalisée configurée';

  @override
  String get enterOwnApiKey => 'Entrez votre propre clé API';

  @override
  String get security => 'Sécurité';

  @override
  String get pinLock => 'Verrouillage PIN';

  @override
  String get pinLockEnabledDesc =>
      'L\'application est protégée par un code PIN';

  @override
  String get pinLockDisabledDesc =>
      'Sécurisez votre application avec un code PIN à 4 chiffres';

  @override
  String get changePin => 'Changer le PIN';

  @override
  String get dataManagement => 'Gestion des données';

  @override
  String get exportConversations => 'Exporter les conversations';

  @override
  String get exportConversationsDesc =>
      'Exportez votre historique de conversations vers un fichier texte pour sauvegarde ou partage.';

  @override
  String get exportToPlainText => 'Exporter en texte brut';

  @override
  String get exportToJSON => 'Exporter en JSON';

  @override
  String get clearData => 'Effacer les données';

  @override
  String get clearDataWarning =>
      'Supprimez définitivement Alex, y compris tout l\'historique des conversations et les souvenirs. Cette action ne peut pas être annulée.';

  @override
  String get permanentlyDeleteAlex => 'Supprimer définitivement Alex';

  @override
  String get themePreference => 'Préférence de thème';

  @override
  String get chooseThemeDesc =>
      'Choisissez l\'apparence et le ressenti de l\'application';

  @override
  String get system => 'Système';

  @override
  String get followSystemTheme => 'Suivre le thème du système';

  @override
  String get light => 'Clair';

  @override
  String get alwaysLightTheme => 'Toujours utiliser le thème clair';

  @override
  String get dark => 'Sombre';

  @override
  String get alwaysDarkTheme => 'Toujours utiliser le thème sombre';

  @override
  String get permanentlyDeleteConfirmTitle => 'Supprimer définitivement Alex ?';

  @override
  String get permanentlyDeleteConfirmDesc =>
      'Cette action ne peut pas être annulée. Alex et tout l\'historique des conversations seront définitivement supprimés.';

  @override
  String get cancel => 'Annuler';

  @override
  String get deletePermanently => 'Supprimer définitivement';

  @override
  String get alexDeletedSuccess =>
      'Alex supprimé définitivement. Tous les souvenirs et l\'historique des conversations ont été supprimés.';

  @override
  String get deleteFailed =>
      'Échec de la suppression définitive d\'Alex. Veuillez réessayer.';

  @override
  String get exportSuccess => 'Conversations exportées avec succès';

  @override
  String get exportJSONSuccess => 'Conversations exportées avec succès en JSON';

  @override
  String get exportFailed =>
      'Échec de l\'export des conversations. Veuillez réessayer.';

  @override
  String get saveExportedConversations =>
      'Enregistrer les conversations exportées';

  @override
  String get saveExportedConversationsJSON =>
      'Enregistrer les conversations exportées (JSON)';

  @override
  String get setPinLock => 'Définir le verrouillage PIN';

  @override
  String get enterPinToSecure =>
      'Entrez un code PIN à 4 chiffres pour sécuriser votre application';

  @override
  String get newPin => 'Nouveau PIN';

  @override
  String get confirmPin => 'Confirmer le PIN';

  @override
  String get setPin => 'Définir le PIN';

  @override
  String get pinLockEnabledSuccess => 'Verrouillage PIN activé avec succès';

  @override
  String get disablePinLock => 'Désactiver le verrouillage PIN ?';

  @override
  String get disablePinLockDesc =>
      'Êtes-vous sûr de vouloir désactiver le verrouillage PIN ? Votre application ne nécessitera plus de PIN pour y accéder.';

  @override
  String get pinLockDisabledSuccess => 'Verrouillage PIN désactivé';

  @override
  String get disable => 'Désactiver';

  @override
  String get currentPin => 'PIN actuel';

  @override
  String get confirmNewPin => 'Confirmer le nouveau PIN';

  @override
  String get pinChangedSuccess => 'PIN modifié avec succès';

  @override
  String get customApiKeyLabel => 'Clé API personnalisée';

  @override
  String get enterCustomApiKeyDesc =>
      'Entrez votre clé API personnalisée d\'Ollama. Vous pouvez en obtenir une sur https://ollama.com/settings/keys';

  @override
  String get apiKeySecurityNote =>
      '🔒 Votre clé API est stockée de manière sécurisée uniquement sur votre appareil et n\'est jamais transmise à nos serveurs.';

  @override
  String get apiKey => 'Clé API';

  @override
  String get enterApiKey => 'Entrez votre clé API...';

  @override
  String get model => 'Modèle';

  @override
  String get enterModelDesc =>
      'Entrez le modèle Ollama à utiliser (ex: llama3, mistral)';

  @override
  String get modelPlaceholder => 'ex: llama3';

  @override
  String get apiEndpoint => 'Point de terminaison API';

  @override
  String get enterEndpointDesc =>
      'Entrez l\'URL du point de terminaison de l\'API Ollama';

  @override
  String get endpointPlaceholder => 'https://api.ollama.com';

  @override
  String get apiEndpointUpdated => 'Point de terminaison API mis à jour';

  @override
  String get enterPin => 'Entrer le PIN';

  @override
  String get enterPinToContinue =>
      'Veuillez entrer votre code PIN à 4 chiffres pour continuer';

  @override
  String get useDifferentMethod => 'Utiliser une méthode différente';

  @override
  String get typeAMessage => 'Tapez un message...';

  @override
  String get chatEmpty => 'Comment puis-je vous aider aujourd\'hui ?';

  @override
  String get welcomeMessage => 'Salut, ça va?';

  @override
  String get placeholderText => 'Qu\'est-ce qui vous préoccupe ?';

  @override
  String get language => 'Langue';

  @override
  String get chooseLanguage => 'Choisissez votre langue préférée';

  @override
  String get english => 'Anglais';

  @override
  String get dutch => 'Néerlandais';

  @override
  String get spanish => 'Espagnol';

  @override
  String get french => 'Français';

  @override
  String get colorBlue => 'Bleu';

  @override
  String get colorPurple => 'Violet';

  @override
  String get colorGreen => 'Vert';

  @override
  String get colorOrange => 'Orange';

  @override
  String get colorPink => 'Rose';

  @override
  String get colorTeal => 'Turquoise';

  @override
  String get colorIndigo => 'Indigo';

  @override
  String get colorCyan => 'Cyan';

  @override
  String get colorAmber => 'Ambre';

  @override
  String get colorLime => 'Citron vert';

  @override
  String get colorBrown => 'Marron';

  @override
  String get colorDeepPurple => 'Violet foncé';

  @override
  String get colorDeepOrange => 'Orange foncé';

  @override
  String get colorLightBlue => 'Bleu clair';

  @override
  String get colorYellow => 'Jaune';

  @override
  String get disclaimer => 'Proof of Concept';

  @override
  String get disclaimerText =>
      'Cette application est une Proof of Concept (PoC) et NON une application de production complète. Il s\'agit d\'un logiciel expérimental à des fins de démonstration et de développement uniquement. L\'IA peut produire des réponses inattendues, inexactes ou inappropriées. Les fonctionnalités de sécurité sont destinées à la démonstration uniquement et ne sont pas adaptées à la protection de données sensibles. Utilisez à vos propres risques.';

  @override
  String get profile => 'Profil';

  @override
  String get yourName => 'Votre nom';

  @override
  String get nickname => 'Surnom';

  @override
  String get nicknameDescription => 'Comment Alex doit vous appeler';

  @override
  String get nicknameHint => 'Entrez votre surnom préféré';

  @override
  String get displayName => 'Nom d\'affichage';

  @override
  String get displayNameDescription => 'Votre nom complet (optionnel)';

  @override
  String get displayNameHint => 'Entrez votre nom';

  @override
  String get communicationStyle => 'Style de communication';

  @override
  String get formal => 'Formel';

  @override
  String get formalDescription => 'Langage professionnel et poli';

  @override
  String get semiFormal => 'Semi-formel';

  @override
  String get semiFormalDescription => 'Amical mais professionnel';

  @override
  String get balanced => 'Équilibré';

  @override
  String get balancedDescription => 'Conversation naturelle et amicale';

  @override
  String get casual => 'Décontracté';

  @override
  String get casualDescription => 'Relax et informel';

  @override
  String get humorLevel => 'Niveau d\'humour';

  @override
  String get minimal => 'Minimal';

  @override
  String get low => 'Faible';

  @override
  String get high => 'Élevé';

  @override
  String get emotionalSupport => 'Soutien émotionnel';

  @override
  String get customInstructions => 'Instructions personnalisées';

  @override
  String get noCustomInstructions =>
      'Pas encore d\'instructions personnalisées';

  @override
  String get customInstructionsHint =>
      'Ajoutez des instructions comme \"Appelle-moi Alex\" ou \"Je préfère les réponses courtes\" pour personnaliser votre expérience';

  @override
  String get addCustomInstruction => 'Ajouter une instruction personnalisée';

  @override
  String get instructionHint => 'ex., Appelle-moi par mon surnom';

  @override
  String get addInstruction => 'Ajouter une instruction';

  @override
  String get deleteInstruction => 'Supprimer l\'instruction ?';

  @override
  String get deleteInstructionConfirm =>
      'Êtes-vous sûr de vouloir supprimer cette instruction ?';

  @override
  String get delete => 'Supprimer';

  @override
  String get personalization => 'Personnalisation';

  @override
  String get personalizationDesc =>
      'Personnalisez la façon dont Alex interagit avec vous';

  @override
  String get rememberThis => 'Se souvenir de ceci';

  @override
  String get memorySaved => 'Mémoire sauvegardée';

  @override
  String get apiKeyRequired => 'Clé API requise';

  @override
  String get configureApiKeyInSettings =>
      'Veuillez configurer votre clé API Ollama dans les Paramètres pour utiliser l\'application.';

  @override
  String get pinFieldHint => '1234';

  @override
  String get speechRecognitionError => 'Erreur de reconnaissance vocale';

  @override
  String get noSpeechInputDetected =>
      'Aucune entrée vocale détectée. Parlez plus fort ou vérifiez votre microphone.';

  @override
  String get speechRecognizerNotAvailable =>
      'Reconnaissance vocale non disponible. Veuillez vérifier les permissions du microphone.';

  @override
  String get microphonePermissionDenied =>
      'Permission du microphone refusée. Veuillez activer l\'accès au microphone dans les paramètres.';

  @override
  String get speechNetworkError =>
      'Erreur réseau. Veuillez vérifier votre connexion internet.';

  @override
  String get speechRecognitionTimeout =>
      'Délai de reconnaissance vocale dépassé. Veuillez réessayer.';

  @override
  String get gotIt => 'Compris';

  @override
  String get messageProcessingError =>
      'Désolé, je n\'ai pas pu traiter votre message pour le moment.';

  @override
  String get startUsingAlexDescription =>
      'Pour commencer à utiliser Alex, vous devez configurer votre clé API Ollama.';

  @override
  String get updateApiConfiguration =>
      'Mettre à jour la configuration de l\'API Ollama.';

  @override
  String get getApiKeyUrl =>
      'Obtenez votre clé API sur https://ollama.com/settings/keys\n\nVotre clé API est stockée en toute sécurité uniquement sur votre appareil.';

  @override
  String get ageVerificationText =>
      'J\'ai 18 ans ou plus (déverrouille la personnalité complète)';

  @override
  String get getStarted => 'Commencer';

  @override
  String get enterApiKeyError => 'Veuillez entrer votre clé API';

  @override
  String get saveApiKeyError =>
      'Échec de l\'enregistrement de la clé API. Veuillez réessayer.';
}
