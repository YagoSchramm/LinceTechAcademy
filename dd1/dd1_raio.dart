// Tempo cronometrado 5:16 min
void main(List<String> args) {
final raios= <double>[5, 8, 12, 7.3, 18, 2, 25];
for (var i = 0; i < raios.length; i++) {
  calculaAreaPerimetro(raios[i]);
}
}
void calculaAreaPerimetro(double r) {
  const pi= 3.1415;
  final area= pi*(r*r);
  final perimetro= 2* pi*r;
    print("Raio: $r, area: ${area.toStringAsFixed(2)}, perímetro: ${perimetro.toStringAsFixed(2)}.");
}