import 'package:app_anotacoes/config/localization_config.dart';
import 'package:app_anotacoes/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tema extends StatelessWidget {
  const Tema({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(generateLanguage(context).tema),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<ThemeCodeConfig>(
            title: Text(generateLanguage(context).padraoSistema),
            value: ThemeCodeConfig.system,
            groupValue: context.watch<ThemeConfig>().getThemeCode(),
            onChanged: (value) {
              context.read<ThemeConfig>().setTheme(value!);
              Navigator.pop(context);
            },
          ),
          RadioListTile<ThemeCodeConfig>(
            title: Text(generateLanguage(context).temaClaro),
            value: ThemeCodeConfig.light,
            groupValue: context.watch<ThemeConfig>().getThemeCode(),
            onChanged: (value) {
              context.read<ThemeConfig>().setTheme(value!);
              Navigator.pop(context);
            },
          ),
          RadioListTile<ThemeCodeConfig>(
            title: Text(generateLanguage(context).temaEscuro),
            value: ThemeCodeConfig.dark,
            groupValue: context.watch<ThemeConfig>().getThemeCode(),
            onChanged: (value) {
              context.read<ThemeConfig>().setTheme(value!);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(generateLanguage(context).cancelar.toUpperCase()),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
