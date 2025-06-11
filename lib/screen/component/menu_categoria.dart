import 'package:app_anotacoes/config/localization_config.dart';
import 'package:app_anotacoes/model/categoria.dart';
import 'package:app_anotacoes/repository/categoria_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuCategoria extends StatelessWidget {
  const MenuCategoria({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final void Function(Categoria?) onChanged;
  final Categoria? selected;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Categoria>(
      hint: Text(generateLanguage(context).selecioneOpcao),
      value: selected,
      onChanged: onChanged,
      isExpanded: true,
      validator: (value) {
        if (value == null) {
          return generateLanguage(context).selecioneOpcao;
        }
        return null;
      },
      items: context.watch<CategoriaRepository>().categorias.map((item) {
        return DropdownMenuItem<Categoria>(value: item, child: Text(item.nome));
      }).toList(),
    );
  }
}
