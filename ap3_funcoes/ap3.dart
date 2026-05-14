import 'dart:math';

void main(List<String> args) {
  final random = Random();
  List<double> listaRaios=[];
  for (var i = 0; i < 10; i++) {
    listaRaios.add(random.nextDouble()*100);
  }
  
  for (var i = 0; i < listaRaios.length; i++) {
    final area= calculaArea(listaRaios[i]);
    final perimetro= calcularPerimetro(listaRaios[i]);
    print("Raio:${listaRaios[i]}, area: $area, perímetro: $perimetro.");
  }
}

double calculaArea(double r){
  const pi=3.1415;
  return pi*(r*r);
}

double calcularPerimetro(double r){
   const pi=3.1415;
  return 2*pi*r;
}