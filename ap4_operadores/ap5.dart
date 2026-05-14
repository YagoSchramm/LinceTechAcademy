void main(List<String> args) {
  Map<String, int?> mapaIdade = {
    "Nelson": null,
    "Jane": null,
    "Jack": 16,
    "Rupert": 37,
    "Andy": 13,
    "Kim": 27,
    "Robert": 31,
  };
  
  for (var nome in mapaIdade.keys) {
      final idade = mapaIdade[nome];
      print("$nome - ${idade ?? "idade não informada"}");
  }
}
