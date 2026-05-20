# Widgets em Flutter

## Explique o conceito de um widget Row em Flutter.

O `Row` e um widget de layout usado para organizar outros widgets horizontalmente, ou seja, um ao lado do outro. Ele e muito usado quando queremos criar linhas com textos, icones, botoes ou outros elementos alinhados na mesma direcao.

Exemplo:

```dart
Row(
  children: [
    Icon(Icons.home),
    Text('Inicio'),
  ],
)
```

## Como posso adicionar espacamento uniforme entre os widgets em um Row?

Voce pode usar a propriedade `mainAxisAlignment` com valores como `MainAxisAlignment.spaceBetween`, `MainAxisAlignment.spaceAround` ou `MainAxisAlignment.spaceEvenly`.

Exemplo:

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Text('A'),
    Text('B'),
    Text('C'),
  ],
)
```

Tambem e possivel usar widgets como `SizedBox(width: 16)` entre os elementos para definir um espaco fixo.

## Qual a diferenca entre MainAxisAlignment e CrossAxisAlignment em um Row?

Em um `Row`, o eixo principal e horizontal. Por isso, `MainAxisAlignment` controla o alinhamento dos widgets na horizontal.

Ja o eixo cruzado e vertical. Entao, `CrossAxisAlignment` controla como os widgets ficam alinhados verticalmente dentro da linha.

Exemplo:

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Item 1'),
    Text('Item 2'),
  ],
)
```

## Explique o conceito de um widget Column em Flutter.

O `Column` e um widget de layout usado para organizar outros widgets verticalmente, ou seja, um embaixo do outro. Ele e muito utilizado para montar telas, formularios, menus e blocos de conteudo.

Exemplo:

```dart
Column(
  children: [
    Text('Titulo'),
    Text('Descricao'),
    ElevatedButton(
      onPressed: () {},
      child: Text('Enviar'),
    ),
  ],
)
```

## Qual a diferenca entre MainAxisAlignment e CrossAxisAlignment em um Column?

Em um `Column`, o eixo principal e vertical. Por isso, `MainAxisAlignment` controla o alinhamento dos widgets de cima para baixo.

Ja o eixo cruzado e horizontal. Entao, `CrossAxisAlignment` controla como os widgets ficam alinhados lateralmente dentro da coluna.

Exemplo:

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Nome'),
    Text('Email'),
  ],
)
```

## Explique o conceito de um widget Stack em Flutter.

O `Stack` e um widget que permite colocar widgets uns sobre os outros, como camadas. O primeiro widget da lista fica mais ao fundo, e os proximos ficam por cima.

Exemplo:

```dart
Stack(
  children: [
    Image.asset('assets/fundo.png'),
    Text('Texto sobre a imagem'),
  ],
)
```

## Quais as vantagens de usar Stack em vez de Row ou Column?

O `Stack` e vantajoso quando voce precisa sobrepor elementos, como colocar texto em cima de uma imagem, criar badges, posicionar botoes flutuantes ou montar layouts com camadas.

Ja `Row` e `Column` sao melhores quando os widgets precisam ficar organizados em linha ou coluna, sem sobreposicao.

## Como posso posicionar widgets especificos dentro de um Stack?

Voce pode usar o widget `Positioned` dentro de um `Stack`. Com ele, e possivel definir a distancia do widget em relacao ao topo, esquerda, direita ou parte inferior.

Exemplo:

```dart
Stack(
  children: [
    Container(color: Colors.blue),
    Positioned(
      top: 20,
      right: 20,
      child: Icon(Icons.star),
    ),
  ],
)
```

## Como posso exibir uma imagem de um arquivo local em Flutter?

Para exibir uma imagem local, primeiro adicione a imagem na pasta do projeto, por exemplo em `assets/imagens/foto.png`. Depois, registre essa pasta no arquivo `pubspec.yaml`.

Exemplo no `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/imagens/foto.png
```

Depois, use `Image.asset` no codigo:

```dart
Image.asset('assets/imagens/foto.png')
```

## Quais propriedades posso usar para controlar a aparencia do texto (fonte, tamanho, cor)?

Voce pode usar a propriedade `style` do widget `Text`, passando um `TextStyle`. Com ele, e possivel configurar tamanho, cor, peso da fonte, estilo, fonte e outros detalhes.

Exemplo:

```dart
Text(
  'Ola, Flutter!',
  style: TextStyle(
    fontSize: 24,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
  ),
)
```

## Como posso exibir um texto em varias linhas?

O `Text` pode quebrar linha automaticamente quando nao ha espaco suficiente. Tambem e possivel usar `\n` para forcar uma nova linha.

Exemplo:

```dart
Text('Primeira linha\nSegunda linha')
```

Voce tambem pode controlar o numero maximo de linhas com `maxLines` e o comportamento do excesso de texto com `overflow`.

Exemplo:

```dart
Text(
  'Este e um texto grande que pode ocupar varias linhas.',
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)
```

## Como posso criar uma lista de rolagem vertical em Flutter?

Voce pode usar o widget `ListView`, que cria uma lista rolavel. Por padrao, o `ListView` rola na vertical.

Exemplo:

```dart
ListView(
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```

## Como posso adicionar itens dinamicamente a um ListView?

Voce pode armazenar os itens em uma lista e usar `ListView.builder` para construir os widgets conforme a quantidade de itens.

Exemplo:

```dart
final List<String> nomes = ['Ana', 'Bruno', 'Carla'];

ListView.builder(
  itemCount: nomes.length,
  itemBuilder: (context, index) {
    return Text(nomes[index]);
  },
)
```

Se a lista mudar durante a execucao, use `setState` para atualizar a tela.

## Quais as diferencas entre ListView.builder e ListView.separated?

O `ListView.builder` cria os itens da lista sob demanda, conforme eles aparecem na tela. Ele e indicado para listas grandes ou dinamicas.

O `ListView.separated` tambem cria os itens sob demanda, mas permite definir um separador entre eles, como uma linha, espaco ou outro widget.

Exemplo:

```dart
ListView.separated(
  itemCount: 3,
  itemBuilder: (context, index) {
    return Text('Item $index');
  },
  separatorBuilder: (context, index) {
    return Divider();
  },
)
```

## Como posso usar ListTile para criar itens de lista em um ListView?

O `ListTile` e um widget pronto para criar itens de lista com titulo, subtitulo, icone inicial e icone final. Ele combina muito bem com `ListView`.

Exemplo:

```dart
ListView(
  children: [
    ListTile(
      leading: Icon(Icons.person),
      title: Text('Maria'),
      subtitle: Text('Desenvolvedora Flutter'),
      trailing: Icon(Icons.arrow_forward),
    ),
  ],
)
```

## Como posso tornar os itens ListTile interativos (clicaveis)?

Voce pode usar a propriedade `onTap` do `ListTile`. Ela executa uma acao quando o usuario toca no item.

Exemplo:

```dart
ListTile(
  title: Text('Abrir perfil'),
  onTap: () {
    print('Item clicado');
  },
)
```

Tambem existe `onLongPress`, usado para executar uma acao quando o usuario pressiona o item por mais tempo.

(Comentário) interessante utilizar o onLongPress em listTiles para mudar o foco entre outras funcionalidades de um app.


## Quais as vantagens de usar ListTile em vez de widgets de texto simples?

O `ListTile` ja oferece uma estrutura pronta e organizada para itens de lista. Ele facilita o uso de titulo, subtitulo, icones, espacamento padrao e interacoes como toque.

Com widgets de texto simples, seria necessario montar manualmente todo o layout usando `Row`, `Column`, `Padding`, `Icon` e outros widgets.
