class Produto {
  Produto(this.nome, this.preco);

  final String nome;
  final double preco;

  double desconto(double percentual) {
    if (percentual <= 0) {
      return preco;
    }
    return preco - (preco * (percentual / 100));
  }
}

void main(List<String> args) {
  final produtos = <Produto>[];
  final nomes = ["Copo", "Xícara", "Colher", "Garfo", "Faca"];
  final precos = [3.5, 5.25, 1.25, 1.35, 1.45];
  for (var i = 0; i < nomes.length; i++) {
    final produto = Produto(nomes[i], precos[i]);
    produtos.add(produto);
    final novoPreco = produto.desconto(3.0);

    print(
      "Novo preço do produto ${produtos[i].nome} (com desconto): $novoPreco\n",
    );
  }
}
