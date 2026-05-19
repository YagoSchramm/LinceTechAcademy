# Introducao ao Flutter

## Explique o MaterialApp e seus parametros?

O `MaterialApp` e o widget principal usado para configurar uma aplicacao Flutter baseada no Material Design. Ele prepara recursos importantes como tema visual, navegacao, rotas, idioma, titulo da aplicacao e configuracoes gerais da interface.

Na pratica, ele costuma envolver a tela inicial do app e fornece a estrutura necessaria para que widgets como `Scaffold`, `AppBar`, `FloatingActionButton`, `SnackBar` e outros componentes Material funcionem corretamente.

## Quais parametros sao importantes no MaterialApp?

Alguns parametros importantes do `MaterialApp` sao:

- `home`: define a tela inicial da aplicacao.
- `title`: define o titulo do aplicativo, usado pelo sistema operacional.
- `theme`: configura o tema visual principal, como cores, fontes e estilos.
- `darkTheme`: configura um tema escuro para o app.
- `themeMode`: define se o app usara tema claro, escuro ou o tema do sistema.
- `routes`: registra rotas nomeadas para navegacao entre telas.
- `initialRoute`: define qual rota sera aberta primeiro.
- `onGenerateRoute`: permite gerar rotas dinamicamente.
- `debugShowCheckedModeBanner`: controla a exibicao da faixa "debug" no canto da tela.
- `locale` e `supportedLocales`: configuram idioma e internacionalizacao.

## Como funcionam os "import's" no Flutter?

Os `imports` no Flutter servem para trazer classes, funcoes, widgets e bibliotecas que serao usados em um arquivo Dart. Sem o `import`, o arquivo nao conhece os recursos definidos em outras bibliotecas.

Exemplo:

```dart
import 'package:flutter/material.dart';
```

Esse import traz os principais widgets do Material Design, como `MaterialApp`, `Scaffold`, `Text`, `AppBar`, `ElevatedButton`, entre outros.

Tambem e possivel importar arquivos do proprio projeto:

```dart
import 'screens/home_page.dart';
```

E pacotes externos instalados no `pubspec.yaml`:

```dart
import 'package:http/http.dart' as http;
```

## Explique o que e o Material Design e como ele e utilizado no Flutter.

Material Design e um sistema de design criado pelo Google para padronizar interfaces digitais. Ele define regras e recomendacoes sobre cores, tipografia, espacamento, movimento, hierarquia visual, botoes, formularios, barras de navegacao e outros elementos da interface.

No Flutter, o Material Design e utilizado por meio da biblioteca `material.dart`. Essa biblioteca oferece widgets prontos que seguem esse padrao visual, facilitando a criacao de aplicativos com aparencia moderna, consistente e familiar para os usuarios.

## Quais sao os principais widgets do Material Design disponiveis no Flutter?

Alguns dos principais widgets Material disponiveis no Flutter sao:

- `MaterialApp`: configura a aplicacao Material.
- `Scaffold`: cria a estrutura basica de uma tela.
- `AppBar`: cria a barra superior da tela.
- `Text`: exibe textos.
- `Icon`: exibe icones.
- `ElevatedButton`: cria botoes com destaque.
- `TextButton`: cria botoes de texto.
- `OutlinedButton`: cria botoes com borda.
- `FloatingActionButton`: cria um botao flutuante de acao.
- `Card`: cria cartoes de conteudo.
- `ListTile`: cria itens de lista.
- `Drawer`: cria menu lateral.
- `BottomNavigationBar`: cria navegacao inferior.
- `TextField`: cria campos de entrada de texto.
- `Checkbox`, `Switch` e `Radio`: criam controles de selecao.
- `SnackBar`: exibe mensagens temporarias.
- `Dialog` e `AlertDialog`: exibem janelas de dialogo.

## O que sao widgets Stateless e quando devemos utiliza-los?

Widgets `Stateless` sao widgets que nao possuem estado interno mutavel. Isso significa que eles recebem dados, constroem a interface e nao mudam sozinhos durante a execucao.

Devemos utiliza-los quando a tela ou componente nao precisa alterar sua aparencia com base em interacoes internas. Eles sao ideais para textos, icones, layouts fixos, componentes visuais simples e partes da interface que dependem apenas de dados recebidos por parametro.

## Explique o ciclo de vida de um widget Stateless.

O ciclo de vida de um widget `Stateless` e simples. Primeiro, o widget e criado por meio do construtor. Depois, o metodo `build()` e executado para construir a interface.

Sempre que o Flutter precisar redesenhar aquele widget, por exemplo porque o widget pai mudou, o metodo `build()` pode ser chamado novamente. Como ele nao possui estado interno, nao existem metodos como `initState()` ou `dispose()` dentro de um `StatelessWidget`.

## Quais sao as limitacoes dos widgets Stateless?

As principais limitacoes dos widgets `Stateless` sao:

- Nao armazenam estado interno que muda com o tempo.
- Nao usam `setState()`.
- Nao possuem metodos de ciclo de vida como `initState()` e `dispose()`.
- Nao sao adequados para componentes que precisam reagir diretamente a interacoes e atualizar a propria interface.
- Dependem de dados externos, geralmente passados pelo widget pai.

Mesmo assim, eles sao muito importantes porque deixam o codigo mais simples, previsivel e facil de manter.

## O que sao widgets Stateful e quando devemos utiliza-los?

Widgets `Stateful` sao widgets que possuem estado interno mutavel. Eles podem alterar sua interface durante a execucao conforme o usuario interage com o app ou conforme dados mudam.

Devemos utiliza-los quando um componente precisa guardar informacoes que podem mudar, como contador, texto digitado, item selecionado, carregamento de dados, exibicao condicional, controle de formularios ou resposta a eventos do usuario.

## Explique o ciclo de vida de um widget Stateful.

O ciclo de vida de um widget `Stateful` possui mais etapas do que o de um `Stateless`. As principais sao:

- `createState()`: cria o objeto de estado associado ao widget.
- `initState()`: executado uma vez quando o estado e inicializado.
- `build()`: constroi a interface do widget.
- `setState()`: solicita uma nova construcao da interface quando o estado muda.
- `didUpdateWidget()`: chamado quando o widget recebe novas configuracoes do widget pai.
- `deactivate()`: chamado quando o widget e removido temporariamente da arvore.
- `dispose()`: chamado quando o estado sera destruido definitivamente.

Esse ciclo permite controlar inicializacao, atualizacao e liberacao de recursos.

## Como o gerenciamento de estado e feito em widgets Stateful?

Em widgets `Stateful`, o estado e armazenado na classe `State`, separada da classe principal do widget. Essa classe guarda variaveis que podem mudar durante a execucao.

Quando uma dessas variaveis precisa mudar e essa mudanca deve aparecer na tela, usamos `setState()`. O Flutter entao executa novamente o metodo `build()` daquele widget, atualizando a interface com os novos valores.

Exemplo:

```dart
int contador = 0;

void incrementar() {
  setState(() {
    contador++;
  });
}
```

## Como funciona o "setState" em Flutter?

O `setState()` e um metodo usado em widgets `Stateful` para avisar ao Flutter que o estado mudou e que a interface precisa ser reconstruida.

Dentro do `setState()`, alteramos os valores das variaveis de estado. Depois disso, o Flutter agenda uma nova execucao do metodo `build()`, atualizando a tela.

Exemplo:

```dart
setState(() {
  nome = 'Novo nome';
});
```

O `setState()` nao recria o aplicativo inteiro. Ele marca aquele widget como precisando de atualizacao, e o Flutter otimiza o processo de reconstrucao da interface.

## Quais cuidados tomar no gerenciamento de estado?

Alguns cuidados importantes sao:

- Usar `setState()` apenas quando a mudanca precisa refletir na interface.
- Evitar colocar operacoes demoradas dentro do `setState()`.
- Manter o estado no menor escopo possivel.
- Separar responsabilidades para evitar widgets muito grandes.
- Chamar `dispose()` para liberar recursos como controllers, streams e listeners.
- Evitar atualizar estado depois que o widget foi destruido.
- Usar solucoes de gerenciamento de estado mais robustas quando a aplicacao crescer, como `Provider`, `Riverpod`, `Bloc` ou `ValueNotifier`.

(Comentário) Interessante esses tipos de gerenciamento de estado

## Quais as principais diferencas entre widgets Stateless e Stateful?

A principal diferenca e que widgets `Stateless` nao possuem estado interno mutavel, enquanto widgets `Stateful` possuem.

Widgets `Stateless` sao mais simples e usados quando a interface depende apenas dos dados recebidos. Ja widgets `Stateful` sao usados quando a interface precisa mudar durante a execucao.

Resumo das diferencas:

- `StatelessWidget`: nao muda sozinho, nao usa `setState()` e tem ciclo de vida simples.
- `StatefulWidget`: possui uma classe `State`, pode mudar dados internos e atualiza a tela com `setState()`.
- `StatelessWidget`: ideal para componentes estaticos ou controlados pelo pai.
- `StatefulWidget`: ideal para componentes interativos e dinamicos.
