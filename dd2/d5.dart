// Tempo 32:43 min
import 'dart:math';

class Item {
  Item({required this.nome, required this.qtd, this.status = "pendente"});
  String nome;
  int qtd;
  String status;
}

class ListaCompras {
  List<Item> itens = [];
  void adicionarItem(String nome, int quantidade) {
    itens.add(Item(nome: nome, qtd: quantidade));
  }

  void marcarComoComprado(String nome) {
    for (var item in itens) {
      if (item.nome == nome) {
        item.status = "comprado";
      }
    }
  }

  void marcarSemEstoque(String nome) {
    for (var item in itens) {
      if (item.nome == nome) {
        item.status = "sem estoque";
      }
    }
  }

  void mostrarItens() {
    print("\nLista de compras:");

    for (var item in itens) {
      print("${item.nome} - Quantidade: ${item.qtd} - Status: ${item.status}");
    }
  }

  void escolherItemAleatorio() {
    List<Item> pendentes = [];

    for (var item in itens) {
      if (item.status == "pendente") {
        pendentes.add(item);
      }
    }

    if (pendentes.isEmpty) {
      print("Não existem itens pendentes.");
      return;
    }

    Random random = Random();

    int indice = random.nextInt(pendentes.length);

    print("Item escolhido: ${pendentes[indice].nome}");
  }

  void mostrarProgresso() {
    int comprados = 0;

    for (var item in itens) {
      if (item.status == "comprado") {
        comprados++;
      }
    }
    int pendentes=0;
      for (var item in itens) {
      if (item.status == "sem estoque") {
       continue;
      }
      pendentes++;
    }
    print("Progresso: $comprados/${pendentes}");
  }

  
}

void main(List<String> args) {
  ListaCompras lista = ListaCompras();

  lista.adicionarItem(
    "Arroz",
    2,
  );

  lista.adicionarItem(
    "Feijão",
    3,
  );

  lista.adicionarItem(
    "Leite",
    1,
  );

  lista.mostrarItens();

  lista.escolherItemAleatorio();

  lista.marcarComoComprado(
    "Arroz",
  );

  lista.marcarComoComprado(
    "Feijão",
  );

  lista.marcarSemEstoque(
    "Leite",
  );

  lista.mostrarItens();

  lista.mostrarProgresso();
}
