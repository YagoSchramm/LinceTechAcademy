import 'package:contact_app/model/pessoa.dart';

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