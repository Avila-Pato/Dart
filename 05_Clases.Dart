void main() {
  // Instancia (Objeto)
  final hero = Hero('Superman', 100);
  final hero2 = Hero('Batman', 50);

  print(hero);
  print(hero.name);
  print(hero.level);
}

// Plantilla
class Hero {
  String name = '';
  int level = 0;

  // Constructor
  Hero(this.name, this.level);

  //@override // sobreescribir el metodo
  String toString() => 'Hero(name: $name, level: $level)';


}