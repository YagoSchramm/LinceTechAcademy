import 'package:flutter/material.dart';
import 'package:contact_app/view/details/details_state.dart';
import 'package:contact_app/view/widgets/contato_widget.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final String idPessoa;

  const DetailsScreen({
    super.key,
    required this.idPessoa,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailsState(idPessoa: idPessoa),
      child: const DetailsScreenContent(),
    );
  }
}

class DetailsScreenContent extends StatelessWidget {
  const DetailsScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsState>(
      builder: (context, state, child) {
        final pessoa = state.pessoa;

        return Scaffold(
          appBar: AppBar(
            title: Text(pessoa?.nome ?? 'Detalhes'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  pessoa?.nome ?? 'Carregando pessoa...',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: state.tipoContatoController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo do contato',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: state.contatoController,
                  decoration: const InputDecoration(
                    labelText: 'Contato',
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: state.addContato,
                  child: const Text('Salvar contato'),
                ),
                const SizedBox(height: 16),
                Text(
                  "Contatos salvos:",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.listaContatos.length,
                    itemBuilder: (context, index) {
                      final contato = state.listaContatos[index];

                      return ContatoWidget(
                        entity: contato,
                        onClick: (_) {},
                        onEdit: (contato) =>
                            state.openUpdateContatoOverlay(context, contato),
                        onDelete: (contato) =>
                            state.openDeleteContatoOverlay(context, contato),
                      );
                    },
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
