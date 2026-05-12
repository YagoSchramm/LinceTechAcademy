package main

import "fmt"

func main() {
	// Declarando as variáveis
	var num1, num2 float64
	// Scaneando as variáveis
	fmt.Print("Digite o primeiro número: ")
	fmt.Scanln(&num1)

	fmt.Print("Digite o segundo número: ")
	fmt.Scanln(&num2)

	// Realiza a subtração
	resultado := num1 - num2

	// Lógica do Valor Absoluto:
	// Se o resultado for menor que zero, invertemos o sinal.
	valorAbsoluto := resultado
	if resultado < 0 {
		valorAbsoluto = resultado * -1
	}

	fmt.Printf("A subtração de %.2f por %.2f resulta no valor absoluto: %.2f\n", num1, num2, valorAbsoluto)
}
