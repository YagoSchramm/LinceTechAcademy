package main

import "fmt"

// Função para calcular a raiz quadrada de um número por aproximacao
func raizQuadrada(numero float64) float64 {
	aproximacao := numero

	for i := 0; i < 10; i++ {
		aproximacao = (aproximacao + numero/aproximacao) / 2
	}

	return aproximacao
}

func main() {
	// Declarando variáveis
	var c1, c2 float64
	// Scaneando os catetos
	fmt.Print("Digite o primeiro cateto: ")
	fmt.Scanln(&c1)
	fmt.Print("Digite o segundo cateto: ")
	fmt.Scanln(&c2)

	if c1 == 0 || c2 == 0 {
		fmt.Print("Um dos catetos não pode ser igual a 0")
		return
	}

	somaQuadrados := (c1 * c1) + (c2 * c2)
	hipotenusa := raizQuadrada(somaQuadrados)

	fmt.Printf("A hipotenusa é: %.2f\n", hipotenusa)
}
