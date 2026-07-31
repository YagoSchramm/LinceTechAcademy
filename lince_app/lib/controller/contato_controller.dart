import 'package:contact_app/controller/database/database.dart';
import 'package:contact_app/controller/tables/contato_table.dart';
import 'package:contact_app/model/contato.dart';

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
