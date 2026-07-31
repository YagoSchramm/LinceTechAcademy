import 'package:contact_app/controller/pessoa_controller.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/model/pessoa.dart';

class HomeState extends ChangeNotifier {
  List<Pessoa> listaPessoas = [];
  PessoaController pessoaController = PessoaController();
  final TextEditingController nomePessoaController = TextEditingController();

  HomeState() {
    loadPessoas();
  }

  @override
  void dispose() {
    nomePessoaController.dispose();
    super.dispose();
  }

  void loadPessoas() async {
    listaPessoas = await pessoaController.getAll();
    notifyListeners();
  }

  Future<void> addPessoa(BuildContext context) async {
    final nomePessoa = nomePessoaController.text.trim();
    final navigator = Navigator.of(context);

    if (nomePessoa.isEmpty) {
      return;
    }

    await pessoaController.insert(
      Pessoa(
        id: '',
        nome: nomePessoa,
      ),
    );

    nomePessoaController.clear();
    navigator.pop();
    loadPessoas();
  }

  Future<void> deletePessoa(Pessoa pessoa) async {
    await pessoaController.delete(pessoa.id);
    loadPessoas();
  }

  Future<void> updatePessoa(BuildContext context, Pessoa pessoa) async {
    final nomePessoa = nomePessoaController.text.trim();
    final navigator = Navigator.of(context);

    if (nomePessoa.isEmpty) {
      return;
    }

    await pessoaController.update(
      Pessoa(
        id: pessoa.id,
        nome: nomePessoa,
      ),
    );

    nomePessoaController.clear();
    navigator.pop();
    loadPessoas();
  }

  void openUpdatePessoaOverlay(BuildContext context, Pessoa pessoa) {
    nomePessoaController.text = pessoa.nome;

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar pessoa'),
          content: TextField(
            controller: nomePessoaController,
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                nomePessoaController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () => updatePessoa(context, pessoa),
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void openDeletePessoaOverlay(BuildContext context, Pessoa pessoa) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Excluir pessoa'),
          content: Text('Deseja excluir ${pessoa.nome}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                await deletePessoa(pessoa);
                navigator.pop();
              },
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
  }

  void openAddPessoaOverlay(BuildContext context) {
    nomePessoaController.clear();

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Nova pessoa'),
          content: TextField(
            controller: nomePessoaController,
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                nomePessoaController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () => addPessoa(context),
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
