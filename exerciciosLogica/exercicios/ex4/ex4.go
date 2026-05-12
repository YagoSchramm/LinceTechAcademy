package main

import "fmt"

func main() {
	// Declarando as variáveis
	var n1, n2 float64
	// Scaneando as variáveis
	fmt.Print("Digite o primeiro número decimal: ")
	fmt.Scanln(&n1)
	fmt.Print("Digite o segundo número decimal: ")
	fmt.Scanln(&n2)
	// Fator para transformar decimal em inteiro
	fator := 100.0
	val1 := int(n1 * fator)
	val2 := int(n2 * fator)

	// Cópias para não perder o valor original
	a := val1
	b := val2

	// Cálculo do MDC (Algoritmo de Euclides)
	for b != 0 {
		a, b = b, a%b
	}
	mdc := a

	// Cálculo do MMC
	var mmc float64
	if val1 == 0 || val2 == 0 {
		mmc = 0
	} else {
		// Calculando o reusltado do mmc
		resultadoInteiro := (val1 * val2) / mdc
		// Dividindo o resultado para ter o retorno correto
		mmc = float64(resultadoInteiro) / fator
	}

	fmt.Printf("O menor múltiplo comum entre %v e %v é: %v\n", n1, n2, mmc)
}
