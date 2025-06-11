class Categoria {
  late String _id;
  late String _nome;

  Categoria(this._id, this._nome);

  String get id => _id;

  String get nome => _nome;

  Categoria.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _nome = map['nome'];
  }

  Map<String, dynamic> toMap() {
    return {'id': _id, 'nome': _nome};
  }
}
