// Tempo cronometrado 6:09 min
void main(List<String> args) {
  final temperaturas = <double>[0.0, 4.2, 15.0, 18.1, 21.7, 32.0, 40.0, 41.0];
  for (var i = 0; i < temperaturas.length; i++) {
    final f = calculaFarenheit(temperaturas[i]);
    final k = calculaKelvin(temperaturas[i]);
    print(
      "Celcius: ${temperaturas[i]}, fahrenheit: ${f.toStringAsFixed(2)}, kelvin: ${k.toStringAsFixed(2)}",
    );
  }
}

double calculaFarenheit(double temp) {
  return (temp * 1.8) + 32;
}

double calculaKelvin(double temp) {
  return temp + 273.15;
}
