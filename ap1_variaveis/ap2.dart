import 'dart:io';

void main(List<String> args) {
  final List<double> notas=List.filled(4, 0);
  double somaNotas=0;
  for (var i = 0; i < notas.length; i++) {
    notas[i]=double.parse(stdin.readLineSync()!);
   somaNotas+=notas[i];
  }
 
 final media=somaNotas/notas.length;
 print("A media entre $notas = $media");
}