enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

class Pessoa {
  const Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  final String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo tipoSanguineo;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pessoa &&
          nome == other.nome &&
          email == other.email &&
          telefone == other.telefone &&
          github == other.github &&
          tipoSanguineo == other.tipoSanguineo;

  @override
  int get hashCode => Object.hash(
        nome,
        email,
        telefone,
        github,
        tipoSanguineo,
      );
}
