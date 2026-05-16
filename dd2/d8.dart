import 'dart:math';
// Tempo 1:02:49 hrs
class Figura {
  final String nome;
  final int codigo;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Figura && codigo == other.codigo;

  @override
  int get hashCode => codigo.hashCode;

  @override
  String toString() {
    return "$nome ($codigo)";
  }

  Figura({required this.nome, required this.codigo});
}

class Figurinhas {
  List<Figura> figurinhasDoAlbum = [
    Figura(nome: "Mario", codigo: 1),
    Figura(nome: "Sonic the Hedgehog", codigo: 2),
    Figura(nome: "Link (The Legend of Zelda)", codigo: 3),
    Figura(nome: "Pac-Man", codigo: 4),
    Figura(nome: "Pikachu", codigo: 5),
    Figura(nome: "Mega Man", codigo: 6),
    Figura(nome: "Donkey Kong", codigo: 7),
    Figura(nome: "Crash Bandicoot", codigo: 8),
    Figura(nome: "Lara Croft", codigo: 9),
    Figura(nome: "Ryu (Street Fighter)", codigo: 10),
    Figura(nome: "Scorpion (Mortal Kombat)", codigo: 11),
    Figura(nome: "Kirby", codigo: 12),
    Figura(nome: "Fox McCloud (Star Fox)", codigo: 13),
    Figura(nome: "Bomberman", codigo: 14),
    Figura(nome: "Kratos (God of War)", codigo: 15),
    Figura(nome: "Master Chief (Halo)", codigo: 16),
    Figura(nome: "Samus Aran (Metroid)", codigo: 17),
    Figura(nome: "Spyro the Dragon", codigo: 18),
    Figura(nome: "Solid Snake (Metal Gear)", codigo: 19),
    Figura(nome: "Geralt de Rívia (The Witcher)", codigo: 20),
  ];
}

class Album {
  Set<Figura> figurinhas = <Figura>{};
  void figurasColadas() {
    final figurinhasOrdenadas = figurinhas.toList();
    figurinhasOrdenadas.sort((a, b) => a.codigo.compareTo(b.codigo));
    for (var figura in figurinhasOrdenadas) {
      print("Figura ${figura.nome} cod:${figura.codigo}");
    }
    if (figurinhas.length == 20) {
      print("Album completo!");
    }
  }

  bool isCompleto() {
    return figurinhas.length == 20;
  }

  Figura? adicionarFigura(Figura figura) {
    if (figurinhas.contains(figura)) {
      return figura;
    }
    figurinhas.add(figura);
    return null;
  }
}

class PacoteFigurinhas {
  Random _random = Random();
  final List<Figura> figurinhas = <Figura>[];

  PacoteFigurinhas() {
    Figurinhas figurinha = Figurinhas();
    for (var i = 0; i < 4; i++) {
      final j = _random.nextInt(figurinha.figurinhasDoAlbum.length);
      Figura figura = figurinha.figurinhasDoAlbum[j];
      figurinhas.add(figura);
    }
  }
}

void main(List<String> args) {
  Album album = Album();
  List<Figura> repetidas = [];
  bool completo = album.isCompleto();
  while (completo == false) {
    PacoteFigurinhas pacoteFigurinhas = PacoteFigurinhas();
    final figurinhas = pacoteFigurinhas.figurinhas;
    for (var figura in figurinhas) {
      final repetida = album.adicionarFigura(figura);
      if (repetida != null) {
        repetidas.add(repetida);
      }
    }
    completo = album.isCompleto();
  }
  print("Figurinhas repetidas: ${repetidas.join(" , ").toString()}\n");
  album.figurasColadas();
}
