void main() {
  const int quantidadeNotas = 4;
  const double nota1 = 8.5;
  const double nota2 = 7.0;
  const double nota3 = 9.0;
  const double nota4 = 6.5;

  const double somaNotas = nota1 + nota2 + nota3 + nota4;
  const double media = somaNotas / quantidadeNotas;

  print('A média entre [$nota1, $nota2, $nota3, $nota4] = $media');
}
