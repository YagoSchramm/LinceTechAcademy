# IA Colecoes

## Quais as boas praticas no uso de listas em Dart?

- Use tipos genericos, como `List<String>`, `List<int>` ou `List<Produto>`.
- Prefira `final` quando a variavel nao precisa apontar para outra lista.
- Use `const` para listas fixas conhecidas em tempo de compilacao.
- Escolha nomes claros, no plural, como `alunos`, `notas` ou `produtos`.
- Use metodos como `map`, `where`, `any` e `every` quando eles deixarem o codigo mais legivel.
- Evite misturar tipos diferentes na mesma lista sem necessidade.

Exemplo:

```dart
final List<String> nomes = ['Ana', 'Bruno', 'Carla'];

final nomesComA = nomes.where((nome) => nome.startsWith('A')).toList();

print(nomesComA);
```

## Que praticas posso adotar para trazer uma melhor performance ao usar listas em Dart?

- Evite percorrer a mesma lista varias vezes sem necessidade.
- Use `Set` quando a tarefa principal for verificar se um item existe.
- Use `Map` quando precisar buscar valores por uma chave.
- Evite remover itens do inicio de listas grandes, pois isso desloca os demais elementos.
- Use `where`, `map` e `toList` com consciencia, pois podem criar novas colecoes.
- Quando souber que a colecao nao sera alterada, use listas imutaveis ou `const`.
- Se precisar apenas iterar pelos dados, trabalhe com `Iterable` quando fizer sentido.

Exemplo:

```dart
final numeros = [1, 2, 3, 4, 5, 6];

final pares = numeros.where((numero) => numero.isEven);

for (final numero in pares) {
  print(numero);
}
```

## O que nao e recomendado fazer quando usado listas em Dart?

- Nao acesse indices sem verificar se eles existem.
- Nao altere uma lista enquanto percorre ela com `for-in`.
- Nao use `List<dynamic>` sem necessidade.
- Nao use lista para simular busca por chave se um `Map` resolver melhor.
- Nao deixe regras importantes dependentes de posicoes magicas, como `lista[3]`.
- Nao crie listas novas repetidamente dentro de loops sem necessidade.

Exemplo ruim:

```dart
final nomes = ['Ana', 'Bruno'];

print(nomes[5]); // Erro: indice inexistente.
```

Melhor:

```dart
final nomes = ['Ana', 'Bruno'];

if (nomes.length > 5) {
  print(nomes[5]);
}
```

(Comentario) O exemplo de for in é interessante pois já utilizei e agora irei mudar a abordagem

## Como entender quando usar listas e quando usar mapas?

Use `List` quando:

- A ordem dos itens importa.
- Voce precisa acessar elementos por indice.
- Pode existir repeticao de valores.
- Voce quer representar uma sequencia de elementos.

Use `Map` quando:

- Voce precisa associar uma chave a um valor.
- Voce precisa buscar informacoes por identificador.
- Cada chave deve ser unica.
- O acesso direto por chave deixa o codigo mais claro.

Exemplo:

```dart
final alunos = ['Ana', 'Bruno', 'Carla'];

final alunoPorMatricula = {
  'A001': 'Ana',
  'A002': 'Bruno',
  'A003': 'Carla',
};

print(alunos[0]);
print(alunoPorMatricula['A002']);
```

## Em Dart quais praticas sao interessantes no uso de mapas?

- Declare os tipos da chave e do valor, como `Map<String, int>`.
- Use chaves estaveis, unicas e faceis de comparar.
- Use `containsKey` quando `null` tambem puder ser um valor valido.
- Use `putIfAbsent` para criar um valor somente se a chave ainda nao existir.
- Use `entries` quando precisar acessar chave e valor no mesmo loop.
- Evite mapas gigantes para representar objetos com estrutura fixa; nesses casos, prefira classes.

(Comentário) Não sabia que uma chave de map poderia ser nulo e essa parte de entries.

Exemplo:

```dart
final Map<String, double> notas = {
  'Ana': 9.5,
  'Bruno': 8.0,
};

notas.putIfAbsent('Carla', () => 7.5);

for (final entrada in notas.entries) {
  print('${entrada.key}: ${entrada.value}');
}
```

## Quais metodos podem me auxiliar no uso de listas e sets em Dart?

Metodos uteis para `List`:

- `add`: adiciona um item.
- `addAll`: adiciona varios itens.
- `remove`: remove um item pelo valor.
- `removeAt`: remove um item pelo indice.
- `contains`: verifica se um item existe.
- `where`: filtra elementos.
- `map`: transforma elementos.
- `any`: verifica se pelo menos um elemento atende a uma condicao.
- `every`: verifica se todos os elementos atendem a uma condicao.
- `firstWhere`: encontra o primeiro elemento que atende a uma condicao.
- `sort`: ordena a lista.
- `toList`: converte um `Iterable` para `List`.
- `toSet`: converte um `Iterable` para `Set`, removendo duplicados.

Metodos uteis para `Set`:

- `add`: adiciona um item.
- `addAll`: adiciona varios itens.
- `contains`: verifica se um item existe.
- `remove`: remove um item.
- `intersection`: retorna itens em comum entre sets.
- `union`: une dois sets.
- `difference`: retorna itens que existem em um set e nao no outro.

Exemplo:

```dart
final numeros = [1, 2, 2, 3, 4, 4];

final semRepetidos = numeros.toSet();

print(semRepetidos);
```

## Quais cuidados devo levar ao usar sets?

- `Set` nao permite valores duplicados.
- Nao dependa de indices, pois `Set` nao trabalha com acesso por posicao como `List`.
- Tenha cuidado com objetos personalizados: igualdade e `hashCode` afetam duplicidade.
- Use `Set` quando unicidade e verificacao de existencia forem mais importantes que posicao.
- Se a ordem for importante, confirme se a implementacao usada preserva a ordem esperada.

Exemplo:

```dart
final linguagens = {'Dart', 'Java', 'Dart', 'Python'};

print(linguagens); // Dart aparece apenas uma vez.
```

## Documentacao do metodo `elementAtOrNull`

O metodo `elementAtOrNull` retorna o elemento que esta na posicao informada ou `null` quando essa posicao nao existe.

(Comentário) Muito interessante para buscas de informações principalmente em listas grandes

Assinatura:

```dart
T? elementAtOrNull(int index)
```

Regras principais:

- O indice comeca em zero.
- O indice deve ser nao negativo.
- Se a colecao tiver um elemento naquela posicao, ele sera retornado.
- Se a colecao nao tiver aquela posicao, o retorno sera `null`.
- Diferente de `elementAt`, esse metodo evita erro quando o indice esta fora da colecao.

Exemplo:

```dart
import 'dart:collection';

void main() {
  final nomes = ['Ana', 'Bruno', 'Carla'];

  print(nomes.elementAtOrNull(1)); // Bruno
  print(nomes.elementAtOrNull(10)); // null
}
```

## Documentacao oficial e Fontes:

https://api.dart.dev/dart-collection/IterableExtensions/elementAtOrNull.html
IA utilizada `Codex`
