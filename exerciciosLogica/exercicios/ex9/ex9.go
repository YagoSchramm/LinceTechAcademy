package main

import (
	"bufio"
	"fmt"
	"os"
)

func paraMinusculo(caractere rune) rune {
	if caractere >= 'A' && caractere <= 'Z' {
		return caractere + 32
	}

	return caractere
}

func isLetra(caractere rune) bool {
	return (caractere >= 'a' && caractere <= 'z') ||
		caractere == 'á' || caractere == 'à' || caractere == 'â' || caractere == 'ã' ||
		caractere == 'é' || caractere == 'ê' ||
		caractere == 'í' ||
		caractere == 'ó' || caractere == 'ô' || caractere == 'õ' ||
		caractere == 'ú' ||
		caractere == 'ç'
}

func isVogal(caractere rune) bool {
	return caractere == 'a' || caractere == 'á' || caractere == 'à' || caractere == 'â' || caractere == 'ã' ||
		caractere == 'e' || caractere == 'é' || caractere == 'ê' ||
		caractere == 'i' || caractere == 'í' ||
		caractere == 'o' || caractere == 'ó' || caractere == 'ô' || caractere == 'õ' ||
		caractere == 'u' || caractere == 'ú'
}

func main() {
	// Declarando variaveis
	var texto string
	vogais := 0
	consoantes := 0
	letrasTotal := 0
	palavras := 0
	meioDaPalavra := false

	// Scaneando o texto
	fmt.Print("Digite um texto: ")
	leitor := bufio.NewReader(os.Stdin)
	texto, _ = leitor.ReadString('\n')

	for _, caractere := range texto {
		caractereMinusculo := paraMinusculo(caractere)

		if isLetra(caractereMinusculo) {
			letrasTotal++

			if !meioDaPalavra {
				palavras++
				meioDaPalavra = true
			}

			if isVogal(caractereMinusculo) {
				vogais++
			} else {
				consoantes++
			}
		} else {
			meioDaPalavra = false
		}
	}

	fmt.Printf("a) Vogais: %d\n", vogais)
	fmt.Printf("b) Consoantes: %d\n", consoantes)
	fmt.Printf("c) Total de letras: %d\n", letrasTotal)
	fmt.Printf("d) Palavras: %d\n", palavras)
}
