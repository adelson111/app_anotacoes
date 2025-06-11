import 'package:app_anotacoes/config/localization_config.dart';
import 'package:app_anotacoes/model/categoria.dart';
import 'package:app_anotacoes/repository/categoria_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditarCategoria extends StatelessWidget {
  EditarCategoria({super.key, required this.categoria});

  final Categoria categoria;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nomeController.text = categoria.nome;

    return AlertDialog(
      title: Text(generateLanguage(context).cadastrar),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nomeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hint: Text(generateLanguage(context).nome),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return generateLanguage(context).informarNome;
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text(generateLanguage(context).salvar.toUpperCase()),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<CategoriaRepository>().edit(
                Categoria(categoria.id, _nomeController.text),
              );
              Navigator.pop(context);
            }
          },
        ),
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
