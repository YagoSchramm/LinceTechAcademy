// Tempo 8:06 min
void main(List<String> args) {
  final nums= <int>[3, 17, 23, 49, 328, 1358, 21, 429, 12, 103, 20021];
  nums.sort();
  final binarios= paraBinario(nums);
  final octal= paraOctal(nums);
  final hexadecimais= paraHexadecimal(nums);
for (var i = 0; i < nums.length; i++) {
    print("decimal: ${nums[i]}, binário: ${binarios[i]}, octal: ${octal[i]}, hexadecimal: ${hexadecimais[i]}");
}
}
List<String> paraBinario(List<int> nums){
  final listBinario= <String>[];
 for (var numero in nums) {
  final binario=numero.toRadixString(2);
  listBinario.add(binario); 
 }
 return listBinario;
} 
List<String> paraOctal(List<int> nums){
  final listOctal= <String>[];
 for (var numero in nums) {
  final binario=numero.toRadixString(8);
  listOctal.add(binario); 
 }
 return listOctal;
} 
List<String> paraHexadecimal(List<int> nums){
  final listHexadecimal= <String>[];
 for (var numero in nums) {
  final binario=numero.toRadixString(16).toUpperCase();
  listHexadecimal.add(binario); 
 }
 return listHexadecimal;
} 