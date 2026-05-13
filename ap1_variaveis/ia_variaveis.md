# Duvidas sobre variaveis em Dart

## Quais as boas praticas em Dart declarando variaveis?

Algumas boas praticas importantes:

- Use nomes claros e descritivos, como `idade`, `nomeCompleto`, `quantidadeAlunos` e `precoFinal`.
- Use `var` para variaveis locais quando o valor inicial deixa o tipo obvio.
- Use o tipo explicito quando isso melhorar a leitura ou quando a variavel nao tiver valor inicial imediato.
- Prefira `final` quando a variavel nao precisar mudar depois de receber um valor.
- Prefira `const` quando o valor for conhecido em tempo de compilacao.
- Evite `dynamic`, a menos que voce realmente precise aceitar qualquer tipo.
- Inicialize variaveis nao nulas antes de usa-las.
- Use `String?`, `int?`, `double?` etc. apenas quando o valor realmente puder ser `null`.

Exemplo:

```dart
final String nome = 'Ana';
var idade = 20; // Dart infere int
const double pi = 3.14159;
String? apelido; // Pode ser null
```

## O que evitar na hora de declarar variaveis em Dart?

Evite:

- Nomes genericos demais, como `x`, `valor`, `coisa`, `dado`, quando o significado nao estiver claro.
- Declarar tudo como `dynamic`, porque voce perde seguranca de tipo.
- Usar `var` sem valor inicial, pois nesse caso o Dart pode inferir `dynamic`.
- Criar variaveis mutaveis sem necessidade.
- Usar `late` apenas para "calar" o erro do compilador.
- Declarar variaveis nullable (`String?`, `int?`) quando o valor nunca deveria ser nulo.
- Reaproveitar a mesma variavel para significados diferentes.

Exemplo ruim:

```dart
dynamic x = 'Joao';
x = 10;
```

Exemplo melhor:

```dart
final String nome = 'Joao';
final int idade = 10;
```

## Quais cuidados tomar quando crio variaveis com valor nulo trabalhando com Dart?

No Dart moderno, os tipos sao nao nulos por padrao. Isso significa que uma variavel `String` nao aceita `null`, mas uma variavel `String?` aceita.

Cuidados principais:

- Use `?` somente quando `null` fizer sentido no problema.
- Antes de acessar metodos ou propriedades, verifique se a variavel nao esta nula.
- Use o operador `??` para definir um valor padrao.
- (Comentário): Não sabia desse atalho de ?. isso é muito útil no caso de validações de variáveis como as de idade
- Use `?.` para acessar algo apenas se o valor nao for nulo.
- Evite usar `!` sem certeza absoluta, porque ele pode gerar erro em tempo de execucao.

Exemplo:

```dart
String? nome;

print(nome?.toUpperCase()); // Seguro, retorna null se nome for null
print(nome ?? 'Sem nome');  // Usa valor padrao
```

Exemplo perigoso:

```dart
String? nome;
print(nome!.toUpperCase()); // Erro em tempo de execucao se nome for null
```

## No Dart, quando usar variaveis nulas e quando usar o modificador `late`?

Use variaveis nulas quando a ausencia de valor faz parte da regra do programa.

Exemplo:

```dart
String? telefone;
```

Nesse caso, `telefone` pode ser nulo porque talvez a pessoa nao tenha informado telefone.

Use `late` quando a variavel deve ter valor antes de ser usada, mas nao pode ser inicializada no momento da declaracao.

Exemplo:

```dart
late String nomeUsuario;

void carregarUsuario() {
  nomeUsuario = 'Maria';
}
```

Resumo:

- `String? nome`: pode ser `null`.
- `late String nome`: nao deveria ser `null`, mas sera inicializada depois.

Se uma variavel `late` for acessada antes de receber valor, o Dart gera erro em tempo de execucao.

## Quais os beneficios de utilizar o modificador `late` no Dart?

O `late` tem beneficios especificos:

- Permite declarar uma variavel nao nula que sera inicializada depois.
- Evita transformar uma variavel em nullable apenas por causa do momento da inicializacao.
- Pode adiar uma inicializacao cara ate o primeiro uso.
- Pode ser usado com `final`, permitindo atribuir o valor uma unica vez depois.
- Em atributos de instancia, permite inicializacao que depende de `this`.

Exemplo com `late final`:

```dart
class Pedido {
  late final String codigo;

  void gerarCodigo() {
    codigo = 'PED-001';
  }
}
```

Nesse exemplo, `codigo` recebe valor depois, mas depois de definido nao pode ser alterado.

## Quais as diferencas entre `final` e `const` em Dart?

`final` significa que a variavel so pode receber valor uma vez. O valor pode ser calculado em tempo de execucao.

```dart
final DateTime agora = DateTime.now();
```

`const` significa constante de tempo de compilacao. O valor precisa ser conhecido antes do programa rodar.

```dart
const double pi = 3.14159;
const int quantidadeMaxima = 100;
```

Principais diferencas:

- `final`: definido uma vez, em tempo de execucao ou compilacao.
- `const`: definido em tempo de compilacao.
- `const` e implicitamente `final`.
- Variaveis de instancia podem ser `final`, mas nao podem ser `const`; em classes, use `static const`.

Exemplo:

```dart
class Configuracao {
  final String usuario;
  static const int limiteTentativas = 3;

  Configuracao(this.usuario);
}
```

## Por que usar variaveis `final` e `const` ao inves de usar somente valores padrao?

Usar `final` e `const` deixa o codigo mais seguro e mais claro.

Beneficios:

- Impede alteracoes acidentais.
- Comunica a intencao: aquele valor nao deve mudar.
- Facilita a manutencao do codigo.
- Ajuda o analisador do Dart a encontrar erros.
- `const` pode melhorar desempenho, porque cria valores constantes reutilizaveis.
- Reduz bugs causados por reatribuicao indevida.

Exemplo:

```dart
const taxaDesconto = 0.10;
final precoFinal = precoOriginal - (precoOriginal * taxaDesconto);
```

Aqui, `taxaDesconto` e uma regra fixa. Ja `precoFinal` depende de um calculo feito durante a execucao.

## Quais metodos possuem as variaveis `String` no Dart?

Strings em Dart sao imutaveis. Isso significa que seus metodos nao alteram a string original; eles retornam novos valores.

Metodos comuns de `String`:

| Metodo | Para que serve |
| --- | --- |
| `codeUnitAt(index)` | Retorna o codigo UTF-16 na posicao informada. |
| `compareTo(other)` | Compara duas strings. |
| `contains(pattern)` | Verifica se contem um texto ou padrao. |
| `endsWith(other)` | Verifica se termina com determinado texto. |
| `indexOf(pattern)` | Retorna a primeira posicao de um texto ou padrao. |
| `lastIndexOf(pattern)` | Retorna a ultima posicao de um texto ou padrao. |
| `padLeft(width)` | Preenche a esquerda ate atingir certo tamanho. |
| `padRight(width)` | Preenche a direita ate atingir certo tamanho. |
| `replaceAll(from, replace)` | Substitui todas as ocorrencias. |
| `replaceFirst(from, to)` | Substitui a primeira ocorrencia. |
| `replaceRange(start, end, replacement)` | Substitui um intervalo da string. |
| `split(pattern)` | Divide a string em uma lista. |
| `splitMapJoin(pattern)` | Divide, transforma e junta partes da string. |
| `startsWith(pattern)` | Verifica se comeca com determinado texto ou padrao. |
| `substring(start, end)` | Retorna parte da string. |
| `toLowerCase()` | Converte para minusculas. |
| `toUpperCase()` | Converte para maiusculas. |
| `trim()` | Remove espacos do inicio e do fim. |
| `trimLeft()` | Remove espacos do inicio. |
| `trimRight()` | Remove espacos do fim. |
| `toString()` | Retorna a propria representacao em texto. |

(Comentário) Achei muito interessante a função startsWith ela é boa para sistemas de busca
Propriedades muito usadas:

| Propriedade | Para que serve |
| --- | --- |
| `length` | Tamanho da string. |
| `isEmpty` | Verifica se esta vazia. |
| `isNotEmpty` | Verifica se nao esta vazia. |
| `codeUnits` | Lista de codigos UTF-16. |
| `runes` | Representacao dos pontos de codigo Unicode. |

Exemplo:

```dart
final nome = '  Dart Lang  ';

print(nome.trim()); // 'Dart Lang'
print(nome.contains('Dart')); // true
print(nome.toUpperCase()); // '  DART LANG  '
print(nome.trim().split(' ')); // ['Dart', 'Lang']
```

## Documentacao dos metodos de variaveis inteiras (`int`)

No Dart, `int` representa numeros inteiros. Ele herda varios comportamentos de `num`.

Metodos de instancia:

| Metodo | Retorno | Para que serve |
| --- | --- | --- |
| `abs()` | `int` | Retorna o valor absoluto. |
| `ceil()` | `int` | Retorna o proprio inteiro. |
| `ceilToDouble()` | `double` | Converte para `double`. |
| `clamp(lowerLimit, upperLimit)` | `num` | Limita o numero dentro de um intervalo. |
| `compareTo(other)` | `int` | Compara com outro numero. |
| `floor()` | `int` | Retorna o proprio inteiro. |
| `floorToDouble()` | `double` | Converte para `double`. |
| `gcd(other)` | `int` | Retorna o maior divisor comum. |
| `modInverse(modulus)` | `int` | Retorna o inverso multiplicativo modular. |
| `modPow(exponent, modulus)` | `int` | Calcula potencia modular. |
| `remainder(other)` | `num` | Retorna o resto da divisao truncada. |
| `round()` | `int` | Retorna o proprio inteiro. |
| `roundToDouble()` | `double` | Converte para `double`. |
| `toDouble()` | `double` | Converte o inteiro para `double`. |
| `toInt()` | `int` | Retorna o valor como inteiro. |
| `toRadixString(radix)` | `String` | Converte para string em uma base numerica. |
| `toSigned(width)` | `int` | Interpreta os bits como inteiro com sinal. |
| `toString()` | `String` | Converte para texto. |
| `toStringAsExponential(fractionDigits)` | `String` | Converte para notacao exponencial. |
| `toStringAsFixed(fractionDigits)` | `String` | Converte para texto com casas decimais fixas. |
| `toStringAsPrecision(precision)` | `String` | Converte para texto com determinada precisao. |
| `toUnsigned(width)` | `int` | Interpreta os bits como inteiro sem sinal. |
| `truncate()` | `int` | Retorna o proprio inteiro. |
| `truncateToDouble()` | `double` | Converte para `double`. |

Metodos estaticos:

| Metodo | Retorno | Para que serve |
| --- | --- | --- |
| `int.parse(source, {radix})` | `int` | Converte uma string em inteiro; gera erro se nao conseguir. |
| `int.tryParse(source, {radix})` | `int?` | Tenta converter uma string em inteiro; retorna `null` se nao conseguir. |

Propriedades uteis de `int`:

| Propriedade | Para que serve |
| --- | --- |
| `bitLength` | Quantidade minima de bits necessaria para armazenar o inteiro. |
| `isEven` | Verifica se e par. |
| `isOdd` | Verifica se e impar. |
| `isNegative` | Verifica se e negativo. |
| `sign` | Retorna o sinal do numero. |
| `hashCode` | Retorna o codigo hash. |
| `runtimeType` | Retorna o tipo em tempo de execucao. |

Operadores importantes de `int`:

| Operador | Para que serve |
| --- | --- |
| `+` | Soma. |
| `-` | Subtracao. |
| `*` | Multiplicacao. |
| `/` | Divisao, retorna `double`. |
| `~/` | Divisao inteira. |
| `%` | Modulo euclidiano. |
| `&` | E bit a bit. |
| `\` | Ou bit a bit. |
| `^` | Ou exclusivo bit a bit. |
| `~` | Negacao bit a bit. |
| `<<` | Deslocamento de bits para a esquerda. |
| `>>` | Deslocamento de bits para a direita. |
| `>>>` | Deslocamento sem sinal para a direita. |

(Comentário) Descobri apenas agora esses operadores bit a bit e de sinal isso é muito interessante para arredondamentos e abreviações

Exemplos:

```dart
final numero = 42;

print(numero.isEven); // true
print(numero.abs()); // 42
print(numero.toDouble()); // 42.0
print(numero.toRadixString(2)); // '101010'
print(10.gcd(15)); // 5

final idade = int.tryParse('20');
print(idade); // 20
```

Observacao importante: ao compilar Dart para JavaScript, inteiros podem ter comportamento diferente em alguns casos, principalmente em valores muito grandes e operacoes bit a bit.

## Fontes oficiais

- Variaveis em Dart: https://dart.dev/language/variables
- Null safety em Dart: https://dart.dev/null-safety
- Entendendo null safety e `late`: https://dart.dev/null-safety/understanding-null-safety
- Classe `String`: https://api.dart.dev/dart-core/String-class.html
- Classe `int`: https://api.dart.dev/dart-core/int-class.html
- IA utilizada `Codex`
