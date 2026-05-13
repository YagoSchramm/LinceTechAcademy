import 'dart:ffi';
import 'dart:io';

void main(List<String> args) {
  print("Digite seu nome:");
  String nome =stdin.readLineSync()!;
  print("Digite seu sobrenome:");
  String sobrenome= stdin.readLineSync()!;
  print("Digite sua idade:");
  int idade=int.parse(stdin.readLineSync()!);
  print("Você está estudando?");
  bool ativo=bool.parse(stdin.readLineSync()!);
  print("Digite seu peso:");
  double peso=double.parse(stdin.readLineSync()!);
  print("Digite sua nacionalidade:");
  String? nacionalidade= stdin.readLineSync();

  print("Nome completo: $nome $sobrenome");

  if (idade < 18) {
    print("Idade: $idade menor de idade");
  } else {
    print("Idade: $idade maior de idade");
  }

  
  print("Situação: ${ativo?"Ativo":"Inativo"}");

  print("Peso: $peso");
  if (nacionalidade!=null && nacionalidade.isNotEmpty) {
      print("Sua nacionalidade é: $nacionalidade");
  } else {
    print("Nacionalidade não informada");
  }
}
