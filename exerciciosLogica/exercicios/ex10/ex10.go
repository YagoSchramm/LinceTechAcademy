package main

import "fmt"

func main() {
	// Declarando variaveis
	var quantidade int

	// Scaneando a quantidade de numeros
	fmt.Print("Digite a quantidade de numeros: ")
	fmt.Scanln(&quantidade)

	if quantidade <= 0 {
		fmt.Println("A quantidade precisa ser maior que zero.")
		return
	}

	numeros := make([]int, quantidade)
	soma := 0
	somaPares := 0
	somaImpares := 0

	// Scaneando os numeros
	for i := 0; i < quantidade; i++ {
		fmt.Printf("Digite o %d numero: ", i+1)
		fmt.Scanln(&numeros[i])

		soma += numeros[i]

		if numeros[i]%2 == 0 {
			somaPares += numeros[i]
		} else {
			somaImpares += numeros[i]
		}
	}

	maior := numeros[0]
	menor := numeros[0]

	for i := 1; i < quantidade; i++ {
		if numeros[i] > maior {
			maior = numeros[i]
		}

		if numeros[i] < menor {
			menor = numeros[i]
		}
	}

	// Ordenando os numeros em ordem crescente
	for i := 0; i < quantidade-1; i++ {
		for j := i + 1; j < quantidade; j++ {
			if numeros[i] > numeros[j] {
				auxiliar := numeros[i]
				numeros[i] = numeros[j]
				numeros[j] = auxiliar
			}
		}
	}

	media := float64(soma) / float64(quantidade)

	fmt.Print("a) Numeros em ordem crescente: ")
	for i := 0; i < quantidade; i++ {
		fmt.Printf("%d ", numeros[i])
	}

	fmt.Print("\nb) Numeros em ordem decrescente: ")
	for i := quantidade - 1; i >= 0; i-- {
		fmt.Printf("%d ", numeros[i])
	}

	fmt.Printf("\nc) Maior numero: %d\n", maior)
	fmt.Printf("d) Menor numero: %d\n", menor)
	fmt.Printf("e) Soma dos numeros: %d\n", soma)
	fmt.Printf("f) Media dos numeros: %.2f\n", media)
	fmt.Printf("g) Soma dos numeros pares: %d\n", somaPares)
	fmt.Printf("h) Soma dos numeros impares: %d\n", somaImpares)
}
