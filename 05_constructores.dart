void main() {
  final Map<String, dynamic> rawJson = {
    'name': 'Superman',
    'level': 100,
    'isAlive': false,
  };

  final ironman = Hero.fromJson(rawJson);

  print(ironman);
}

class Hero {
  String name;
  int level;
  bool isAlive;

  // Constructor requerido para crear un objeto
  Hero({required this.name, required this.level, required this.isAlive});

  Hero.fromJson(Map<String, dynamic> json)
    : name = json['name'] ?? 'No name',
      level = json['level'] ?? 'No Power',
      isAlive = json['isAlive'] ?? 'No alive';

  @override
  String toString() {
    return '$name, $level, isAlive: ${isAlive ? 'Yes' : 'No'}';
  }
}
