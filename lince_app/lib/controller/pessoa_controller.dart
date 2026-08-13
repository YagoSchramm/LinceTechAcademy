
import 'package:contact_app/controller/database/database.dart';
import 'package:contact_app/controller/tables/contato_table.dart';
import 'package:contact_app/controller/tables/pessoa_table.dart';
import 'package:contact_app/model/pessoa.dart';

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