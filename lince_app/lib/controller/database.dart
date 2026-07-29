import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async{
  final path= join(
  await  getDatabasesPath(),
  'contatos.db'
  );
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TabelaPessoa.createTable);

    },
    version: 1
      );
}
class TabelaPessoa{
  static const String createTable=''' 
  CREATE TABLE $tableName(
  $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $nome TEXT NOT NULL
  );
  ''';

  static const String tableName="pessoas";
 
  static const String id="id";

  static const String nome= "nome";

}

class PessoaController{
  Future<void> insert(Pessoa pessoa)async{
final database=await getDatabase();
  }
}