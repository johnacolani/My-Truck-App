/// Original, sample-only interface strings. Not an official Terms of Use.
/// Keeping these in one place lets this sandbox test three language states.
class DemoCopy {
  const DemoCopy(this.language);

  final String language;

  String text(String key) {
    final translations = _content[language] ?? _content['en']!;
    return translations[key] ?? _content['en']![key] ?? key;
  }

  static const Map<String, Map<String, String>> _content = {
    'en': {
      'title': 'Truck Workflow Lab',
      'subtitle': 'Independent three-screen Flutter preview',
      'welcome': 'Welcome',
      'description': 'Explore a sample mobile flow before connecting an API.',
      'termsButton': 'Read sample terms',
      'termsTitle': 'Sample terms of use',
      'language': 'Language',
      'sampleNotice': 'DEMO ONLY. Not official policy or a real service.',
      'termsIntro': 'These sample terms exist only to exercise layout, navigation, and localization.',
      'termsOne': '1. This demonstration uses local interface state only.',
      'termsTwo': '2. Do not enter personal or confidential information.',
      'termsThree': '3. No account, authentication, or real service is connected.',
      'agree': 'I understand this is a sample.',
      'confirm': 'Continue',
      'accepted': 'Accepted in this local demo.',
      'back': 'Back',
      'splash': 'Launching sample experience',
    },
    'es': {
      'title': 'Laboratorio de transporte',
      'subtitle': 'Vista independiente de tres pantallas en Flutter',
      'welcome': 'Bienvenido',
      'description': 'Explora un flujo de ejemplo antes de conectar una API.',
      'termsButton': 'Leer condiciones de ejemplo',
      'termsTitle': 'Condiciones de ejemplo',
      'language': 'Idioma',
      'sampleNotice': 'SOLO DEMOSTRACIÓN. No es una política oficial ni un servicio real.',
      'termsIntro': 'Estas condiciones sirven solo para probar el diseño, la navegación y los idiomas.',
      'termsOne': '1. Esta demostración solo usa el estado local.',
      'termsTwo': '2. No introduzcas información personal ni confidencial.',
      'termsThree': '3. No hay cuentas, autenticación ni servicios reales conectados.',
      'agree': 'Entiendo que es un ejemplo.',
      'confirm': 'Continuar',
      'accepted': 'Aceptado en esta demostración local.',
      'back': 'Volver',
      'splash': 'Iniciando la demostración',
    },
    'fr': {
      'title': 'Laboratoire de transport',
      'subtitle': 'Aperçu Flutter indépendant de trois écrans',
      'welcome': 'Bienvenue',
      'description': 'Explorez un parcours de démonstration avant de connecter une API.',
      'termsButton': 'Lire les conditions de démonstration',
      'termsTitle': 'Conditions de démonstration',
      'language': 'Langue',
      'sampleNotice': 'DÉMONSTRATION UNIQUEMENT. Ceci n’est pas une politique officielle.',
      'termsIntro': 'Ces conditions servent uniquement à tester l’interface, la navigation et les langues.',
      'termsOne': '1. Cette démonstration utilise uniquement un état local.',
      'termsTwo': '2. Ne saisissez pas de données personnelles ou confidentielles.',
      'termsThree': '3. Aucun compte, authentification ou service réel n’est connecté.',
      'agree': 'Je comprends qu’il s’agit d’un exemple.',
      'confirm': 'Continuer',
      'accepted': 'Accepté dans cette démonstration locale.',
      'back': 'Retour',
      'splash': 'Démarrage de la démonstration',
    },
  };
}
