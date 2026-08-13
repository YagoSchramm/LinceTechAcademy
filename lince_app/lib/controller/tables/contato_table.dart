import 'package:contact_app/controller/tables/pessoa_table.dart';
import 'package:contact_app/model/contato.dart';

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