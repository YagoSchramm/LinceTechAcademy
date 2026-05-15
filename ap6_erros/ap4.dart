abstract class Arquivo {
  void abrir();
}

class ArquivoTexto implements Arquivo {
  final String nome;

  ArquivoTexto(this.nome){
    try {
      
    } catch (e) {
      throw Exception("Entrada invalida. Digite um nome valido.");
    }
  }

  @override
  void abrir() {
    try {
      throw Exception("Erro ao abrir o arquivo $nome");
    } catch (e) {
      print('Relança a exception');
      rethrow;
    }
  }
}

void main(List<String> args) {
  try {
    final nomeArquivo = 'texto.txt';

    ArquivoTexto arquivoTexto = ArquivoTexto(nomeArquivo);
    arquivoTexto.abrir();
  } catch (e) {
    print(e);
  }finally{
    print("Fim da execução");
  }
}
