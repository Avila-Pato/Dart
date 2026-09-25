void Main() {
  print(greetEveryone());
  print(addTwoNumbers(1, 2));
}

String greetEveryone() => 'hello everyone';

int addTwoNumbers(int a, int b) => a + b;

String greetPerson({required String name, String message = 'Hi'}) {
  return '$message $name';
}