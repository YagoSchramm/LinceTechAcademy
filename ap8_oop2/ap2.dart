abstract class Animal {
  void comer() {
    print("o animal está comendo");
  }

  void beber() {
    print("o animal está bebendo");
  }
}

class Leao extends Animal{
  void rugir(){
    print("O leão está rugindo");
  }
}
void main(List<String> args) {
 final leao= Leao();
 leao.comer();
 leao.beber();
 leao.rugir();
}