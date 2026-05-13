void main(List<String> args) {
  final estados = {
    'SC': ['Gaspar', 'Blumenau', 'Florianopolis'],
    'PR': ['Curitiba', 'Cascavel', 'Foz do Iguacu'],
    'SP': ['Sao Paulo', 'Guarulhos', 'Campinas'],
    'MG': ['Belo Horizonte', 'Juiz de Fora', 'Berlinda'],
  };
  print("Estados: ${estados.keys.join(" ; ")}");

  final cidadesSC = estados["SC"]!;
  // Organizando cidades de SC em ordem alfabética
  cidadesSC.sort();

  print('Cidades de SC: ${cidadesSC.join(' ; ')}');

  final cidadesComEstado = [];
  for (var sigla in estados.keys) {
    final cidadesDoEstado = estados[sigla]!;

    for (var cidade in cidadesDoEstado) {
      cidadesComEstado.add('$cidade - $sigla');
    }
  }
  // Ordenar em ordem alfabética
  cidadesComEstado.sort();
  print("Cidades:");
   for (var cidade in cidadesComEstado) {
    print(cidade);
  }
}
