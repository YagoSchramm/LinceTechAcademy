void main(List<String> args) {
  try {
    ehPar(5);
    print("Entrada correta, você inseriu um número par");
  } catch (e) {
    print(e);
  }
}

void ehPar(int n) {
  if (n.isOdd) {
    throw Exception("Entrada inválida. Insira apenas números pares.");
  }
}
