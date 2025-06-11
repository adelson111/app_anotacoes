import 'package:app_anotacoes/config/localization_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Idioma extends StatelessWidget {
  const Idioma({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(generateLanguage(context).idioma),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<LocalizationCodeConfig>(
            title: Text(generateLanguage(context).padraoSistema),
            value: LocalizationCodeConfig.system,
            groupValue: context
                .watch<LocalizationConfig>()
                .getLocalizationCode(),
            onChanged: (value) {
              context.read<LocalizationConfig>().setLocalization(value!);
              Navigator.pop(context);
            },
          ),
          RadioListTile<LocalizationCodeConfig>(
            title: Text(generateLanguage(context).idiomaPortugues),
            value: LocalizationCodeConfig.pt,
            groupValue: context
                .watch<LocalizationConfig>()
                .getLocalizationCode(),
            onChanged: (value) {
              context.read<LocalizationConfig>().setLocalization(value!);
              Navigator.pop(context);
            },
          ),
          RadioListTile<LocalizationCodeConfig>(
            title: Text(generateLanguage(context).idiomaIngles),
            value: LocalizationCodeConfig.en,
            groupValue: context
                .watch<LocalizationConfig>()
                .getLocalizationCode(),
            onChanged: (value) {
              context.read<LocalizationConfig>().setLocalization(value!);
              Navigator.pop(context);
            },
          ),
          RadioListTile<LocalizationCodeConfig>(
            title: Text(generateLanguage(context).idiomaEspanhol),
            value: LocalizationCodeConfig.es,
            groupValue: context
                .watch<LocalizationConfig>()
                .getLocalizationCode(),
            onChanged: (value) {
              context.read<LocalizationConfig>().setLocalization(value!);
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
