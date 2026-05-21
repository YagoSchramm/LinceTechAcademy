import 'package:ap1/pessoa.dart';
import 'package:ap1/pessoa_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaCriar extends StatefulWidget {
  @override
  State<TelaCriar> createState() => _TelaCriarState();
}

class _TelaCriarState extends State<TelaCriar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EstadoListaDePessoas>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(title: Text("Gerenciar Pessoas")),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.add),
                    label: Text("Criar Novo Usuário"),
                    onPressed: () => _abrirDialogCriar(context, state),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: Icon(Icons.edit),
                    label: Text("Editar Usuário"),
                    onPressed: () => _abrirDialogEditar(context, state),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: Icon(Icons.delete),
                    label: Text("Excluir Usuário"),
                    onPressed: () => _abrirDialogExcluir(context, state),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _abrirDialogCriar(BuildContext context, EstadoListaDePessoas state) {
    final nomeController = TextEditingController();
    final emailController = TextEditingController();
    final telefoneController = TextEditingController();
    final githubController = TextEditingController();
    TipoSanguineo? tipoSelecionado;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text("Criar Novo Usuário"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nomeController,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email (identificador)",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: telefoneController,
                      decoration: InputDecoration(
                        labelText: "Telefone",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: githubController,
                      decoration: InputDecoration(
                        labelText: "GitHub",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),
                    DropdownButton<TipoSanguineo>(
                      isExpanded: true,
                      hint: Text("Selecione o tipo sanguíneo"),
                      value: tipoSelecionado,
                      onChanged: (tipo) {
                        setDialogState(() {
                          tipoSelecionado = tipo;
                        });
                      },
                      items: TipoSanguineo.values.map((tipo) {
                        return DropdownMenuItem(
                          value: tipo,
                          child: Text(state.getNomeTipoSanguineo(tipo)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nomeController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        telefoneController.text.isNotEmpty &&
                        githubController.text.isNotEmpty &&
                        tipoSelecionado != null) {
                      final pessoa = Pessoa(
                        nome: nomeController.text,
                        email: emailController.text,
                        telefone: telefoneController.text,
                        github: githubController.text,
                        tipoSanguineo: tipoSelecionado!,
                      );
                      state.incluir(pessoa);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Usuário criado com sucesso!")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Preencha todos os campos!")),
                      );
                    }
                  },
                  child: Text("Criar"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _abrirDialogEditar(BuildContext context, EstadoListaDePessoas state) {
    String? emailSelecionado;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text("Selecionar Usuário para Editar"),
              content: state.pessoas.isEmpty
                  ? Text("Nenhum usuário disponível")
                  : DropdownButton<String>(
                      isExpanded: true,
                      hint: Text("Selecione o usuário"),
                      value: emailSelecionado,
                      onChanged: (email) {
                        setDialogState(() {
                          emailSelecionado = email;
                        });
                      },
                      items: state.pessoas.map((pessoa) {
                        return DropdownMenuItem(
                          value: pessoa.email,
                          child: Text("${pessoa.nome} (${pessoa.email})"),
                        );
                      }).toList(),
                    ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar"),
                ),
                if (emailSelecionado != null)
                  ElevatedButton(
                    onPressed: () {
                      final pessoa = state.pessoas
                          .firstWhere((p) => p.email == emailSelecionado);
                      Navigator.pop(context);
                      _abrirDialogEditarDados(context, state, pessoa);
                    },
                    child: Text("Editar"),
                  ),
              ],
            );
          },
        );
      },
    );
  }

  void _abrirDialogEditarDados(
      BuildContext context, EstadoListaDePessoas state, Pessoa pessoa) {
    final nomeController = TextEditingController(text: pessoa.nome);
    final telefoneController = TextEditingController(text: pessoa.telefone);
    final githubController = TextEditingController(text: pessoa.github);
    TipoSanguineo? tipoSelecionado = pessoa.tipoSanguineo;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text("Editar Usuário"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      enabled: false,
                      controller: TextEditingController(text: pessoa.email),
                      decoration: InputDecoration(
                        labelText: "Email (não pode ser alterado)",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: nomeController,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: telefoneController,
                      decoration: InputDecoration(
                        labelText: "Telefone",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: githubController,
                      decoration: InputDecoration(
                        labelText: "GitHub",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),
                    DropdownButton<TipoSanguineo>(
                      isExpanded: true,
                      value: tipoSelecionado,
                      onChanged: (tipo) {
                        setDialogState(() {
                          tipoSelecionado = tipo;
                        });
                      },
                      items: TipoSanguineo.values.map((tipo) {
                        return DropdownMenuItem(
                          value: tipo,
                          child: Text(state.getNomeTipoSanguineo(tipo)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nomeController.text.isNotEmpty &&
                        telefoneController.text.isNotEmpty &&
                        githubController.text.isNotEmpty &&
                        tipoSelecionado != null) {
                      final pessoaEditada = Pessoa(
                        nome: nomeController.text,
                        email: pessoa.email,
                        telefone: telefoneController.text,
                        github: githubController.text,
                        tipoSanguineo: tipoSelecionado!,
                      );
                      state.editar(pessoaEditada);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Usuário atualizado com sucesso!")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Preencha todos os campos!")),
                      );
                    }
                  },
                  child: Text("Salvar"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _abrirDialogExcluir(BuildContext context, EstadoListaDePessoas state) {
    String? emailSelecionado;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text("Excluir Usuário"),
              content: state.pessoas.isEmpty
                  ? Text("Nenhum usuário disponível")
                  : DropdownButton<String>(
                      isExpanded: true,
                      hint: Text("Selecione o usuário para excluir"),
                      value: emailSelecionado,
                      onChanged: (email) {
                        setDialogState(() {
                          emailSelecionado = email;
                        });
                      },
                      items: state.pessoas.map((pessoa) {
                        return DropdownMenuItem(
                          value: pessoa.email,
                          child: Text("${pessoa.nome} (${pessoa.email})"),
                        );
                      }).toList(),
                    ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar"),
                ),
                if (emailSelecionado != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      final pessoa = state.pessoas
                          .firstWhere((p) => p.email == emailSelecionado);
                      state.excluir(pessoa);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Usuário excluído com sucesso!")),
                      );
                    },
                    child: Text("Excluir"),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}