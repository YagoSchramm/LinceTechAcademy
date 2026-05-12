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
	// Declarando as variaveis
	var a, b, c float64

	// Scaneando os coeficientes da equacao
	fmt.Print("Digite o valor de A: ")
	fmt.Scanln(&a)

	fmt.Print("Digite o valor de B: ")
	fmt.Scanln(&b)

	fmt.Print("Digite o valor de C: ")
	fmt.Scanln(&c)

	if a == 0 {
		fmt.Println("Erro: o valor de A nao pode ser zero em uma equacao do segundo grau.")
		return
	}

	// Calculando o delta
	delta := b*b - 4*a*c

	if delta < 0 {
		fmt.Println("A equacao nao possui raizes reais.")
		return
	}

	// Calculando os valores de X pela formula de Bhaskara
	raizDelta := raizQuadrada(delta)
	x1 := (-b + raizDelta) / (2 * a)
	x2 := (-b - raizDelta) / (2 * a)

	fmt.Printf("O valor de X1 e: %.2f\n", x1)
	fmt.Printf("O valor de X2 e: %.2f\n", x2)
}
