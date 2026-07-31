import 'package:contact_app/controller/tables/contato_table.dart';
import 'package:contact_app/controller/tables/pessoa_table.dart';
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