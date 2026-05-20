# Flutter: Formularios

• O que é um widget TextField em Flutter e para que ele serve?

O `TextField` e um widget usado para permitir que o usuario digite textos em uma interface Flutter. Ele serve para criar campos de entrada, como nome, email, senha, telefone, pesquisa ou qualquer outro dado digitado pelo usuario.

• Como posso obter o valor digitado pelo usuário em um TextField?

Para obter o valor digitado, normalmente usamos um `TextEditingController`. Esse controller fica ligado ao `TextField` e permite acessar o texto por meio da propriedade `text`.

Exemplo:

```dart
final TextEditingController nomeController = TextEditingController();

TextField(
  controller: nomeController,
)

print(nomeController.text);
```

• Qual a diferença entre um TextField e um TextFormField?

O `TextField` e usado para entrada simples de texto. Ja o `TextFormField` e uma versao integrada ao widget `Form`, permitindo validacao, salvamento e organizacao de varios campos em um formulario. Em formularios com validacao, o `TextFormField` costuma ser a melhor escolha.

• Quais parâmetros importantes do TextField?

Alguns parametros importantes do `TextField` sao:

- `controller`: controla e recupera o texto digitado.
- `decoration`: define aparencia do campo, como label, hint, icone e borda.
- `keyboardType`: define o tipo de teclado, como texto, numero, email ou telefone.
- `obscureText`: esconde o texto, muito usado em campos de senha.
- `onChanged`: executa uma funcao sempre que o texto muda.
- `onSubmitted`: executa uma funcao quando o usuario envia o texto.
- `maxLength`: limita a quantidade de caracteres.
- `enabled`: habilita ou desabilita o campo.

(Comentário) Muito interessante o widget TextFormField pois pode até limitar a quantidade de caracteres inserida além da validação.

• O que significa validar um campo de texto em Flutter?

Validar um campo de texto significa verificar se o valor digitado pelo usuario atende a certas regras antes de aceitar ou enviar os dados. Por exemplo, verificar se um campo obrigatorio foi preenchido, se um email tem formato valido ou se uma senha possui tamanho minimo.

• Qual a diferença entre validação síncrona e assíncrona?

A validacao sincrona acontece imediatamente, usando regras locais no proprio aplicativo, como verificar se um campo esta vazio ou se a senha tem pelo menos 8 caracteres.

A validacao assincrona depende de uma operacao que pode demorar, geralmente envolvendo acesso externo, como consultar uma API para verificar se um email ja esta cadastrado.

• O que é um widget CheckBox em Flutter e para que ele serve?

O `Checkbox` e um widget que permite marcar ou desmarcar uma opcao. Ele serve para escolhas booleanas, ou seja, valores de verdadeiro ou falso, como aceitar termos de uso, ativar notificacoes ou selecionar itens de uma lista.

• Como posso alterar a cor e a forma de um CheckBox?

A cor de um `Checkbox` pode ser alterada usando propriedades como `activeColor`, `checkColor` ou `fillColor`. A forma pode ser ajustada com a propriedade `shape`.

Exemplo:

```dart
Checkbox(
  value: aceitouTermos,
  onChanged: (valor) {
    setState(() {
      aceitouTermos = valor!;
    });
  },
  activeColor: Colors.blue,
  checkColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  ),
)
```

• O que é um widget Radio em Flutter e qual sua aplicabilidade?

O `Radio` e um widget usado para selecionar apenas uma opcao dentro de um grupo de opcoes. Ele e aplicado quando o usuario deve escolher uma unica alternativa, como genero, forma de pagamento, nivel de experiencia ou tipo de plano.

• Como posso alterar a cor e a forma de um Rádio?

A cor de um `Radio` pode ser alterada usando propriedades como `activeColor` ou `fillColor`. A forma visual padrao do `Radio` e circular; para alterar mais profundamente sua aparencia, normalmente usamos temas, como `RadioTheme`, ou criamos uma opcao personalizada com outros widgets.

Exemplo:

```dart
Radio<String>(
  value: 'pix',
  groupValue: formaPagamento,
  onChanged: (valor) {
    setState(() {
      formaPagamento = valor!;
    });
  },
  activeColor: Colors.green,
)
```
