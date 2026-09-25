

void main() {
// final significa que no se puede reasignar
final String pokemon = 'Ditto';
final int hp =  50;
final bool isAlive = true;

final List<String> abilities = ['impostor'];
final sprites = <String>['ditto/front.png', 'ditto/back.png'];

print(pokemon);
print(hp);
print(isAlive);
print(abilities);
print(sprites);

// print($pokemon - $hp - $isAlive - $abilities - $sprites/);
// Dynamic siempre es un valor nulo = null
// puede ser de cualquier tipo
dynamic errorMessage = "Hola";
errorMessage = true;

print(errorMessage);
}