import 'package:app_anotacoes/config/localization_config.dart';
import 'package:app_anotacoes/config/theme_config.dart';
import 'package:app_anotacoes/helper/style_theme.dart';
import 'package:app_anotacoes/l10n/gen_l10n/app_localizations.dart';
import 'package:app_anotacoes/repository/anotacao_repository.dart';
import 'package:app_anotacoes/repository/categoria_repository.dart';
import 'package:app_anotacoes/screen/inicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final localizationConfig = LocalizationConfig();
  await localizationConfig.getLocalization();

  final themeConfig = ThemeConfig();
  await themeConfig.getTheme();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => localizationConfig),
        ChangeNotifierProvider(create: (context) => themeConfig),
        ChangeNotifierProvider(create: (context) => CategoriaRepository()),
        ChangeNotifierProvider(create: (context) => AnotacaoRepository()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anotações',
      theme: StyleTheme().light,
      darkTheme: StyleTheme().dark,
      themeMode: context.watch<ThemeConfig>().getThemeMode(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.watch<LocalizationConfig>().getLocale(),
      home: const Inicio(),
    );
  }
}
