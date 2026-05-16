import 'dart:collection';
// Tempo 23:47 min
void main(List<String> args) {
  Baralho baralho=Baralho();
  baralho.adicionarCarta(Carta("A", "paus"));
  baralho.adicionarCarta(Carta("A", "copas"));
  baralho.adicionarCarta(Carta("A", "espadas"));
  baralho.adicionarCarta(Carta("A", "ouros"));
  for (var i = 0; i < 4; i++) {
    baralho.removerCarta();
  }
}
class Baralho{
   Queue<Carta> pilha=Queue<Carta>();
   void adicionarCarta(Carta carta){
    print("Adicionando Carta ${carta.carta} de ${carta.naipe} na pilha");
    pilha.add(carta);
   }
   void removerCarta(){
    final carta=pilha.last;
    print("Removendo Carta ${carta.carta} de ${carta.naipe} da pilha");
    pilha.removeLast();
   }
}
class Carta {
  String carta;
  String naipe;

 Carta(this.carta, this.naipe){
    if (naipe != "paus" && 
        naipe != "copas" && 
        naipe != "espadas" && 
        naipe != "ouros") {
      throw Exception("Naipe inválido: $naipe");
    }
  }
}