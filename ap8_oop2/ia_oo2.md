## O que significa "sobrescrever" um metodo em Dart e por que eu faria isso?

Sobrescrever um metodo significa criar, em uma classe filha, uma nova versao de um metodo que ja existe na classe pai. Em Dart, usamos a anotacao `@override` para deixar claro que aquele metodo esta substituindo um metodo herdado.

Isso e feito quando a classe filha precisa ter um comportamento especifico, diferente ou mais detalhado que o comportamento da classe pai.

Exemplo:

```dart
class Animal {
  void emitirSom() {
    print('Som generico');
  }
}

class Cachorro extends Animal {
  @override
  void emitirSom() {
    print('Au au');
  }
}
```

Nesse exemplo, `Cachorro` sobrescreve o metodo `emitirSom` da classe `Animal`.

## Como posso chamar o metodo original de uma classe pai em um metodo sobrescrito?

Para chamar o metodo original da classe pai dentro de um metodo sobrescrito, usamos a palavra-chave `super`.

Exemplo:

```dart
class Pessoa {
  void apresentar() {
    print('Ola, eu sou uma pessoa.');
  }
}

class Aluno extends Pessoa {
  @override
  void apresentar() {
    super.apresentar();
    print('Eu tambem sou aluno.');
  }
}
```

Nesse caso, `super.apresentar()` chama o metodo `apresentar` da classe `Pessoa`.

## Como posso criar um getter para acessar um atributo privado de uma classe?

Em Dart, um atributo privado comeca com `_`. Para permitir o acesso controlado a esse atributo, podemos criar um getter.

Exemplo:

```dart
class Conta {
  double _saldo = 1000;

  double get saldo {
    return _saldo;
  }
}
```

Tambem e possivel escrever o getter de forma mais curta:

```dart
double get saldo => _saldo;
```

Assim, o atributo continua privado, mas pode ser lido de fora da classe.

## Em quais situacoes e melhor usar getters e setters em vez de acessar atributos diretamente?

Getters e setters sao melhores quando precisamos controlar como um atributo e lido ou alterado.

Eles sao uteis quando queremos:

- proteger dados internos da classe;
- validar valores antes de alterar um atributo;
- impedir alteracoes indevidas;
- calcular um valor antes de retorna-lo;
- manter o codigo mais organizado e seguro.

Exemplo com setter:

```dart
class Produto {
  double _preco = 0;

  double get preco => _preco;

  set preco(double valor) {
    if (valor >= 0) {
      _preco = valor;
    }
  }
}
```

Nesse exemplo, o setter impede que o preco receba um valor negativo.

## O que e uma "classe abstrata" e como ela difere de uma classe normal?

Uma classe abstrata e uma classe que serve como modelo para outras classes. Ela pode ter metodos prontos e tambem metodos sem implementacao, que devem ser implementados pelas classes filhas.

Ela e declarada com a palavra-chave `abstract`.

Exemplo:

```dart
abstract class Forma {
  double calcularArea();
}

class Quadrado extends Forma {
  double lado;

  Quadrado(this.lado);

  @override
  double calcularArea() {
    return lado * lado;
  }
}
```

A principal diferenca e que uma classe abstrata nao pode ser instanciada diretamente. Ou seja, nao podemos fazer:

```dart
Forma forma = Forma(); // erro
```

Uma classe normal, chamada tambem de classe concreta, pode ser instanciada.

## Quando devo usar classes abstratas em vez de classes concretas?

Devemos usar classes abstratas quando queremos criar uma base comum para outras classes, mas essa base sozinha nao faz sentido como objeto completo.

Use classes abstratas quando:

- varias classes compartilham uma mesma estrutura;
- voce quer obrigar classes filhas a implementar certos metodos;
- existe um conceito geral, mas os detalhes dependem das subclasses;
- voce quer representar um contrato com algum comportamento comum.

Exemplo: `Forma` pode ser abstrata, porque uma forma generica nao tem area definida. Ja `Circulo`, `Quadrado` e `Retangulo` podem ser classes concretas.

## O que e "heranca" em Dart e como ela funciona?

Heranca e um recurso da orientacao a objetos que permite que uma classe reutilize atributos e metodos de outra classe.

Em Dart, usamos `extends` para indicar que uma classe herda de outra.

Exemplo:

```dart
class Animal {
  void dormir() {
    print('Dormindo...');
  }
}

class Gato extends Animal {
  void miar() {
    print('Miau');
  }
}
```

Nesse exemplo, `Gato` herda o metodo `dormir` da classe `Animal` e tambem possui seu proprio metodo `miar`.

## Qual a diferenca entre heranca e composicao?

Heranca acontece quando uma classe e uma especializacao de outra. Ela representa uma relacao do tipo "e um".

Exemplo: um `Cachorro` e um `Animal`.

Composicao acontece quando uma classe possui outra classe como parte dela. Ela representa uma relacao do tipo "tem um".

Exemplo: um `Carro` tem um `Motor`.

Exemplo de composicao:

```dart
class Motor {
  void ligar() {
    print('Motor ligado');
  }
}

class Carro {
  Motor motor = Motor();

  void ligarCarro() {
    motor.ligar();
  }
}
```

Use heranca quando uma classe realmente for uma versao mais especifica de outra. Use composicao quando uma classe apenas usa ou possui outra.

(Comentário) Interessante utilizar composição para criar interfaces como de repository e usecases

## O que e uma "interface" em Dart e como ela define um contrato de comportamento?

Em Dart, toda classe pode ser usada como uma interface. Uma interface define um contrato, ou seja, um conjunto de atributos e metodos que outra classe deve implementar.

Quando uma classe implementa uma interface, ela promete fornecer todos os metodos e atributos definidos nela.

Exemplo:

```dart
class Imprimivel {
  void imprimir() {}
}

class Relatorio implements Imprimivel {
  @override
  void imprimir() {
    print('Imprimindo relatorio...');
  }
}
```

Nesse exemplo, `Relatorio` implementa o contrato definido por `Imprimivel`.

## Como uma classe pode implementar uma interface?

Uma classe implementa uma interface usando a palavra-chave `implements`.

Exemplo:

```dart
class Pagamento {
  void pagar(double valor) {}
}

class PagamentoCartao implements Pagamento {
  @override
  void pagar(double valor) {
    print('Pagamento de R$ $valor realizado no cartao.');
  }
}
```

Ao usar `implements`, a classe precisa implementar todos os membros da interface.

## Qual a diferenca entre heranca e implementacao de interfaces?

Na heranca, a classe filha herda codigo pronto da classe pai. Ela pode usar os metodos da classe pai e sobrescrever apenas o que for necessario.

Na implementacao de interfaces, a classe nao herda a implementacao. Ela apenas assume o compromisso de criar os metodos e atributos definidos pela interface.

Exemplo simples:

- `extends` reaproveita comportamento.
- `implements` exige que a classe crie o comportamento.

Use `extends` quando uma classe for uma especializacao de outra. Use `implements` quando voce quiser garantir que diferentes classes sigam o mesmo contrato.

## Quais cenarios devo usar metodos estaticos em vez de metodos de instancia?

Metodos estaticos pertencem a classe, nao a um objeto especifico. Eles devem ser usados quando a acao nao depende dos dados de uma instancia.

Use metodos estaticos quando:

- o metodo realiza um calculo geral;
- o metodo serve como utilitario;
- nao e necessario acessar atributos de um objeto;
- o comportamento pertence a classe como um todo.

Exemplo:

```dart
class Calculadora {
  static int somar(int a, int b) {
    return a + b;
  }
}
```

Nesse caso, nao precisamos criar uma calculadora para somar dois numeros.

## Como posso acessar um metodo estatico sem criar uma instancia da classe?

Para acessar um metodo estatico, usamos o nome da classe seguido do nome do metodo.

Exemplo:

```dart
class Conversor {
  static double metrosParaCentimetros(double metros) {
    return metros * 100;
  }
}

void main() {
  double resultado = Conversor.metrosParaCentimetros(2);
  print(resultado);
}
```

Aqui, o metodo `metrosParaCentimetros` foi chamado diretamente pela classe `Conversor`, sem criar um objeto.

## O que sao "enumeradores" em Dart e para que servem?

Enumeradores, ou `enum`, sao tipos especiais usados para representar um conjunto fixo de valores.

Eles ajudam a deixar o codigo mais claro, seguro e organizado.

Exemplo:

```dart
enum StatusPedido {
  pendente,
  pago,
  enviado,
  entregue
}
```

Com isso, uma variavel do tipo `StatusPedido` so pode receber um dos valores definidos no enum.

Exemplo de uso:

```dart
StatusPedido status = StatusPedido.pago;
```

## Em quais situacoes e melhor usar enumeradores em vez de constantes?

E melhor usar enumeradores quando os valores representam opcoes fixas e relacionadas entre si.

Use `enum` quando:

- existe uma lista limitada de opcoes;
- os valores pertencem ao mesmo conceito;
- voce quer evitar erros de digitacao;
- voce quer deixar o codigo mais legivel;
- voce quer que o compilador ajude a verificar os valores permitidos.

Exemplo:

```dart
enum NivelAcesso {
  visitante,
  usuario,
  administrador
}
```

Nesse caso, `enum` e melhor que constantes separadas, porque deixa claro que todos os valores fazem parte do mesmo grupo.
