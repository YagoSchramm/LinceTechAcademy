void main() {
  const String nome = 'Yago';
  const String sobrenome = 'Schramm';
  const int idade = 17;
  const bool ativo = true;
  const double peso = 75.5;
  const String nacionalidade = 'Brasileiro';

  print('Nome completo: $nome $sobrenome');

  if (idade < 18) {
    print('Idade: $idade menor de idade');
  } else {
    print('Idade: $idade maior de idade');
  }

  print('Situação: ${ativo ? "Ativo" : "Inativo"}');
  print('Peso: $peso');

  if (nacionalidade.isNotEmpty) {
    print('Sua nacionalidade é: $nacionalidade');
  } else {
    print('Nacionalidade não informada');
  }
}
