package main

import "fmt"

func main() {
	// Criamos um slice para guardar 5 números
	numeros := make([]int, 5)

	fmt.Println("Digite 5 números inteiros:")

	// Loop para receber os 5 números
	for i := 0; i < 5; i++ {
		fmt.Printf("Número %d: ", i+1)
		fmt.Scanln(&numeros[i])
	}

	fmt.Println("\nOs números ímpares digitados foram:")

	// Loop para verificar e imprimir apenas os ímpares
	isImpar := false
	for _, num := range numeros {
		if num%2 != 0 {
			fmt.Printf("%d ", num)
			isImpar = true
		}
	}

	if !isImpar {
		fmt.Print("Nenhum número ímpar foi encontrado.")
	}
}
