void main(List<String> args) {
  converteString("a");
}

int converteString(String num) {
  try {
    int n = int.parse(num);
    print("Numero digitado: $n");
  } catch (e) {
    print("Entrada invalida. Insira apenas números inteiros.");
  }
   return 0;
}
