void main(List<String> args) {
  List<int> anos = [2016, 2000, 1988, 2100, 2300, 1993];

  for (var ano in anos) {
   if(ehAnoBissexto(ano)){
    print("o ano $ano eh um ano bissexto");
   } 
   else{
    print("o ano $ano não eh um ano bissexto");
   }
  }
}

bool ehAnoBissexto(int ano) {
  if (ano % 100 == 0) {
    return (ano % 400) == 0;
  }
  return (ano % 4) == 0;
}
