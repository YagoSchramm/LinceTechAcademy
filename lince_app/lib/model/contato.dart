class Contato {
  final String id;
  final String idPessoa;
  final String tipoContato;
  final String contato;

  Contato({
    required this.id,
    required this.idPessoa,
    required this.tipoContato,
    required this.contato,
  });

  factory Contato.fromMap(Map<String, dynamic> map) {
    return Contato(
      id: map['id'].toString(),
      idPessoa: map['id_pessoa'].toString(),
      tipoContato: map['tipo_contato'],
      contato: map['contato'],
    );
  }
}
