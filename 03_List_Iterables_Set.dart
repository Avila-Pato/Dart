void main() {
  final numbers = [1,2,3,4,5,6,7,8,9];
  
  print('List original ${numbers}\n');
  print('List reversed ${numbers.reversed}\n');
  print('List subList ${numbers.sublist(0,2)}\n');
  print('List toSet ${numbers.toSet()}\n');
  print('List toList ${numbers.toList()}\n');
  print('List map ${numbers.map((e) => e * 2)}\n');
  print('Lenght ${numbers.length}\n');
}