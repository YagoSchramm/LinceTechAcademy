class Pessoa {
  final String id;
  final String nome;

  Pessoa({required this.id, required this.nome});

  factory Pessoa.fromMap(Map<String, dynamic> map) {
    return Pessoa(id: map["id"].toString(), nome: map["nome"]);
  }
}
