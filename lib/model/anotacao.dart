import 'package:app_anotacoes/model/categoria.dart';

class Anotacao {
  late String _id;
  late String _titulo;
  late String _descricao;
  late Categoria _categoria;

  Anotacao(this._id, this._titulo, this._descricao, this._categoria);

  String get id => _id;

  String get titulo => _titulo;

  String get descricao => _descricao;

  Categoria get categoria => _categoria;

  Anotacao.fromMap(Map<String, dynamic> map, Categoria categoria) {
    _id = map['id'];
    _titulo = map['titulo'];
    _descricao = map['descricao'];
    _categoria = categoria;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'titulo': _titulo,
      'descricao': _descricao,
      'categoria_id': _categoria.id,
    };
  }
}
