# Dúvidas sobre Orientação a Objetos em Dart

## Quais são os principais conceitos da orientação a objetos?

Os principais conceitos da orientação a objetos são:

- **Classe**: modelo que define características e comportamentos.
- **Objeto**: uma instância criada a partir de uma classe.
- **Atributos**: dados ou características de um objeto.
- **Métodos**: ações ou comportamentos que um objeto pode executar.
- **Encapsulamento**: proteção dos dados internos de uma classe.
- **Herança**: possibilidade de uma classe reutilizar características de outra.
- **Polimorfismo**: capacidade de diferentes objetos responderem de formas diferentes ao mesmo método.
- **Abstração**: foco apenas no que é essencial, escondendo detalhes internos.

## Quais as vantagens de usar orientação a objetos em comparação com outras formas de programação?

A orientação a objetos ajuda a organizar melhor o código, principalmente em projetos maiores. Ela permite separar responsabilidades, reutilizar código por meio de classes e herança, proteger dados internos com encapsulamento e representar elementos do mundo real de forma mais próxima da realidade.

Em comparação com programação puramente procedural, a orientação a objetos costuma facilitar a manutenção, a expansão e a leitura do sistema, porque cada classe pode representar uma parte específica do programa.

## O que é uma classe e como ela se relaciona com objetos?

Uma **classe** é como um molde ou modelo. Ela define quais atributos e métodos os objetos terão.

Um **objeto** é uma instância dessa classe, ou seja, algo criado a partir do modelo.

Exemplo em Dart:

```dart
class Pessoa {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade);
}

void main() {
  Pessoa pessoa1 = Pessoa('Ana', 20);
  Pessoa pessoa2 = Pessoa('Carlos', 25);
}
```

Nesse exemplo, `Pessoa` é a classe. `pessoa1` e `pessoa2` são objetos criados a partir dessa classe.

## O que são métodos e como eles funcionam dentro de uma classe?

Métodos são funções que pertencem a uma classe. Eles representam comportamentos ou ações que os objetos daquela classe podem executar.

Exemplo:

```dart
class Pessoa {
  String nome;

  Pessoa(this.nome);

  void apresentar() {
    print('Olá, meu nome é $nome');
  }
}
```

O método `apresentar()` pertence à classe `Pessoa` e usa o atributo `nome` do objeto.

## Como posso acessar os métodos de um objeto em Dart?

Para acessar um método de um objeto em Dart, usamos o nome do objeto, seguido de ponto e o nome do método.

Exemplo:

```dart
void main() {
  Pessoa pessoa = Pessoa('Ana');
  pessoa.apresentar();
}
```

Nesse caso, `pessoa.apresentar()` chama o método `apresentar()` do objeto `pessoa`.

## Qual a diferença entre atributos públicos e privados?

Em Dart, um atributo é **público** quando pode ser acessado fora da classe ou arquivo onde foi criado.

Exemplo:

```dart
class Pessoa {
  String nome;
}
```

O atributo `nome` é público.

Um atributo é considerado **privado** quando começa com `_`. Em Dart, a privacidade funciona por arquivo, ou seja, o atributo só pode ser acessado diretamente dentro do mesmo arquivo.

Exemplo:

```dart
class Conta {
  double _saldo = 0;
}
```

O atributo `_saldo` é privado. Isso ajuda a proteger dados internos da classe e evita alterações indevidas.

(Comentário) interessante essa atribuição de vizualização através do _

## Qual a diferença entre um construtor padrão e um construtor nomeado?

O **construtor padrão** é o construtor principal da classe. Normalmente ele tem o mesmo nome da classe e é usado para criar objetos de forma direta.

Exemplo:

```dart
class Pessoa {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade);
}
```

O **construtor nomeado** é um construtor com um nome adicional. Ele é útil quando queremos criar objetos de formas diferentes.

Exemplo:

```dart
class Pessoa {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade);

  Pessoa.crianca(this.nome) : idade = 10;
}
```

Nesse exemplo, `Pessoa.crianca()` é um construtor nomeado.

(Comentário) Esses contrutores nomeados são muito interessantes principalmente quando é necessário atribuir apenas um valor e gerar outro, como por exemplo num user gerando o id dele automaticamente.

## O que são factories em Dart e quando devo usá-las?

Em Dart, uma **factory** é um tipo especial de construtor criado com a palavra-chave `factory`. Ela é usada quando a criação do objeto precisa de alguma lógica antes de retornar uma instância.

Uma factory pode:

- Retornar uma instância já existente.
- Escolher qual objeto retornar.
- Controlar melhor a criação de objetos.
- Criar objetos a partir de dados externos, como mapas ou JSON.

Exemplo:

```dart
class Pessoa {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade);

  factory Pessoa.fromMap(Map<String, dynamic> dados) {
    return Pessoa(dados['nome'], dados['idade']);
  }
}
```

Nesse exemplo, `Pessoa.fromMap()` é uma factory que cria um objeto `Pessoa` a partir de um `Map`.

Factories são úteis quando a criação do objeto não é apenas passar valores diretamente para o construtor.

(Comentário) Essas factories ajudam muito na hora de encodar e decodar de json um objeto que vem de uma api

## Fontes

IA utilizada `Codex`
