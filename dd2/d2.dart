import 'dart:math';
// Tempo 43:36 min
void main() {
  final pessoa = Pessoa();
  final fornecedores = <Fornecedor>[
    FornecedorDeBebidas(),
    FornecedorDeSanduiches(),
    FornecedorDeBolos(),
    FornecedorDeSaladas(),
    FornecedorDePetiscos(),
    FornecedorUltraCalorico(),
  ];
  pessoa.informacoes();

  final random = Random();
    while (pessoa.precisaDeRefeicao()) {
    // Sorteia um fornecedor diferente a cada refeição
    final fornecedorAleatorio = fornecedores[random.nextInt(fornecedores.length)];
    pessoa.refeicao(fornecedorAleatorio);
  }

  pessoa.informacoes();
}

class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

// interface de fornecedor para abstração dentro de pessoa
abstract class Fornecedor {
  final _random = Random();

  /// Lista de produtos que este fornecedor oferece
  List<Produto> get produtos;

  /// Retorna um produto aleatório do cardápio deste fornecedor
  Produto fornecer() {
    return produtos[_random.nextInt(produtos.length)];
  }
}

enum StatusCalorico { deficitExtremo, deficit, satisfeita, excesso }

class FornecedorDeBebidas extends Fornecedor {
  final _random = Random();
  final _produtos = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];
  @override
  List<Produto> get produtos => _produtos;
}

class FornecedorDeSanduiches extends Fornecedor {
  @override
  List<Produto> get produtos => [
    Produto('Sanduiche natural', 250),
    Produto('X-burguer', 520),
    Produto('Club sandwich', 430),
    Produto('Wrap de frango', 380),
  ];
}

class FornecedorDeBolos extends Fornecedor {
  @override
  List<Produto> get produtos => [
    Produto('Bolo de cenoura', 310),
    Produto('Bolo de chocolate', 450),
    Produto('Bolo de limao', 280),
    Produto('Bolo de cereja', 180),
  ];
}

class FornecedorDeSaladas extends Fornecedor {
  @override
  List<Produto> get produtos => [
    Produto('Salada verde', 50),
    Produto('Salada Caesar', 190),
    Produto('Salada de frutas', 120),
    Produto('Salada caprese', 210),
  ];
}

class FornecedorDePetiscos extends Fornecedor {
  @override
  List<Produto> get produtos => [
    Produto('Amendoim', 160),
    Produto('Batata frita', 270),
    Produto('Azeitona', 80),
    Produto('Torresmo', 350),
  ];
}

class FornecedorUltraCalorico extends Fornecedor {
  @override
  List<Produto> get produtos => [
    Produto('Cheeseburguer duplo', 850),
    Produto('Milk-shake de chocolate', 720),
    Produto('Pizza de calabresa (2 fatias)', 630),
    Produto('Pastel de carne com caldo de cana', 700),
  ];
}

class Pessoa {
  static final _random = Random();
  // Acumulador de calorias
  int _caloriasConsumidas = _random.nextInt(2500);
  // Contador de refeicoes realizadas
  int _refeicoes = 0;
  // Calcula o status com base nas calorias atuais usando o enum
   StatusCalorico get status {
    if (_caloriasConsumidas <= 500) {
      return StatusCalorico.deficitExtremo;
    } else if (_caloriasConsumidas <= 1800) {
      return StatusCalorico.deficit;
    } else if (_caloriasConsumidas <= 2500) {
      return StatusCalorico.satisfeita;
    } else {
      return StatusCalorico.excesso;
    }
  }
  // Verifica se precisa de mais alguma refeicao
  bool precisaDeRefeicao() {
    return status == StatusCalorico.deficitExtremo ||
        status == StatusCalorico.deficit;
  }
  /// Imprime as informacoes desse consumidor
  void informacoes() {
     final statusDescricao = switch (status) {
      StatusCalorico.deficitExtremo => 'Déficit extremo de calorias',
      StatusCalorico.deficit        => 'Déficit de calorias',
      StatusCalorico.satisfeita     => 'Satisfeita',
      StatusCalorico.excesso        => 'Excesso de calorias',
    };

    print('Calorias consumidas : $_caloriasConsumidas cal');
    print('Status calórico     : $statusDescricao');      
    print('Refeições realizadas: $_refeicoes');           
  }
  /// Consome um produto e aumenta o número de calorias
  /// Reescrito para aceitar a interface de fornecedor
  void refeicao(Fornecedor fornecedor) {
    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} cal) '
        '— fornecedor: ${fornecedor.runtimeType}');
 
    _caloriasConsumidas += produto.calorias;
 
    // Incrementa o contador a cada refeição
    _refeicoes++;
  }
}
