class Pessoa {
  const Pessoa(
    this.nome,
    this.sobrenome,
    this.idade,
    this.ativo,
    this.peso,
    this.nacionalidade,
  );
  
  final String nome;
  final String sobrenome;
  final int idade;
  final bool ativo;
  final double peso;
  final String? nacionalidade;
}

void main() {
  const pessoa = Pessoa(
    'Yago',
    'Schramm',
    17,
    true,
    75.5,
    'Brasileiro',
  );

  print('Nome completo: ${pessoa.nome} ${pessoa.sobrenome}');

  if (pessoa.idade < 18) {
    print('Idade: ${pessoa.idade} menor de idade');
  } else {
    print('Idade: ${pessoa.idade} maior de idade');
  }

  print('Situação: ${pessoa.ativo ? "Ativo" : "Inativo"}');
  print('Peso: ${pessoa.peso}');

  if (pessoa.nacionalidade != null && pessoa.nacionalidade!.isNotEmpty) {
    print('Sua nacionalidade é: ${pessoa.nacionalidade}');
  } else {
    print('Nacionalidade não informada');
  }
}

