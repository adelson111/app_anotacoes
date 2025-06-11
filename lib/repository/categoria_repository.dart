import 'dart:collection';

import 'package:app_anotacoes/config/database_config.dart';
import 'package:app_anotacoes/model/categoria.dart';
import 'package:flutter/material.dart';

class CategoriaRepository extends ChangeNotifier {
  final List<Categoria> _categorias = [];
  final String _tableName = 'categorias';
  final String _order = 'nome ASC';

  UnmodifiableListView<Categoria> get categorias =>
      UnmodifiableListView(_categorias);

  CategoriaRepository() {
    init();
  }

  void init() async {
    _categorias.addAll(await getAll());
    notifyListeners();
  }

  void save(Categoria categoria) async {
    await DatabaseConfig().insert(_tableName, categoria.toMap());
    _categorias.add(categoria);
    notifyListeners();
  }

  void edit(Categoria categoria) async {
    await DatabaseConfig().update(_tableName, categoria.id, categoria.toMap());
    final index = _categorias.indexWhere((value) => value.id == categoria.id);
    if (index != -1) {
      _categorias[index] = categoria;
    }
    notifyListeners();
  }

  void remove(Categoria categoria) async {
    await DatabaseConfig().delete(_tableName, categoria.id);
    _categorias.remove(categoria);
    notifyListeners();
  }

  Future<List<Categoria>> getAll() async {
    List<Map<String, Object?>> list = await DatabaseConfig().getAll(
      _tableName,
      _order,
    );
    return list.map((value) => Categoria.fromMap(value)).toList();
  }
}
