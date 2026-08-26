import 'package:flutter/material.dart';
import 'package:contact_app/model/pessoa.dart';
import 'package:contact_app/view/details/details_screen.dart';
import 'package:contact_app/view/home/home_state.dart';
import 'package:contact_app/view/widgets/pessoa_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeState(),
      child: const HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  void openDetails(BuildContext context, Pessoa pessoa) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailsScreen(idPessoa: pessoa.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeState>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Lista de contatos"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.listaPessoas.length,
                    itemBuilder: (context, index) {
                      final pessoa = state.listaPessoas[index];

                      return PessoaWidget(
                        entity: pessoa,
                        onClick: (pessoa) => openDetails(context, pessoa),
                        onEdit: (pessoa) =>
                            state.openUpdatePessoaOverlay(context, pessoa),
                        onDelete: (pessoa) =>
                            state.openDeletePessoaOverlay(context, pessoa),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () => state.openAddPessoaOverlay(context),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(18),
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
