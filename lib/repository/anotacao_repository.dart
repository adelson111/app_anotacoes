import 'dart:collection';

import 'package:app_anotacoes/config/database_config.dart';
import 'package:app_anotacoes/model/anotacao.dart';
import 'package:app_anotacoes/model/categoria.dart';
import 'package:app_anotacoes/repository/categoria_repository.dart';
import 'package:flutter/material.dart';

class AnotacaoRepository extends ChangeNotifier {
  final List<Anotacao> _anotacoes = [];
  final String _tableName = 'anotacoes';
  final String _order = 'titulo ASC';

  UnmodifiableListView<Anotacao> get anotacoes =>
      UnmodifiableListView(_anotacoes);

  anotacaoRepository() {
    init();
  }

  void init() async {
    _anotacoes.addAll(await getAll());
    notifyListeners();
  }

  void save(Anotacao anotacao) async {
    await DatabaseConfig().insert(_tableName, anotacao.toMap());
    _anotacoes.add(anotacao);
    notifyListeners();
  }

  void edit(Anotacao anotacao) async {
    await DatabaseConfig().update(_tableName, anotacao.id, anotacao.toMap());
    final index = _anotacoes.indexWhere((value) => value.id == anotacao.id);
    if (index != -1) {
      _anotacoes[index] = anotacao;
    }
    notifyListeners();
  }

  void remove(Anotacao anotacao) async {
    await DatabaseConfig().delete(_tableName, anotacao.id);
    _anotacoes.remove(anotacao);
    notifyListeners();
  }

  Future<List<Anotacao>> getAll() async {
    List<Map<String, Object?>> list = await DatabaseConfig().getAll(
      _tableName,
      _order,
    );
    List<Categoria> categorias = await CategoriaRepository().getAll();
    List<Anotacao> anotacoes = [];

    for (var item in list) {
      final categoria = categorias.where(
        (value) => value.id == item['categoria_id'],
      );

      if (categoria.isNotEmpty) {
        anotacoes.add(Anotacao.fromMap(item, categoria.first));
      }
    }

    return anotacoes;
  }
}
