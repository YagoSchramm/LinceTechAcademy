package main

import "fmt"

func main() {
	// Declarando variavel
	var n int32
	// Scaneando número
	fmt.Print("Digite um número para calcular o fatorial: ")
	fmt.Scan(&n)

	// Converter para inteiro
	num := int(n)

	if n < 0 {
		fmt.Println("Erro: Não existe fatorial de número negativo.")
		return
	}

	resultado := 1
	for i := 1; i <= num; i++ {
		resultado *= i
	}

	fmt.Printf("O fatorial de %d é: %d\n", n, resultado)
}
