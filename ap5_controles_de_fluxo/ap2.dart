import 'dart:math';

void main(List<String> args) {
  final random = Random();
  List<int> nums= List.generate(5, (index) => random.nextInt(26),);
  for (var i = 0; i < nums.length; i++) {
   final letra= encontraLetra(nums[i]);
   print("Numero ${nums[i]} -> Letra $letra");
  }
}
String encontraLetra(int n){
  if(n<1 || n>26){
    return "";
  }
  // Eh 64 + n pois o código de "A" é 65
  return String.fromCharCode(64+n);
}