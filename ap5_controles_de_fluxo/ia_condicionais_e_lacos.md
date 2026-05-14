# Condicionais e Laços

## Qual a diferença entre usar `if`, `else if` e `else`?

O `if` é usado para testar uma condição inicial. Se essa condição for verdadeira, o bloco de código dentro dele será executado.

O `else if` é usado quando queremos testar outra condição caso o `if` anterior seja falso.

O `else` é usado como uma alternativa final, executada quando nenhuma das condições anteriores foi verdadeira.

Exemplo:

```javascript
let nota = 7;

if (nota >= 9) {
  console.log("Excelente");
} else if (nota >= 6) {
  console.log("Aprovado");
} else {
  console.log("Reprovado");
}
```

## Quais cuidados tenho que ter com `if` e `else`?

É importante tomar cuidado com a ordem das condições, pois o programa executa a primeira condição verdadeira e ignora as próximas.

Também é importante usar corretamente os operadores de comparação, como `==`, `===`, `!=`, `!==`, `>`, `<`, `>=` e `<=`.

Outro cuidado é usar chaves `{}` para deixar claro qual bloco pertence ao `if` ou ao `else`, evitando confusão no código.

Exemplo:

```javascript
let idade = 18;

if (idade >= 18) {
  console.log("Maior de idade");
} else {
  console.log("Menor de idade");
}
```

## Qual a importância da palavra-chave `break` em um `switch case`?

O `break` serve para encerrar a execução de um `case` dentro do `switch`.

Sem o `break`, o JavaScript continua executando os próximos `case`, mesmo que eles não correspondam ao valor testado. Isso pode gerar resultados errados.

Exemplo:

```javascript
let dia = 2;

switch (dia) {
  case 1:
    console.log("Domingo");
    break;
  case 2:
    console.log("Segunda-feira");
    break;
  default:
    console.log("Dia inválido");
}
```

## Quando devo usar `switch` em vez de uma série de `if else`?

O `switch` é mais adequado quando queremos comparar uma mesma variável com vários valores fixos.

Ele deixa o código mais organizado quando existem muitas possibilidades simples, como menus, opções, dias da semana ou categorias.

Exemplo:

```javascript
let opcao = 1;

switch (opcao) {
  case 1:
    console.log("Cadastrar");
    break;
  case 2:
    console.log("Editar");
    break;
  case 3:
    console.log("Excluir");
    break;
  default:
    console.log("Opção inválida");
}
```

Se as condições forem mais complexas, com comparações diferentes, intervalos ou várias regras, geralmente o `if else` é mais indicado.

## Qual a diferença entre um loop `for` tradicional e um loop `for...in`?

O `for` tradicional é usado quando queremos repetir um bloco de código controlando início, condição e incremento.

Ele é muito usado quando sabemos quantas vezes queremos repetir algo ou quando queremos percorrer posições de um array.

Exemplo:

```javascript
for (let i = 0; i < 5; i++) {
  console.log(i);
}
```

O `for...in` é usado para percorrer as propriedades de um objeto.

Exemplo:

```javascript
let pessoa = {
  nome: "Ana",
  idade: 20
};

for (let chave in pessoa) {
  console.log(chave + ": " + pessoa[chave]);
}
```

Em arrays, normalmente é melhor usar `for`, `for...of` ou métodos como `forEach`, porque o `for...in` percorre índices e propriedades, não diretamente os valores.

(Comentário) Achei muito interessante essa descrição do for in principalmente por que eu estava utilizando como um percorredor de listas

## Como posso repetir um bloco de código um número específico de vezes?

Para repetir um bloco de código um número específico de vezes, podemos usar o loop `for`.

Exemplo:

```javascript
for (let i = 1; i <= 5; i++) {
  console.log("Repetição número " + i);
}
```

Nesse exemplo, o bloco será executado 5 vezes.

## Quais são os riscos de usar um loop `while` sem uma condição de parada adequada?

O principal risco é criar um loop infinito, ou seja, um loop que nunca termina.

Isso pode travar o programa, consumir muita memória ou deixar o navegador sem responder.

Exemplo de problema:

```javascript
let contador = 1;

while (contador <= 5) {
  console.log(contador);
  // Faltou aumentar o contador
}
```

Nesse caso, como o valor de `contador` nunca muda, a condição continua verdadeira para sempre.

O correto seria:

```javascript
let contador = 1;

while (contador <= 5) {
  console.log(contador);
  contador++;
}
```

## Quando é adequado usar `for` e usar `while`?

O `for` é mais adequado quando sabemos a quantidade de repetições ou quando temos um contador bem definido.

Exemplo:

```javascript
for (let i = 0; i < 10; i++) {
  console.log(i);
}
```

O `while` é mais adequado quando não sabemos exatamente quantas vezes o código será repetido, mas sabemos que ele deve continuar enquanto uma condição for verdadeira.

Exemplo:

```javascript
let senha = "";

while (senha !== "1234") {
  senha = prompt("Digite a senha:");
}
```

## Qual a diferença entre os comandos `break` e `continue`?

O `break` interrompe completamente o loop ou o `switch`.

O `continue` não encerra o loop inteiro. Ele apenas pula a repetição atual e passa para a próxima.

Exemplo com `break`:

```javascript
for (let i = 1; i <= 5; i++) {
  if (i === 3) {
    break;
  }

  console.log(i);
}
```

Esse código imprime `1` e `2`, depois para o loop.

Exemplo com `continue`:

```javascript
for (let i = 1; i <= 5; i++) {
  if (i === 3) {
    continue;
  }

  console.log(i);
}
```

Esse código imprime `1`, `2`, `4` e `5`, pulando apenas o número `3`.

## Como posso usar `break` para sair de um loop aninhado?

Quando temos um loop dentro de outro, um `break` comum sai apenas do loop mais interno.

Exemplo:

```javascript
for (let i = 1; i <= 3; i++) {
  for (let j = 1; j <= 3; j++) {
    if (j === 2) {
      break;
    }

    console.log("i:", i, "j:", j);
  }
}
```

Para sair de todos os loops de uma vez, podemos usar um rótulo.

Exemplo:

```javascript
externo:
for (let i = 1; i <= 3; i++) {
  for (let j = 1; j <= 3; j++) {
    if (i === 2 && j === 2) {
      break externo;
    }

    console.log("i:", i, "j:", j);
  }
}
```

Nesse caso, `break externo` encerra também o loop de fora.

## Em quais situações é útil usar o comando `continue` em um loop?

O `continue` é útil quando queremos ignorar alguns casos dentro do loop, mas continuar executando as próximas repetições.

Ele pode ser usado, por exemplo, para pular números indesejados, ignorar valores inválidos ou evitar executar uma parte do código quando uma condição específica acontece.

Exemplo:

```javascript
for (let i = 1; i <= 10; i++) {
  if (i % 2 !== 0) {
    continue;
  }

  console.log(i);
}
```

Nesse exemplo, o código pula os números ímpares e mostra apenas os números pares.
