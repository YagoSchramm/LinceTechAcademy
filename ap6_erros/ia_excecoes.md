# Exceções em Dart

• Qual a diferença entre um erro e uma exceção em Dart?

Um erro representa um problema mais grave, geralmente relacionado a falhas de programação ou situações que o programa não deveria tentar recuperar, como erro de lógica, acesso inválido ou uso incorreto da linguagem.

Uma exceção representa uma situação inesperada, mas que pode ser tratada pelo programa, como uma entrada inválida do usuário, falha ao abrir um arquivo ou erro ao converter um valor.

• Em quais situações devo esperar encontrar um erro, e em quais devo esperar uma exceção?

Erros costumam aparecer quando existe um problema no código ou no estado interno do programa, por exemplo acessar uma posição inexistente de uma lista ou chamar algo que não deveria ser nulo.

Exceções costumam aparecer em situações externas ou previsíveis, como dados inválidos, falha de conexão, arquivo inexistente ou tentativa de fazer uma operação que pode não dar certo.

• O que fazem os blocos 'try', 'catch' e 'finally' em Dart?

O bloco `try` envolve o código que pode gerar uma exceção.

O bloco `catch` captura a exceção caso ela aconteça, permitindo tratar o problema sem encerrar o programa imediatamente.

O bloco `finally` executa sempre, ocorrendo ou não uma exceção. Ele é usado para finalizar ações importantes, como fechar arquivos, liberar recursos ou executar uma limpeza.

• Como posso capturar diferentes tipos de exceções usando 'catch'?

Em Dart, é possível usar `on` para capturar um tipo específico de exceção e `catch` para acessar o objeto da exceção. Também é possível capturar o erro e a pilha de execução.

Exemplo:

```dart
try {
  int numero = int.parse('abc');
} on FormatException catch (e) {
  print('Formato inválido: $e');
} catch (e) {
  print('Outro erro aconteceu: $e');
}
```

Nesse exemplo, `FormatException` é tratada separadamente, enquanto o `catch` final captura outros problemas que possam acontecer.

(Comentário) Interessante esse uso de on principalmente para validações e erros decorados

• Em quais situações é útil usar o bloco 'finally'?

O `finally` é útil quando alguma ação precisa acontecer independentemente do resultado do `try`, como fechar um arquivo, encerrar uma conexão, limpar variáveis temporárias ou mostrar uma mensagem final.

Ele garante que esse código será executado mesmo se uma exceção for lançada.

• Por que eu precisaria lançar uma exceção em meu código?

Eu posso lançar uma exceção quando quero avisar que uma regra do programa foi quebrada ou que uma situação inválida aconteceu.

Por exemplo, se uma função recebe uma idade negativa, esse valor não faz sentido. Nesse caso, lançar uma exceção ajuda a impedir que o programa continue usando dados incorretos.

• Como posso personalizar mensagens de erro ao lançar exceções?

Posso personalizar mensagens passando um texto ao lançar a exceção. Em Dart, uma forma simples é usar `throw Exception('mensagem')`.

Exemplo:

```dart
void sacar(double valor) {
  if (valor <= 0) {
    throw Exception('O valor do saque deve ser maior que zero.');
  }
}
```

Assim, quando a exceção acontecer, a mensagem explica melhor o motivo do problema.

• Quais são as melhores práticas para lançar exceções em Dart?

As melhores práticas são lançar exceções apenas em situações realmente inválidas, escrever mensagens claras, evitar capturar exceções sem necessidade e tratar a exceção no lugar certo do código.

Também é importante não usar exceções para controlar fluxos normais do programa. Elas devem representar situações especiais ou problemas que precisam de tratamento.

• Qual a diferença entre usar 'assert' e lançar uma exceção para verificar condições?

O `assert` é usado principalmente durante o desenvolvimento para verificar se uma condição esperada é verdadeira. Ele ajuda a encontrar erros de lógica enquanto o programador testa o código.

Lançar uma exceção é usado quando a condição precisa ser verificada durante a execução real do programa, inclusive para o usuário final.

Em resumo, `assert` serve para ajudar o desenvolvedor a encontrar problemas, enquanto exceções servem para lidar com situações inválidas que podem acontecer durante o funcionamento do programa.

• Em quais situações o 'assert' é mais útil durante o desenvolvimento?

O `assert` é útil para testar hipóteses do código, conferir valores internos e garantir que certas condições sejam verdadeiras enquanto o programa está sendo desenvolvido.

Por exemplo, posso usar `assert` para verificar se uma variável não está vazia, se um número está dentro de um intervalo esperado ou se uma função recebeu um valor válido durante os testes.

(Comentário) O assert é muito útil para escrever testes em dart não sabia que isso era possível nessa linguagem 

## Fontes

IA utilizada `Codex` 