import 'package:app_anotacoes/config/localization_config.dart';
import 'package:app_anotacoes/screen/component/idioma.dart';
import 'package:app_anotacoes/screen/component/tema.dart';
import 'package:app_anotacoes/screen/gerenciar_categoria.dart';
import 'package:flutter/material.dart';

class Configuracao extends StatelessWidget {
  const Configuracao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(generateLanguage(context).configuracao)),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.category_rounded),
            title: Text(generateLanguage(context).gerenciarCategoria),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GerenciarCategoria()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.language_rounded),
            title: Text(generateLanguage(context).idioma),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Idioma()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.light_mode_rounded),
            title: Text(generateLanguage(context).tema),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tema()),
              );
            },
          ),
        ],
      ),
    );
  }
}
