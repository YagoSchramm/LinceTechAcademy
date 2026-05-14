void main(List<String> args) {
  final valor = 100.0;
  final valorComDesconto = 70.0;

  print(
    'O produto custava $valor reais e foi vendido por $valorComDesconto reais.',
  );

  final desconto = calcularDesconto(valor, valorComDesconto);
  print('O desconto dado foi $desconto%.');
}

int calcularDesconto(double valor, double valorComDesconto) {
  final percentual = 100 - ((valorComDesconto * 100) ~/ valor);
  return percentual;
}
