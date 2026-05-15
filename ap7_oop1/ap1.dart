class ContaBancaria {
  ContaBancaria(this.saldo, this.titular);
  double saldo;
  String titular;
  void sacar(double valor) {
    if (valor <= saldo) {
      this.saldo -= valor;
    } else {
      print("Não é possível sacar saldo insuficiente.");
    }
  }

  void depositar(double valor) {
    if(valor>0){
      this.saldo+=valor;
    }
    else{
      print("Valor inserido inválido");
    }
  }
}

void main(List<String> args) {
  final contaBancaria = ContaBancaria(1000, "Yago");
  contaBancaria.sacar(100);
  contaBancaria.depositar(958);
   print("Saldo atual: ${contaBancaria.saldo}");
}
