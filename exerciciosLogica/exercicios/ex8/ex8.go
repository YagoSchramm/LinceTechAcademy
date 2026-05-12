package main

import "fmt"

func main() {
	// Declarando variavel
	var n int32
	// Scaneando variavel
	fmt.Print("Digite um número para calcular a tabuada: ")
	fmt.Scan(&n)

	for i := 1; i <= 9; i++ {
		fmt.Printf("%dX%d=%d\n", n, i, n*int32(i))
	}
}
