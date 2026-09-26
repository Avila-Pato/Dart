void main() {
  final delfin = Delfin();
  final murcielago = Murcielago();
  final pato = Pato();

  // Delfin
  delfin.nadar();

  // Murcielago
  murcielago.volar();
  murcielago.caminar();

  // Pato
  pato.volar();
  pato.caminar();
  pato.nadar();

  print(delfin.runtimeType); // Delfin

  // Un mixin también funciona como tipo: cualquier clase que use
  // `with Nadador` se puede pasar aquí, sea Ave o Mamifero.
  hacerNadar(delfin);
  hacerNadar(pato);
}

void hacerNadar(Nadador animal) => animal.nadar();

// Clases abstractas: la jerarquía "ES UN" (qué tipo de animal es).
abstract class Animal {}

abstract class Mamifero extends Animal {}
abstract class Ave extends Animal {}
abstract class Pez extends Animal {}

// ============================================================
// MIXINS (with)
// ============================================================
// Qué son:
//   Bloques de código (métodos y propiedades) que se "pegan" a una
//   clase para darle habilidades extra, sin usar herencia.
//
// Cómo se usa:
//   mixin Nombre { ... }                       -> se declara
//   class Clase extends Padre with A, B { }    -> se usa con `with`
//   - Se pueden usar VARIOS mixins a la vez (with A, B, C).
//   - La clase recibe el código del mixin ya hecho, NO hay que
//     reimplementarlo (a diferencia de implements).
//   - Un mixin NO se puede instanciar ni tiene constructor.
//   - El orden importa: si dos mixins tienen el mismo método,
//     gana el último de la lista.
//
// Cuándo usarlo:
//   - Cuando varias clases que NO están en la misma rama de herencia
//     necesitan el mismo comportamiento.
//     Ej: el Pato (Ave) y el Delfin (Mamifero) nadan, pero no tiene
//     sentido que Ave y Mamifero hereden de una clase "Nadador".
//   - Relación "PUEDE HACER" (el pato PUEDE volar), en vez de "ES UN".
//
// ============================================================
// RESUMEN: extends vs implements vs with
// ============================================================
//   extends    -> "ES UN". Hereda código. Solo 1 clase.   (el más usado)
//   implements -> "CUMPLE CON". No hereda código, reescribes todo. Varias.
//   with       -> "PUEDE HACER". Hereda código ya hecho. Varios mixins.
//
// Recomendación:
//   - Usa extends para el tipo principal (Pato extends Ave).
//   - Usa with para sumar habilidades reutilizables (with Volador, Nadador).
//   - Se combinan así: class X extends Padre with MixinA implements Contrato
//   - En Flutter los verás mucho, ej: `with SingleTickerProviderStateMixin`.

mixin Volador {
  void volar() => print('Estoy volando');
}

mixin Caminante {
  void caminar() => print('Estoy caminando');
}

mixin Nadador {
  void nadar() => print('Estoy nadando');
}

// extends: qué animal es  |  with: qué habilidades tiene
class Delfin extends Mamifero with Nadador {}
class Murcielago extends Mamifero with Volador, Caminante {}
class Pato extends Ave with Volador, Caminante, Nadador {}
