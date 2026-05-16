// Tempo 17:53 min
void main(List<String> args) {
  final data = DateTime(2022, 09, 5);
  final dataSomada = soma18(data);
  print("Data atual: ${formataData(data)}");
  print("Data calculada: ${formataData(dataSomada)}");
}

DateTime soma18(DateTime data) {
  int contador = 0;
  DateTime dataDepois = data;

  while (contador < 18) {
    dataDepois = dataDepois.add(Duration(days: 1));

    switch (dataDepois.weekday) {
      case DateTime.saturday:
      case DateTime.sunday:
        break;
      default:
        contador++;
    }
  }

  return dataDepois;
}

String formataData(DateTime data) {
  String dia = data.day.toString().padLeft(2, '0');
  String mes = data.month.toString().padLeft(2, '0');
  String ano = data.year.toString();
  return "$dia/$mes/$ano";
}
