# Programacao assincrona em Flutter

## O que e programacao assincrona em Flutter e por que ela e importante?

Programacao assincrona e a forma de executar tarefas que podem demorar sem travar a interface do aplicativo. Em Flutter, isso e muito importante porque operacoes como acessar uma API, ler arquivos, consultar banco de dados ou carregar imagens podem levar alguns milissegundos ou segundos.

Se essas tarefas fossem executadas de forma sincronizada na thread principal, a tela poderia congelar. Com programacao assincrona, o app continua respondendo ao toque do usuario enquanto aguarda o resultado da operacao.

## Quais cuidados devo ter usando programacao assincrona?

E importante tratar erros, evitar chamadas desnecessarias, controlar estados de carregamento e verificar se o widget ainda existe antes de atualizar a interface depois de uma operacao assincrona.

Tambem e recomendado nao colocar logicas muito pesadas diretamente na thread principal, evitar chamadas repetidas em `build()` e organizar bem o codigo para que as operacoes assincronas fiquem claras e faceis de manter.

## O que sao isolates em Flutter?

Isolates sao unidades de execucao independentes em Dart. Eles permitem executar tarefas em paralelo sem compartilhar memoria diretamente com o isolate principal.

Em Flutter, o isolate principal e responsavel pela interface. Quando existe uma tarefa muito pesada, como processar muitos dados, converter arquivos grandes ou fazer calculos complexos, podemos usar outro isolate para evitar travamentos na UI.

(Comentário) Interessante o isolate para carregar partes inteiras da interface.

## Quais cuidados devo ter ao usar isolates em Flutter?

Isolates devem ser usados quando realmente existe uma tarefa pesada, porque criar e comunicar isolates tem custo. Para operacoes simples, normalmente `Future`, `async` e `await` ja sao suficientes.

Outro cuidado e lembrar que isolates nao compartilham objetos diretamente. A comunicacao acontece por mensagens, entao os dados enviados precisam ser simples ou serializaveis. Tambem e importante tratar erros e encerrar isolates quando eles nao forem mais necessarios.

## Qual o conceito do Loop de Eventos em Flutter?

O Loop de Eventos e o mecanismo que organiza a execucao das tarefas em Dart. Ele controla eventos como cliques, timers, respostas de APIs, animacoes e conclusao de `Futures`.

Quando uma tarefa assincrona e iniciada, Dart nao bloqueia o fluxo principal. A operacao fica aguardando sua conclusao e, quando termina, o resultado volta para a fila de eventos para ser processado no momento correto.

(Comentário) Interessante o loop de eventos acontecer sempre da mesma maneira mesmo no assíncrono

## O que e um `Future` em Dart e como ele funciona?

Um `Future` representa um valor que estara disponivel no futuro. Ele pode terminar com sucesso, retornando um valor, ou terminar com erro.

Por exemplo, uma chamada HTTP nao retorna a resposta imediatamente. Ela retorna um `Future`, e quando a resposta chegar, o `Future` sera concluido com os dados ou com um erro.

```dart
Future<String> buscarNome() async {
  return 'Ana';
}
```

## Como posso usar `async` e `await` para trabalhar com `Futures`?

Usamos `async` para indicar que uma funcao trabalha de forma assincrona e pode retornar um `Future`. Usamos `await` para esperar o resultado de uma operacao assincrona antes de continuar a execucao daquela funcao.

```dart
Future<void> carregarDados() async {
  final nome = await buscarNome();
  print(nome);
}
```

O `await` deixa o codigo mais legivel, parecido com codigo sequencial, mas sem travar a interface do aplicativo.

## Como posso lidar com erros em operacoes assincronas usando `try-catch`?

Voce pode colocar a operacao assincrona dentro de um bloco `try` e capturar erros no `catch`. Isso evita que o app quebre sem tratamento e permite exibir mensagens adequadas ao usuario.

```dart
Future<void> carregarUsuario() async {
  try {
    final usuario = await buscarUsuario();
    print(usuario);
  } catch (erro) {
    print('Erro ao carregar usuario: $erro');
  }
}
```

Tambem e comum usar `finally` para finalizar estados de carregamento, independentemente de sucesso ou erro.

## Traga a explicacao dos metodos HTTP.

Metodos HTTP indicam qual acao sera realizada em uma comunicacao com uma API.

- `GET`: busca dados no servidor, como listar usuarios ou produtos.
- `POST`: envia dados para criar um novo recurso, como cadastrar um usuario.
- `PUT`: atualiza um recurso inteiro existente.
- `PATCH`: atualiza apenas parte de um recurso existente.
- `DELETE`: remove um recurso.

Esses metodos ajudam a organizar a comunicacao entre o aplicativo Flutter e o backend.

## Como posso lidar com diferentes codigos de resposta HTTP (200, 404, 500)?

Os codigos HTTP indicam o resultado da requisicao. Em Flutter, voce deve verificar o `statusCode` da resposta antes de usar os dados.

```dart
final response = await http.get(Uri.parse('https://api.exemplo.com/users'));

if (response.statusCode == 200) {
  print('Sucesso: ${response.body}');
} else if (response.statusCode == 404) {
  print('Recurso nao encontrado');
} else if (response.statusCode == 500) {
  print('Erro interno do servidor');
} else {
  print('Erro inesperado: ${response.statusCode}');
}
```

O codigo `200` geralmente indica sucesso, `404` indica que o recurso nao foi encontrado e `500` indica erro no servidor.

## O que e JSON e como ele e usado em Flutter?

JSON significa JavaScript Object Notation. Ele e um formato de texto muito usado para trocar dados entre aplicativos e servidores.

Em Flutter, APIs geralmente retornam dados em JSON. O app recebe esse texto, converte para estruturas Dart como `Map` e `List`, e depois pode transformar esses dados em objetos.

```dart
final dados = jsonDecode(response.body);
```

Para usar `jsonDecode`, e necessario importar:

```dart
import 'dart:convert';
```

## Como posso acessar valores especificos em um objeto JSON?

Depois de converter o JSON para um `Map`, voce pode acessar os valores usando as chaves.

```dart
final json = {
  'nome': 'Carlos',
  'idade': 25,
};

print(json['nome']);
print(json['idade']);
```

Se o JSON veio de uma API, normalmente fazemos:

```dart
final dados = jsonDecode(response.body);
final nome = dados['nome'];
```

## Como posso lidar com arrays (listas) em JSON em Flutter?

Arrays em JSON viram listas em Dart. Eles sao usados quando a API retorna varios itens, como uma lista de usuarios.

```dart
final json = '''
[
  {"nome": "Ana"},
  {"nome": "Bruno"}
]
''';

final lista = jsonDecode(json);
print(lista[0]['nome']);
```

Nesse exemplo, `lista` contem varios objetos JSON.

## Como posso iterar sobre os elementos de um array JSON?

Voce pode usar `for`, `forEach` ou `map` para percorrer os itens de uma lista JSON.

```dart
final lista = jsonDecode(response.body);

for (final item in lista) {
  print(item['nome']);
}
```

Tambem e comum converter cada item em um objeto Dart:

```dart
final usuarios = lista.map((item) => Usuario.fromJson(item)).toList();
```

## Por que e util mapear JSON para classes Dart?

Mapear JSON para classes Dart deixa o codigo mais organizado, seguro e facil de manter. Em vez de acessar chaves soltas como `dados['nome']`, voce trabalha com propriedades como `usuario.nome`.

Isso reduz erros de digitacao, facilita o autocomplete da IDE e melhora a leitura do codigo, principalmente em projetos maiores.

## Como posso usar `factory` para criar objetos Dart a partir de JSON?

Um construtor `factory` pode receber um `Map<String, dynamic>` e retornar um objeto Dart preenchido com os dados do JSON.

```dart
class Usuario {
  final String nome;
  final int idade;

  Usuario({
    required this.nome,
    required this.idade,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nome: json['nome'],
      idade: json['idade'],
    );
  }
}
```

Assim, voce pode criar um objeto com:

```dart
final usuario = Usuario.fromJson(dados);
```

(Comentário) Muito interessante para interpretar dados de uma API

## Como posso usar `toJson()` para converter objetos Dart em JSON?

O metodo `toJson()` faz o caminho inverso do `fromJson`: ele transforma um objeto Dart em um `Map`, que pode ser enviado para uma API ou convertido em texto JSON.

```dart
class Usuario {
  final String nome;
  final int idade;

  Usuario({
    required this.nome,
    required this.idade,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': idade,
    };
  }
}
```

Para converter para uma string JSON:

```dart
final usuario = Usuario(nome: 'Ana', idade: 22);
final jsonString = jsonEncode(usuario.toJson());
```

## Como organizar minhas requisicoes no meu codigo Flutter? Quais as boas praticas realizando requisicoes?

Uma boa pratica e separar as responsabilidades do codigo. A tela deve cuidar da interface, enquanto uma classe de servico ou repository deve cuidar das requisicoes HTTP.

Exemplo de organizacao:

- `models/`: classes Dart que representam os dados.
- `services/`: classes responsaveis por chamar APIs.
- `repositories/`: camada que organiza o acesso aos dados.
- `screens/` ou `pages/`: telas do aplicativo.

Boas praticas importantes:

- Evitar fazer requisicoes diretamente dentro do `build()`.
- Usar `async` e `await` com tratamento de erro.
- Verificar o `statusCode` antes de usar a resposta.
- Criar modelos com `fromJson` e `toJson`.
- Exibir estados de carregamento, sucesso e erro na interface.
- Centralizar URLs, headers e configuracoes comuns.
- Evitar duplicacao de codigo em varias telas.
- Considerar timeout para requisicoes demoradas.

Um exemplo simples de service:

```dart
class UsuarioService {
  Future<Usuario> buscarUsuario() async {
    final response = await http.get(
      Uri.parse('https://api.exemplo.com/usuario/1'),
    );

    if (response.statusCode == 200) {
      final dados = jsonDecode(response.body);
      return Usuario.fromJson(dados);
    }

    throw Exception('Erro ao buscar usuario');
  }
}
```

Com essa organizacao, o codigo fica mais limpo, testavel e facil de evoluir.

(Comentário) Muito interessante utilizar um webService nessa camada de service para receber dados de uma API externa.
