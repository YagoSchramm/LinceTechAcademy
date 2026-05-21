# Gerenciamento de estado em Flutter

## O que e gerenciamento de estados em Flutter e por que e importante?

Gerenciamento de estados e a forma de controlar, armazenar e atualizar os dados que mudam dentro de um aplicativo Flutter.

O estado pode ser algo simples, como o valor de um contador, ou algo mais complexo, como o usuario logado, uma lista carregada da API, o tema do aplicativo ou os itens de um carrinho de compras.

Ele e importante porque a interface do Flutter depende do estado. Quando um dado muda, a tela precisa ser atualizada para mostrar a nova informacao corretamente.

## Qual a diferenca entre estado local e estado global em um aplicativo Flutter?

Estado local e aquele usado apenas por um widget ou por uma pequena parte da tela. Um exemplo seria controlar se um botao esta ativo, se um campo de senha esta visivel ou o indice selecionado de uma aba.

Estado global e aquele que precisa ser acessado por varias partes do aplicativo. Exemplos comuns sao dados do usuario logado, tema claro ou escuro, idioma do app e informacoes de carrinho.

Em geral, usamos `setState()` para estados simples e locais. Para estados compartilhados ou mais complexos, e comum usar um gerenciador de estados como o Provider.

(Comentário) Interessante para melhorar a UX pois não demanda muito tempo para carregar telas e widget com informações do usuário

## Quais as vantagens de usar um gerenciador de estados em um projeto Flutter?

Um gerenciador de estados ajuda a organizar melhor o codigo, separando a logica da interface. Isso evita que as telas fiquem muito grandes e dificeis de manter.

Tambem facilita compartilhar dados entre widgets diferentes, atualizar a interface automaticamente quando o estado muda e reduzir repeticao de codigo.

Em projetos maiores, usar um gerenciador de estados deixa o aplicativo mais escalavel, testavel e facil de entender.

## O que e o pacote Provider em Flutter e para que ele serve?

Provider e um pacote muito usado em Flutter para gerenciar e compartilhar estados entre widgets.

Ele permite fornecer um objeto para a arvore de widgets e acessar esse objeto em telas ou componentes filhos sem precisar passar dados manualmente por construtores.

Por exemplo, uma classe que guarda o estado de um contador pode ser fornecida no topo da tela e acessada por widgets internos sempre que necessario.

## Como o Provider ajuda a evitar a reconstrucao desnecessaria de widgets?

O Provider permite que apenas os widgets que dependem de determinado estado sejam reconstruidos quando esse estado muda.

Em vez de chamar `setState()` em uma tela inteira, podemos usar recursos como `Consumer`, `Selector` ou `context.select()` para escutar apenas uma parte especifica do estado.

Assim, o Flutter atualiza somente os widgets necessarios, melhorando a organizacao e podendo melhorar a performance da interface.

## Como o Provider simplifica o gerenciamento de estados em Flutter?

O Provider simplifica porque centraliza o estado em classes separadas da interface. A tela nao precisa guardar toda a regra de negocio dentro dela.

Com ele, voce cria uma classe para controlar os dados, fornece essa classe para a arvore de widgets e acessa o estado onde precisar.

Isso deixa o codigo mais limpo, porque cada parte tem uma responsabilidade: a classe de estado controla os dados, e os widgets apenas exibem e interagem com esses dados.

## O que e o ChangeNotifierProvider e como ele funciona?

`ChangeNotifierProvider` e um widget do pacote Provider usado para fornecer uma classe que estende `ChangeNotifier`.

O `ChangeNotifier` possui o metodo `notifyListeners()`, que avisa aos widgets interessados que o estado mudou.

Quando `notifyListeners()` e chamado, os widgets que estao escutando aquele provider podem ser reconstruidos com os novos dados.

```dart
class ContadorProvider extends ChangeNotifier {
  int contador = 0;

  void incrementar() {
    contador++;
    notifyListeners();
  }
}
```

## Como posso fornecer um ChangeNotifier para a arvore de widgets usando ChangeNotifierProvider?

Voce pode envolver uma tela ou o aplicativo inteiro com `ChangeNotifierProvider`.

```dart
ChangeNotifierProvider(
  create: (context) => ContadorProvider(),
  child: MinhaTela(),
)
```

Quando o estado precisa estar disponivel em todo o aplicativo, e comum colocar o provider acima do `MaterialApp`.

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContadorProvider(),
      child: const MyApp(),
    ),
  );
}
```

## Como posso atualizar o estado do meu aplicativo usando providers?

Para atualizar o estado, voce cria metodos dentro da classe provider e chama esses metodos a partir dos widgets.

```dart
ElevatedButton(
  onPressed: () {
    context.read<ContadorProvider>().incrementar();
  },
  child: const Text('Incrementar'),
)
```

O `context.read()` acessa o provider sem ficar escutando mudancas. Ele e muito usado em acoes, como clique de botao.

Dentro do metodo `incrementar()`, o provider altera o valor e chama `notifyListeners()` para atualizar os widgets que dependem desse estado.

## O que e o Consumer e como ele funciona?

`Consumer` e um widget do Provider usado para acessar um estado e reconstruir a interface quando esse estado muda.

Ele recebe um `builder`, que entrega o `context`, o objeto provider e um possivel `child`.

```dart
Consumer<ContadorProvider>(
  builder: (context, provider, child) {
    return Text('Contador: ${provider.contador}');
  },
)
```

Sempre que `notifyListeners()` for chamado no `ContadorProvider`, esse `Consumer` podera reconstruir o trecho de interface que depende do contador.

## Como o Consumer ajuda a reconstruir apenas os widgets que dependem do estado?

O `Consumer` limita a reconstrucao ao trecho que esta dentro do seu `builder`.

Isso significa que voce pode colocar o `Consumer` apenas ao redor do widget que realmente precisa do estado, em vez de reconstruir a tela inteira.

Por exemplo, se apenas um `Text` mostra o contador, apenas esse `Text` precisa estar dentro do `Consumer`.

## Como posso usar o Consumer para acessar o estado fornecido pelo ChangeNotifierProvider?

Primeiro, voce fornece o estado com `ChangeNotifierProvider`. Depois, em algum widget filho, usa `Consumer` para acessar esse estado.

```dart
Consumer<ContadorProvider>(
  builder: (context, contadorProvider, child) {
    return Column(
      children: [
        Text('Valor: ${contadorProvider.contador}'),
        ElevatedButton(
          onPressed: contadorProvider.incrementar,
          child: const Text('Somar'),
        ),
      ],
    );
  },
)
```

Nesse exemplo, o `Consumer` acessa o `ContadorProvider` e usa tanto o valor `contador` quanto o metodo `incrementar()`.

## Qual a diferenca entre usar Consumer e Provider.of() para acessar o estado?

`Consumer` e um widget que deixa claro qual parte da interface depende do estado. Ele ajuda a isolar a reconstrucao em um trecho especifico.

`Provider.of<T>(context)` tambem acessa o provider, mas pode fazer o widget inteiro onde ele foi chamado escutar as mudancas, dependendo do parametro `listen`.

```dart
final contador = Provider.of<ContadorProvider>(context);
```

Para acessar sem escutar mudancas, pode-se usar:

```dart
final contador = Provider.of<ContadorProvider>(context, listen: false);
```

Na pratica, `Consumer` costuma ser melhor quando voce quer controlar exatamente qual parte da interface sera reconstruida.

## Como posso otimizar o uso do Consumer para evitar reconstrucoes desnecessarias?

Uma boa pratica e colocar o `Consumer` o mais perto possivel do widget que realmente precisa do estado.

Tambem e possivel usar o parametro `child` do `Consumer` para manter uma parte fixa da interface sem reconstrui-la.

```dart
Consumer<ContadorProvider>(
  child: const Text('Valor atual'),
  builder: (context, provider, child) {
    return Column(
      children: [
        child!,
        Text('${provider.contador}'),
      ],
    );
  },
)
```

Outra opcao e usar `Selector` ou `context.select()` quando o widget precisa escutar apenas um campo especifico do provider.

Assim, o app evita reconstrucoes desnecessarias e mantem a interface mais eficiente.

(Comentário) Muito interessante o Selector quando só uma informação será atualizada é melhor utilizá-lo do que o provider que faz o flutter reconstruir a interface inteira.
