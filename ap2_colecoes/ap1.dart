import 'dart:math';

void main(List<String> args) {
  final random=Random();
  final List<int> nums= List.filled(10, 0);
  for (var i = 0; i < nums.length; i++) {
    nums[i]=random.nextInt(100);
  }
  for (var i = 0; i < nums.length; i++) {
    print("Posição: $i, valor: ${nums[i]}");
  }
}