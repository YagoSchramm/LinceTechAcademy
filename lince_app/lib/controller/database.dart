import 'package:contact_app/model/contato.dart';
import 'package:contact_app/model/pessoa.dart';
import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final path = join(await getDatabasesPath(), 'contatos.db');
  return openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute(TabelaPessoa.createTable);
      await db.execute(TabelaContato.createTable);
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < 2) {
        await db.execute(TabelaContato.createTable);
      }
    },
    version: 2,
  );
}

class TabelaPessoa {
  static const String createTable =
      ''' 
  CREATE TABLE $tableName(
  $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $nome TEXT NOT NULL
  );
  ''';

  static const String tableName = "pessoas";

  static const String id = "id";

  static const String nome = "nome";

  static Map<String, dynamic> toMap(Pessoa pessoa) {
    final map = <String, dynamic>{
      TabelaPessoa.nome: pessoa.nome,
    };

    if (pessoa.id.isNotEmpty) {
      map[TabelaPessoa.id] = pessoa.id;
    }

    return map;
  }
}

class TabelaContato {
  static const String createTable =
      '''
  CREATE TABLE $tableName(
  $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $idPessoa INTEGER NOT NULL,
  $tipoContato TEXT NOT NULL,
  $contato TEXT NOT NULL,
  FOREIGN KEY ($idPessoa) REFERENCES ${TabelaPessoa.tableName}(${TabelaPessoa.id})
  );
  ''';

  static const String tableName = "contatos";

  static const String id = "id";

  static const String idPessoa = "id_pessoa";

  static const String tipoContato = "tipo_contato";

  static const String contato = "contato";

  static Map<String, dynamic> toMap(Contato contatoModel) {
    final map = <String, dynamic>{
      TabelaContato.idPessoa: contatoModel.idPessoa,
      TabelaContato.tipoContato: contatoModel.tipoContato,
      TabelaContato.contato: contatoModel.contato,
    };

    if (contatoModel.id.isNotEmpty) {
      map[TabelaContato.id] = contatoModel.id;
    }

    return map;
  }
}

class PessoaController {
  Future<void> insert(Pessoa pessoa) async {
    final database = await getDatabase();
    final map = TabelaPessoa.toMap(pessoa);
    await database.insert(TabelaPessoa.tableName, map);
    return;
  }

  Future<List<Pessoa>> getAll() async {
    final database = await getDatabase();
    final data = await database.query(TabelaPessoa.tableName);
    final list = data
        .map((dataElement) => Pessoa.fromMap(dataElement))
        .toList();
    return list;
  }

  Future<Pessoa> getById(String id) async {
    final database = await getDatabase();
    final data = await database.query(
      TabelaPessoa.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    final pessoa = data.map((dataElement) => Pessoa.fromMap(dataElement)).last;
    return pessoa;
  }

  Future<Pessoa> update(Pessoa pessoa) async {
    final database = await getDatabase();
    await database.update(
      TabelaPessoa.tableName,
      TabelaPessoa.toMap(pessoa),
      where: 'id = ?',
      whereArgs: [pessoa.id],
    );
    return pessoa;
  }

  Future<void> delete(String id) async {
    final database = await getDatabase();
    await database.delete(
      TabelaContato.tableName,
      where: '${TabelaContato.idPessoa} = ?',
      whereArgs: [id],
    );
    await database.delete(
      TabelaPessoa.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class ContatoController {
  Future<void> insert(Contato contato) async {
    final database = await getDatabase();
    final map = TabelaContato.toMap(contato);
    await database.insert(TabelaContato.tableName, map);
    return;
  }

  Future<List<Contato>> getAll() async {
    final database = await getDatabase();
    final data = await database.query(TabelaContato.tableName);
    final list = data
        .map((dataElement) => Contato.fromMap(dataElement))
        .toList();
    return list;
  }

  Future<List<Contato>> getByPessoaId(String idPessoa) async {
    final database = await getDatabase();
    final data = await database.query(
      TabelaContato.tableName,
      where: '${TabelaContato.idPessoa} = ?',
      whereArgs: [idPessoa],
    );
    final list = data
        .map((dataElement) => Contato.fromMap(dataElement))
        .toList();
    return list;
  }

  Future<Contato> getById(String id) async {
    final database = await getDatabase();
    final data = await database.query(
      TabelaContato.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    final contato = data
        .map((dataElement) => Contato.fromMap(dataElement))
        .last;
    return contato;
  }

  Future<Contato> update(Contato contato) async {
    final database = await getDatabase();
    await database.update(
      TabelaContato.tableName,
      TabelaContato.toMap(contato),
      where: 'id = ?',
      whereArgs: [contato.id],
    );
    return contato;
  }

  Future<void> delete(String id) async {
    final database = await getDatabase();
    await database.delete(
      TabelaContato.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
