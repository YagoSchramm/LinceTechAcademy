import 'package:ap1/pessoa.dart';
import 'package:ap1/pessoa_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EstadoListaDePessoas>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(title: Text("Tela com Listas")),
          body: Column(
            children: [
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "Filtros:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Wrap(
                children: TipoSanguineo.values.map((tipo) {
                  return SizedBox(
                    width: 150,
                    child: RadioListTile<TipoSanguineo>(
                      title: Text(state.getNomeTipoSanguineo(tipo)),
                      value: tipo,
                      groupValue: state.filtroSelecionado,
                      onChanged: state.filtrar,
                    ),
                  );
                }).toList(),
              ),
              TextButton(
                onPressed: state.limparFiltro,
                child: Text(
                  "Limpar filtro",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: state.pessoasFiltradas.isEmpty
                    ? Center(
                        child: Text("Nenhuma pessoa encontrada"),
                      )
                    : ListView.builder(
                        itemCount: state.pessoasFiltradas.length,
                        itemBuilder: (BuildContext context, int index) {
                          final pessoa = state.pessoasFiltradas[index];
                          final tipo =
                              state.getNomeTipoSanguineo(pessoa.tipoSanguineo);

                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: state.getCorTipoSanguineo(tipo),
                              child: Text(
                                tipo,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            title: Text(pessoa.nome),
                            subtitle: Text(
                              '${pessoa.email}\n${pessoa.telefone}\n${pessoa.github}',
                            ),
                            isThreeLine: true,
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
