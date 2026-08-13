import 'package:contact_app/controller/contato_controller.dart';
import 'package:contact_app/controller/pessoa_controller.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/model/contato.dart';
import 'package:contact_app/model/pessoa.dart';

class DetailsState extends ChangeNotifier {
  final String idPessoa;
  final PessoaController pessoaController = PessoaController();
  final ContatoController contatoDatabaseController = ContatoController();
  final TextEditingController tipoContatoController = TextEditingController();
  final TextEditingController contatoController = TextEditingController();
  final TextEditingController editTipoContatoController =
      TextEditingController();
  final TextEditingController editContatoController = TextEditingController();

  Pessoa? pessoa;
  List<Contato> listaContatos = [];

  DetailsState({required this.idPessoa}) {
    loadDetails();
  }

  @override
  void dispose() {
    tipoContatoController.dispose();
    contatoController.dispose();
    editTipoContatoController.dispose();
    editContatoController.dispose();
    super.dispose();
  }

  Future<void> loadDetails() async {
    pessoa = await pessoaController.getById(idPessoa);
    listaContatos = await contatoDatabaseController.getByPessoaId(idPessoa);
    notifyListeners();
  }

  Future<void> addContato() async {
    final tipoContato = tipoContatoController.text.trim();
    final contato = contatoController.text.trim();

    if (tipoContato.isEmpty || contato.isEmpty) {
      return;
    }

    await contatoDatabaseController.insert(
      Contato(
        id: '',
        idPessoa: idPessoa,
        tipoContato: tipoContato,
        contato: contato,
      ),
    );

    tipoContatoController.clear();
    contatoController.clear();
    await loadDetails();
  }

  Future<void> deleteContato(Contato contato) async {
    await contatoDatabaseController.delete(contato.id);
    await loadDetails();
  }

  Future<void> updateContato(
    BuildContext context,
    Contato contato,
  ) async {
    final tipoContato = editTipoContatoController.text.trim();
    final contatoTexto = editContatoController.text.trim();
    final navigator = Navigator.of(context);

    if (tipoContato.isEmpty || contatoTexto.isEmpty) {
      return;
    }

    await contatoDatabaseController.update(
      Contato(
        id: contato.id,
        idPessoa: contato.idPessoa,
        tipoContato: tipoContato,
        contato: contatoTexto,
      ),
    );

    editTipoContatoController.clear();
    editContatoController.clear();
    navigator.pop();
    await loadDetails();
  }

  void openUpdateContatoOverlay(BuildContext context, Contato contato) {
    editTipoContatoController.text = contato.tipoContato;
    editContatoController.text = contato.contato;

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar contato'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: editTipoContatoController,
                decoration: const InputDecoration(
                  labelText: 'Tipo do contato',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: editContatoController,
                decoration: const InputDecoration(
                  labelText: 'Contato',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                editTipoContatoController.clear();
                editContatoController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () => updateContato(context, contato),
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void openDeleteContatoOverlay(BuildContext context, Contato contato) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Excluir contato'),
          content: Text('Deseja excluir ${contato.contato}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                await deleteContato(contato);
                navigator.pop();
              },
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
  }
}
