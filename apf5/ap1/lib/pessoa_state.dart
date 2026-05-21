import 'package:ap1/pessoa.dart';
import 'package:flutter/material.dart';

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[];

  List<Pessoa> get pessoas => List.unmodifiable(_listaDePessoas);
  TipoSanguineo? _filtroSelecionado;

  TipoSanguineo? get filtroSelecionado => _filtroSelecionado;

  List<Pessoa> get pessoasFiltradas {
    if (_filtroSelecionado == null) {
      return _listaDePessoas;
    }
    return _listaDePessoas
        .where((p) => p.tipoSanguineo == _filtroSelecionado)
        .toList();
  }

  void filtrar(TipoSanguineo? tipo) {
    _filtroSelecionado = tipo;
    notifyListeners();
  }

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    notifyListeners();
  }

  void editar(Pessoa editada) {
    _listaDePessoas.removeWhere((pessoa) {
      if (editada.email == pessoa.email) {
        return true;
      }
      return false;
    });
    _listaDePessoas.add(editada);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    notifyListeners();
  }

  void limparFiltro() {
    _filtroSelecionado = null;
    notifyListeners();
  }

  Color getCorTipoSanguineo(String tipo) {
    switch (tipo) {
      case 'A+':
        return Colors.blue[100]!;
      case 'A-':
        return Colors.red[100]!;
      case 'B+':
        return Colors.purple[100]!;
      case 'B-':
        return Colors.orange[100]!;
      case 'O+':
        return Colors.green[100]!;
      case 'O-':
        return Colors.yellow[100]!;
      case 'AB+':
        return Colors.cyan[100]!;
      case 'AB-':
        return Colors.white;
      default:
        return Colors.grey[200]!;
    }
  }

  String getNomeTipoSanguineo(TipoSanguineo tipo) {
    switch (tipo) {
      case TipoSanguineo.aPositivo:
        return 'A+';
      case TipoSanguineo.aNegativo:
        return 'A-';
      case TipoSanguineo.bPositivo:
        return 'B+';
      case TipoSanguineo.bNegativo:
        return 'B-';
      case TipoSanguineo.oPositivo:
        return 'O+';
      case TipoSanguineo.oNegativo:
        return 'O-';
      case TipoSanguineo.abPositivo:
        return 'AB+';
      case TipoSanguineo.abNegativo:
        return 'AB-';
    }
  }
}
