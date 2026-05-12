package main

import "fmt"

func main() {
	// Declarando as variáveis
	var n1, n2 float64

	// Scaneando as variáveis n1 e n2
	fmt.Print("Digite o primeiro número: ")
	fmt.Scanln(&n1)

	fmt.Print("Digite o segundo número: ")
	fmt.Scanln(&n2)

	var resultado float64

	if n1 >= n2 {
		// Se n2 for zero e n1 for o maior, a divisão é impossível
		if n2 == 0 {
			fmt.Println("Erro: Divisão por zero não permitida.")
			return
		}
		resultado = n1 / n2
		fmt.Printf("%.2f dividido por %.2f é: %.2f\n", n1, n2, resultado)
	} else {
		// Se n1 for zero e n2 for o maior, a divisão é impossível
		if n1 == 0 {
			fmt.Println("Erro: Divisão por zero não permitida.")
			return
		}
		resultado = n2 / n1
		fmt.Printf("%.2f dividido por %.2f é: %.2f\n", n2, n1, resultado)
	}
}
