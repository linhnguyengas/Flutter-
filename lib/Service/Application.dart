import 'dart:ui';

class Application{

  static final Application _application = Application._internal();

  factory Application() {
    return _application;
  }

  Application._internal();

  final List<String> supportedLanguages = [
    "English",
    "Tiếng Việt",
    "Chinese",
  ];

  final List<String> supportedLanguagesCodes = [
    "en",
    "vn",
    "cn",
  ];

  Iterable<Locale> supportedLocales() => supportedLanguagesCodes.map<Locale>(
      (language) => Locale(language,"")
  );

  LocaleChangeCallBack onLocaleChanged;
}

Application application = Application();

typedef void LocaleChangeCallBack(Locale locale);