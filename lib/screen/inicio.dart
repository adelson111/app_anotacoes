import 'package:app_anotacoes/config/localization_config.dart';
import 'package:app_anotacoes/repository/anotacao_repository.dart';
import 'package:app_anotacoes/screen/cadastrar_anotacao.dart';
import 'package:app_anotacoes/screen/configuracao.dart';
import 'package:app_anotacoes/screen/editar_anotacao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(generateLanguage(context).nomeApp),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Configuracao()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<AnotacaoRepository>(
          builder: (BuildContext context, AnotacaoRepository list, _) {
            return list.anotacoes.isEmpty
                ? Center(
                    child: Text(
                      generateLanguage(context).listaVaziaAnotacoes,
                    ),
                  )
                : ListView.builder(
                    itemCount: list.anotacoes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(list.anotacoes[index].titulo),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit_rounded),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditarAnotacao(
                                      anotacao: list.anotacoes[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete_rounded),
                              onPressed: () {
                                context.read<AnotacaoRepository>().remove(
                                  list.anotacoes[index],
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_rounded),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastrarAnotacao()),
          );
        },
      ),
    );
  }
}
