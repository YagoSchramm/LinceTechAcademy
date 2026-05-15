## O que e um Future em Dart e como ele me ajuda a lidar com tarefas que levam tempo?

Um `Future` em Dart representa um valor que ainda nao esta pronto, mas que sera entregue no futuro. Ele e usado para tarefas que levam tempo, como acessar uma API, ler um arquivo, consultar um banco de dados ou esperar algum processamento terminar.

Com `Future`, o programa nao precisa ficar parado esperando a tarefa acabar. Ele pode continuar executando outras partes do codigo e, quando o resultado estiver disponivel, o `Future` sera concluido com sucesso ou com erro.

Exemplo:

```dart
Future<String> buscarNome() async {
  return 'Ana';
}
```

Nesse exemplo, a funcao nao retorna uma `String` imediatamente. Ela retorna um `Future<String>`, ou seja, uma promessa de que uma `String` sera entregue depois.

## O que significam os termos "assincrono" e "sincrono"?

Codigo sincrono e executado em ordem, uma instrucao depois da outra. Cada linha espera a anterior terminar antes de continuar.

Exemplo sincrono:

```dart
print('Inicio');
print('Meio');
print('Fim');
```

Codigo assincrono permite iniciar uma tarefa demorada e continuar o fluxo do programa sem travar tudo enquanto essa tarefa esta em andamento.

Exemplo assincrono:

```dart
print('Inicio');
Future.delayed(Duration(seconds: 2), () {
  print('Tarefa finalizada');
});
print('Fim');
```

Nesse caso, `Fim` pode aparecer antes de `Tarefa finalizada`, porque a tarefa foi agendada para terminar depois.

## O que acontece se um Future falhar e como posso lidar com esse erro?

Se um `Future` falhar, ele sera concluido com erro em vez de retornar um valor com sucesso. Isso pode acontecer, por exemplo, quando uma requisicao para a internet falha, um arquivo nao e encontrado ou ocorre uma excecao dentro da funcao assincrona.

A forma de lidar com esse erro usando diretamente o `Future` e utilizar o metodo `.catchError()`.

Exemplo:

```dart
Future<void> carregarDados() {
  return buscarDados()
      .then((dados) {
        print(dados);
      })
      .catchError((erro) {
    print('Erro ao carregar dados: $erro');
      });
}
```

Assim, se `buscarDados()` falhar, o erro sera capturado pelo `.catchError()`, evitando que o programa fique sem tratamento para aquela falha.

(Comentário) Muito interessante para receber informações de APIs e tratar caso haja algum erro

## Existe uma forma de executar varias tarefas assincronas em paralelo?

Sim. Em Dart, uma forma comum de executar varias tarefas assincronas em paralelo e usar `Future.wait`.

Ele recebe uma lista de `Future`s e espera todos terminarem.

Exemplo:

```dart
Future<void> carregarTudo() async {
  final resultados = await Future.wait([
    buscarUsuario(),
    buscarProdutos(),
    buscarPedidos(),
  ]);

  print(resultados);
}
```

Nesse exemplo, as tres tarefas comecam sem esperar uma pela outra. O programa aguarda ate que todas terminem e depois continua.

(Comentário) Muito bom para receber as informações de uma API e exibir em uma tela utilizando o Flutter pois carrega muito rápido

## Em quais situacoes devo usar Futures em meu codigo Dart?

Voce deve usar `Future` quando uma operacao pode demorar e nao deve bloquear o restante do programa.

Situacoes comuns:

- Fazer requisicoes HTTP para APIs.
- Ler ou escrever arquivos.
- Consultar banco de dados.
- Aguardar temporizadores com `Future.delayed`.
- Executar operacoes que dependem de resposta externa.
- Carregar dados antes de mostrar uma tela.

Em geral, se o resultado nao esta disponivel imediatamente, um `Future` pode ser uma boa escolha.

## Quais cuidados devo tomar nao usando await em funcoes Future?

Quando voce chama uma funcao que retorna `Future` sem usar `await`, o codigo continua executando imediatamente, sem esperar a tarefa terminar. Isso pode causar problemas se a proxima linha depender do resultado daquela tarefa.

Exemplo problematico:

```dart
salvarDados();
print('Dados salvos');
```

Nesse exemplo, a mensagem pode aparecer antes de os dados serem realmente salvos, porque `salvarDados()` pode ainda estar em execucao.

O ideal, quando a ordem importa, e usar `await`:

```dart
await salvarDados();
print('Dados salvos');
```

Tambem e importante lembrar que erros de um `Future` sem `await` podem ficar sem tratamento adequado. Se voce realmente quiser iniciar uma tarefa sem esperar por ela, ainda deve pensar em como lidar com possiveis erros.

## Como lidar com erros usando Future?

Existem duas formas principais de lidar com erros em `Future`: usando `try/catch` com `await` ou usando `.catchError()`.

Com `try/catch`:

```dart
try {
  final resultado = await buscarDados();
  print(resultado);
} catch (erro) {
  print('Ocorreu um erro: $erro');
}
```

Com `.catchError()`:

```dart
buscarDados()
    .then((resultado) {
      print(resultado);
    })
    .catchError((erro) {
      print('Ocorreu um erro: $erro');
    });
```

Na maioria dos casos, `async`, `await` e `try/catch` deixam o codigo mais facil de ler e manter.

## Fontes

IA utilizada `Codex`