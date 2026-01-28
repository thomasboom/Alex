// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Alex - AI Companion';

  @override
  String get appName => 'Alex';

  @override
  String get welcomeBack => 'Bienvenido de nuevo';

  @override
  String get enterPinSubtitle => 'Ingrese su PIN para acceder a la aplicación';

  @override
  String get incorrectPin => 'PIN incorrecto. Por favor, inténtelo de nuevo.';

  @override
  String get settings => 'Configuración';

  @override
  String get appearance => 'Apariencia';

  @override
  String get colorPalette => 'Paleta de colores';

  @override
  String get primaryColor => 'Color principal';

  @override
  String get chooseColorTheme =>
      'Elija el tema de color principal de la aplicación';

  @override
  String get apiConfiguration => 'Configuración de API';

  @override
  String get apiKeySource => 'Fuente de clave API';

  @override
  String get chooseApiKeySource =>
      'Elija si desea usar la clave API incorporada o proporcionar su propia clave personalizada';

  @override
  String get inbuiltApiKeyWarning =>
      '⚠️ La clave API incorporada alcanzará los límites de velocidad mucho antes. Las claves personalizadas proporcionan límites más altos y mejor rendimiento.';

  @override
  String get inbuiltApiKey => 'Clave API incorporada';

  @override
  String get usePreconfiguredKey => 'Usar la clave API preconfigurada';

  @override
  String get customApiKey => 'Clave API personalizada';

  @override
  String get customKeyConfigured => 'Clave personalizada configurada';

  @override
  String get enterOwnApiKey => 'Ingrese su propia clave API';

  @override
  String get security => 'Seguridad';

  @override
  String get pinLock => 'Bloqueo con PIN';

  @override
  String get pinLockEnabledDesc =>
      'La aplicación está protegida con un código PIN';

  @override
  String get pinLockDisabledDesc =>
      'Proteja su aplicación con un PIN de 4 dígitos';

  @override
  String get changePin => 'Cambiar PIN';

  @override
  String get dataManagement => 'Gestión de datos';

  @override
  String get exportConversations => 'Exportar conversaciones';

  @override
  String get exportConversationsDesc =>
      'Exporte su historial de conversaciones a un archivo de texto para copia de seguridad o compartir.';

  @override
  String get exportToPlainText => 'Exportar a texto plano';

  @override
  String get exportToJSON => 'Exportar a JSON';

  @override
  String get clearData => 'Borrar datos';

  @override
  String get clearDataWarning =>
      'Elimine permanentemente Alex, incluyendo todo el historial de conversaciones y recuerdos. Esta acción no se puede deshacer.';

  @override
  String get permanentlyDeleteAlex => 'Eliminar permanentemente Alex';

  @override
  String get themePreference => 'Preferencia de tema';

  @override
  String get chooseThemeDesc => 'Elija cómo se ve y se siente la aplicación';

  @override
  String get system => 'Sistema';

  @override
  String get followSystemTheme => 'Seguir el tema del sistema';

  @override
  String get light => 'Claro';

  @override
  String get alwaysLightTheme => 'Usar siempre el tema claro';

  @override
  String get dark => 'Oscuro';

  @override
  String get alwaysDarkTheme => 'Usar siempre el tema oscuro';

  @override
  String get permanentlyDeleteConfirmTitle => '¿Eliminar permanentemente Alex?';

  @override
  String get permanentlyDeleteConfirmDesc =>
      'Esta acción no se puede deshacer. Alex y todo el historial de conversaciones se eliminará permanentemente.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get deletePermanently => 'Eliminar permanentemente';

  @override
  String get alexDeletedSuccess =>
      'Alex eliminado permanentemente. Todos los recuerdos e historial de conversaciones eliminados.';

  @override
  String get deleteFailed =>
      'No se pudo eliminar permanentemente Alex. Por favor, inténtelo de nuevo.';

  @override
  String get exportSuccess => 'Conversaciones exportadas exitosamente';

  @override
  String get exportJSONSuccess =>
      'Conversaciones exportadas exitosamente a JSON';

  @override
  String get exportFailed =>
      'No se pudieron exportar las conversaciones. Por favor, inténtelo de nuevo.';

  @override
  String get saveExportedConversations => 'Guardar conversaciones exportadas';

  @override
  String get saveExportedConversationsJSON =>
      'Guardar conversaciones exportadas (JSON)';

  @override
  String get setPinLock => 'Establecer bloqueo con PIN';

  @override
  String get enterPinToSecure =>
      'Ingrese un PIN de 4 dígitos para asegurar su aplicación';

  @override
  String get newPin => 'Nuevo PIN';

  @override
  String get confirmPin => 'Confirmar PIN';

  @override
  String get setPin => 'Establecer PIN';

  @override
  String get pinLockEnabledSuccess => 'Bloqueo con PIN habilitado exitosamente';

  @override
  String get disablePinLock => '¿Desactivar bloqueo con PIN?';

  @override
  String get disablePinLockDesc =>
      '¿Está seguro de que desea desactivar el bloqueo con PIN? Su aplicación ya no requerirá un PIN para acceder.';

  @override
  String get pinLockDisabledSuccess => 'Bloqueo con PIN desactivado';

  @override
  String get disable => 'Desactivar';

  @override
  String get currentPin => 'PIN actual';

  @override
  String get confirmNewPin => 'Confirmar nuevo PIN';

  @override
  String get pinChangedSuccess => 'PIN cambiado exitosamente';

  @override
  String get customApiKeyLabel => 'Clave API personalizada';

  @override
  String get enterCustomApiKeyDesc =>
      'Ingrese su clave API personalizada de Ollama. Puede obtener una en https://ollama.com/settings/keys';

  @override
  String get apiKeySecurityNote =>
      '🔒 Su clave API se almacena de forma segura solo en su dispositivo y nunca se transmite a nuestros servidores.';

  @override
  String get apiKey => 'Clave API';

  @override
  String get enterApiKey => 'Ingrese su clave API...';

  @override
  String get model => 'Modelo';

  @override
  String get enterModelDesc =>
      'Ingrese el modelo Ollama a usar (ej. llama3, mistral)';

  @override
  String get modelPlaceholder => 'ej. llama3';

  @override
  String get apiEndpoint => 'Punto final de API';

  @override
  String get enterEndpointDesc =>
      'Ingrese la URL del punto final de la API de Ollama';

  @override
  String get endpointPlaceholder => 'https://api.ollama.com';

  @override
  String get apiEndpointUpdated => 'Punto final de API actualizado';

  @override
  String get enterPin => 'Ingresar PIN';

  @override
  String get enterPinToContinue =>
      'Por favor, ingrese su PIN de 4 dígitos para continuar';

  @override
  String get useDifferentMethod => 'Usar método diferente';

  @override
  String get typeAMessage => 'Escribe un mensaje...';

  @override
  String get chatEmpty => '¿Cómo puedo ayudarte hoy?';

  @override
  String get welcomeMessage => '¿Qué tal?';

  @override
  String get placeholderText => '¿Qué tienes en mente?';

  @override
  String get language => 'Idioma';

  @override
  String get chooseLanguage => 'Elige tu idioma preferido';

  @override
  String get english => 'Inglés';

  @override
  String get dutch => 'Holandés';

  @override
  String get spanish => 'Español';

  @override
  String get french => 'Francés';

  @override
  String get german => 'Alemán';

  @override
  String get colorBlue => 'Azul';

  @override
  String get colorPurple => 'Púrpura';

  @override
  String get colorGreen => 'Verde';

  @override
  String get colorOrange => 'Naranja';

  @override
  String get colorPink => 'Rosa';

  @override
  String get colorTeal => 'Turquesa';

  @override
  String get colorIndigo => 'Índigo';

  @override
  String get colorCyan => 'Cian';

  @override
  String get colorAmber => 'Ámbar';

  @override
  String get colorLime => 'Lima';

  @override
  String get colorBrown => 'Marrón';

  @override
  String get colorDeepPurple => 'Púrpura oscuro';

  @override
  String get colorDeepOrange => 'Naranja oscuro';

  @override
  String get colorLightBlue => 'Azul claro';

  @override
  String get colorYellow => 'Amarillo';

  @override
  String get disclaimer => 'Proof of Concept';

  @override
  String get disclaimerText =>
      'Esta aplicación es una Prueba de Concepto (PoC) y NO es una aplicación de producción completa. Es software experimental solo para propósitos de demostración y desarrollo. La IA puede producir respuestas inesperadas, inexactas o inapropiadas. Las funciones de seguridad son solo para demostración y no son adecuadas para proteger datos sensibles. Úselo bajo su propia responsabilidad.';

  @override
  String get profile => 'Perfil';

  @override
  String get yourName => 'Tu nombre';

  @override
  String get nickname => 'Apodo';

  @override
  String get nicknameDescription => 'Cómo Alex debe dirigirse a ti';

  @override
  String get nicknameHint => 'Ingresa tu apodo preferido';

  @override
  String get displayName => 'Nombre para mostrar';

  @override
  String get displayNameDescription => 'Tu nombre completo (opcional)';

  @override
  String get displayNameHint => 'Ingresa tu nombre';

  @override
  String get communicationStyle => 'Estilo de comunicación';

  @override
  String get formal => 'Formal';

  @override
  String get formalDescription => 'Lenguaje profesional y cortés';

  @override
  String get semiFormal => 'Semi-formal';

  @override
  String get semiFormalDescription => 'Amigable pero profesional';

  @override
  String get balanced => 'Equilibrado';

  @override
  String get balancedDescription => 'Conversación natural y amigable';

  @override
  String get casual => 'Casual';

  @override
  String get casualDescription => 'Relajado e informal';

  @override
  String get humorLevel => 'Nivel de humor';

  @override
  String get minimal => 'Mínimo';

  @override
  String get low => 'Bajo';

  @override
  String get high => 'Alto';

  @override
  String get emotionalSupport => 'Apoyo emocional';

  @override
  String get customInstructions => 'Instrucciones personalizadas';

  @override
  String get noCustomInstructions => 'Aún no hay instrucciones personalizadas';

  @override
  String get customInstructionsHint =>
      'Agrega instrucciones como \"Llámame Alex\" o \"Prefiero respuestas cortas\" para personalizar tu experiencia';

  @override
  String get addCustomInstruction => 'Agregar instrucción personalizada';

  @override
  String get instructionHint => 'ej., Llámame por mi apodo';

  @override
  String get addInstruction => 'Agregar instrucción';

  @override
  String get deleteInstruction => '¿Eliminar instrucción?';

  @override
  String get deleteInstructionConfirm =>
      '¿Estás seguro de que deseas eliminar esta instrucción?';

  @override
  String get delete => 'Eliminar';

  @override
  String get personalization => 'Personalización';

  @override
  String get personalizationDesc => 'Personaliza cómo Alex interactúa contigo';

  @override
  String get rememberThis => 'Recordar esto';

  @override
  String get memorySaved => 'Recuerdo guardado';

  @override
  String get apiKeyRequired => 'Clave API requerida';

  @override
  String get configureApiKeyInSettings =>
      'Configure su clave API de Ollama en Configuración para usar la aplicación.';

  @override
  String get pinFieldHint => '1234';

  @override
  String get speechRecognitionError => 'Error de reconocimiento de voz';

  @override
  String get noSpeechInputDetected =>
      'No se detectó entrada de voz. Por favor, hable más fuerte o verifique su micrófono.';

  @override
  String get speechRecognizerNotAvailable =>
      'Reconocimiento de voz no disponible. Por favor, verifique los permisos del micrófono.';

  @override
  String get microphonePermissionDenied =>
      'Permiso de micrófono denegado. Por favor, habilite el acceso al micrófono en la configuración.';

  @override
  String get speechNetworkError =>
      'Error de red. Por favor, verifique su conexión a internet.';

  @override
  String get speechRecognitionTimeout =>
      'Tiempo de reconocimiento de voz agotado. Por favor, inténtelo de nuevo.';

  @override
  String get gotIt => 'Entendido';

  @override
  String get messageProcessingError =>
      'Lo siento, no pude procesar su mensaje en este momento.';

  @override
  String get startUsingAlexDescription =>
      'Para comenzar a usar Alex, necesita configurar su clave API de Ollama.';

  @override
  String get updateApiConfiguration =>
      'Actualizar la configuración de la API de Ollama.';

  @override
  String get getApiKeyUrl =>
      'Obtenga su clave API de https://ollama.com/settings/keys\n\nSu clave API se almacena de forma segura solo en su dispositivo.';

  @override
  String get ageVerificationText =>
      'Tengo 18 años o más (desbloquea la personalidad completa)';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get enterApiKeyError => 'Por favor, ingrese su clave API';

  @override
  String get saveApiKeyError =>
      'Error al guardar la clave API. Por favor, inténtelo de nuevo.';
}
