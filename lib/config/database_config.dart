import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class DatabaseConfig {
  static Database? _database;
  static final DatabaseConfig _instance = DatabaseConfig._internal();

  factory DatabaseConfig() => _instance;

  DatabaseConfig._internal();

  Future<Database> get _databaseInstance async {
    return _database ??= await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'database.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: _onOpen,
      onCreate: _onCreate,
    );
  }

  Future<void> _onOpen(Database db) async {
    await db.rawQuery('PRAGMA foreign_keys = ON;');
    await db.rawQuery('PRAGMA journal_mode = WAL;');
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categorias (
        id TEXT PRIMARY KEY,
        nome TEXT NOT NULL
      );
    ''');

    await db.insert('categorias', {'id': Uuid().v1(), 'nome': 'Pensamentos'});
    await db.insert('categorias', {'id': Uuid().v1(), 'nome': 'Criações'});
    await db.insert('categorias', {'id': Uuid().v1(), 'nome': 'Anotações'});

    await db.execute('''
      CREATE TABLE anotacoes (
        id TEXT PRIMARY KEY,
        titulo TEXT NOT NULL,
        descricao TEXT NOT NULL,
        categoria_id TEXT NOT NULL,
        FOREIGN KEY (categoria_id) REFERENCES categorias(id)
      );
    ''');
  }

  Future<int> insert(String tableName, Map<String, dynamic> values) async {
    final db = await _databaseInstance;
    return await db.insert(tableName, values);
  }

  Future<int> update(
    String tableName,
    String id,
    Map<String, dynamic> values,
  ) async {
    final db = await _databaseInstance;
    return await db.update(tableName, values, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(String tableName, String id) async {
    final db = await _databaseInstance;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, Object?>>> getAll(
    String tableName,
    String order,
  ) async {
    final db = await _databaseInstance;
    return await db.query(tableName, orderBy: order);
  }
}
