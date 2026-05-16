// Tempo: 57:20 min
class Musica {
  Musica({
    required this.nome,
    required this.artista,
    required this.album,
    required this.duracao,
  });
  String nome;
  String artista;
  String album;
  Duration duracao;
}

class Biblioteca {
  List<Musica> musicas = [
    Musica(
      nome: 'Nights',
      artista: 'Frank Ocean',
      album: 'Blonde',
      duracao: Duration(seconds: 307),
    ),
    Musica(
      nome: 'Self Control',
      artista: 'Frank Ocean',
      album: 'Blonde',
      duracao: Duration(seconds: 249),
    ),
    Musica(
      nome: 'White Ferrari',
      artista: 'Frank Ocean',
      album: 'Blonde',
      duracao: Duration(seconds: 232),
    ),
    Musica(
      nome: 'Pink + White',
      artista: 'Frank Ocean',
      album: 'Blonde',
      duracao: Duration(seconds: 214),
    ),
    Musica(
      nome: 'Thinkin Bout You',
      artista: 'Frank Ocean',
      album: 'Channel ORANGE',
      duracao: Duration(seconds: 201),
    ),
    Musica(
      nome: 'SICKO MODE',
      artista: 'Travis Scott',
      album: 'Astroworld',
      duracao: Duration(seconds: 312),
    ),
    Musica(
      nome: 'STARGAZING',
      artista: 'Travis Scott',
      album: 'Astroworld',
      duracao: Duration(seconds: 273),
    ),
    Musica(
      nome: 'STOP TRYING TO BE GOD',
      artista: 'Travis Scott',
      album: 'Astroworld',
      duracao: Duration(seconds: 328),
    ),
    Musica(
      nome: 'goosebumps',
      artista: 'Travis Scott',
      album: 'Birds in the Trap Sing McKnight',
      duracao: Duration(seconds: 243),
    ),
    Musica(
      nome: 'HIGHEST IN THE ROOM',
      artista: 'Travis Scott',
      album: 'HIGHEST IN THE ROOM',
      duracao: Duration(seconds: 177),
    ),
    Musica(
      nome: 'Máquina do Tempo',
      artista: 'Matuê',
      album: 'Máquina do tempo',
      duracao: Duration(seconds: 190),
    ),
    Musica(
      nome: 'Antes',
      artista: 'Matuê',
      album: 'Máquina do tempo',
      duracao: Duration(seconds: 178),
    ),
    Musica(
      nome: 'Gorilla Roxo',
      artista: 'Matuê',
      album: 'Máquina do tempo',
      duracao: Duration(seconds: 202),
    ),
    Musica(
      nome: '333',
      artista: 'Matuê',
      album: '333',
      duracao: Duration(seconds: 185),
    ),
    Musica(
      nome: 'Isso é sério',
      artista: 'Matuê',
      album: '333',
      duracao: Duration(seconds: 245),
    ),

    Musica(
      nome: 'Runaway',
      artista: 'Kanye West',
      album: 'My Beautiful Dark Twisted Fantasy',
      duracao: Duration(seconds: 548),
    ),
    Musica(
      nome: 'All Of The Lights',
      artista: 'Kanye West',
      album: 'My Beautiful Dark Twisted Fantasy',
      duracao: Duration(seconds: 299),
    ),
    Musica(
      nome: 'POWER',
      artista: 'Kanye West',
      album: 'My Beautiful Dark Twisted Fantasy',
      duracao: Duration(seconds: 292),
    ),
    Musica(
      nome: 'Heartless',
      artista: 'Kanye West',
      album: 'Graduation',
      duracao: Duration(seconds: 199),
    ),
    Musica(
      nome: 'Flashing Lights',
      artista: 'Kanye West',
      album: 'Graduation',
      duracao: Duration(seconds: 239),
    ),

    Musica(
      nome: 'No Idea',
      artista: 'Don Toliver',
      album: 'Heaven or Hell',
      duracao: Duration(seconds: 175),
    ),
    Musica(
      nome: 'After Party',
      artista: 'Don Toliver',
      album: 'Heaven or Hell',
      duracao: Duration(seconds: 194),
    ),
    Musica(
      nome: 'BANDIT',
      artista: 'Don Toliver',
      album: 'Hardstone PSYCHO',
      duracao: Duration(seconds: 182),
    ),
    Musica(
      nome: 'No Pole',
      artista: 'Don Toliver',
      album: 'Life of a DON',
      duracao: Duration(seconds: 171),
    ),
    Musica(
      nome: 'Private Landing',
      artista: 'Don Toliver',
      album: 'Life of a DON',
      duracao: Duration(seconds: 209),
    ),

    Musica(
      nome: 'Tunnel Vision',
      artista: 'Future',
      album: 'HNDRXX',
      duracao: Duration(seconds: 276),
    ),
    Musica(
      nome: 'Hallucinating',
      artista: 'Future',
      album: 'HNDRXX',
      duracao: Duration(seconds: 244),
    ),
    Musica(
      nome: 'Selfish',
      artista: 'Future',
      album: 'HNDRXX',
      duracao: Duration(seconds: 251),
    ),
    Musica(
      nome: 'Mask Off',
      artista: 'Future',
      album: 'Future',
      duracao: Duration(seconds: 222),
    ),
    Musica(
      nome: 'Life Is Good',
      artista: 'Future',
      album: 'High Off Life',
      duracao: Duration(seconds: 211),
    ),

    Musica(
      nome: 'Marvins Room',
      artista: 'Drake',
      album: 'Take Care',
      duracao: Duration(seconds: 300),
    ),
    Musica(
      nome: 'Take Care',
      artista: 'Drake',
      album: 'Take Care',
      duracao: Duration(seconds: 277),
    ),
    Musica(
      nome: 'Crew Love',
      artista: 'Drake',
      album: 'Take Care',
      duracao: Duration(seconds: 247),
    ),
    Musica(
      nome: 'One Dance',
      artista: 'Drake',
      album: 'Views',
      duracao: Duration(seconds: 174),
    ),
    Musica(
      nome: "God's Plan",
      artista: 'Drake',
      album: 'Scorpion',
      duracao: Duration(seconds: 199),
    ),
  ];

  void informacoes() {
    print("Músicas cadastradas:");
    for (var musica in musicas) {
      print("Nome: ${musica.nome}");
      print("Album: ${musica.album}");
      print("Artista: ${musica.artista}");
      print("Duração: ${musica.duracao.inSeconds} seg\n");
    }
    print("\nOutras informações:");
    print("Número de músicas: ${musicas.length}");
    print("Tempo total: ${calcularTempo()}\n");
  }

  String calcularTempo() {
    Duration duracaoTotal = Duration();
    musicas.forEach((musica) => duracaoTotal += musica.duracao);
    int horas = duracaoTotal.inHours;
    int minutos = duracaoTotal.inMinutes % 60;
    int segundos = duracaoTotal.inSeconds % 60;
    return "${horas.toString().padLeft(2, "0")}:${minutos.toString().padLeft(2, "0")}:${segundos.toString().padLeft(2, "0")}";
  }

  List<Musica> getByArtistName(String artista) {
    List<Musica> musicasDoArtista = [];
    musicas.forEach((musica) {
      if (musica.artista == artista) {
        musicasDoArtista.add(musica);
      }
    });
    return musicasDoArtista;
  }

  Musica? getByName(String nome) {
    Musica? musicaEncontrada;
    musicas.forEach((musica) {
      if (musica.nome == nome) {
        musicaEncontrada = musica;
      }
    });
    if (musicaEncontrada != null) {
      return musicaEncontrada;
    }
    return null;
  }

  List<Musica> getByAlbumName(String album) {
    List<Musica> musicasDoAlbum = [];
    musicas.forEach((musica) {
      if (musica.album == album) {
        musicasDoAlbum.add(musica);
      }
    });
    return musicasDoAlbum;
  }
}

void main(List<String> args) {
  Biblioteca biblioteca = Biblioteca();
  biblioteca.informacoes();

  final musicasArtista = biblioteca.getByArtistName("Frank Ocean");
  final musicasAlbum = biblioteca.getByAlbumName("Astroworld");
  final musica = biblioteca.getByName("333");
  print("Musicas de ${musicasArtista[1].artista}");
  for (var musica in musicasArtista) {
    print("Nome: ${musica.nome}");
    print("Album: ${musica.album}");
    print("Artista: ${musica.artista}");
    print("Duração: ${musica.duracao.inSeconds} seg");
  }

  print("Musicas do álbum ${musicasAlbum[1].album}");
  for (var musica in musicasAlbum) {
    print("Nome: ${musica.nome}");
    print("Album: ${musica.album}");
    print("Artista: ${musica.artista}");
    print("Duração: ${musica.duracao.inSeconds} seg");
  }

  print("Musica com o nome ${musica!.nome}");
  print("Nome: ${musica.nome}");
  print("Album: ${musica.album}");
  print("Artista: ${musica.artista}");
  print("Duração: ${musica.duracao.inSeconds} seg");
}
