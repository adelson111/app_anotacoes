
import 'package:app_anotacoes/config/localization_config.dart';
import 'package:app_anotacoes/repository/categoria_repository.dart';
import 'package:app_anotacoes/screen/component/cadastrar_categoria.dart';
import 'package:app_anotacoes/screen/component/editar_categoria.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GerenciarCategoria extends StatelessWidget {
  const GerenciarCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(generateLanguage(context).gerenciarCategoria)),
      body: Consumer<CategoriaRepository>(
        builder: (BuildContext context, CategoriaRepository list, _) {
          return list.categorias.isEmpty
              ? Center(
                  child: Text(generateLanguage(context).listaVaziaCategoria),
                )
              : ListView.builder(
                  itemCount: list.categorias.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(list.categorias[index].nome),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit_rounded),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditarCategoria(
                                    categoria: list.categorias[index],
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_rounded),
                            onPressed: () {
                              context.read<CategoriaRepository>().remove(
                                list.categorias[index],
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_rounded),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastrarCategoria()),
          );
        },
      ),
    );
  }
}
