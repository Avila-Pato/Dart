void main() {
  final windPlant = WindPlant(initialEnergy: 100);
  final nuclearPlant = NuclearPlant(energyLeft: 1000);

  print('Wind: ${windPlant.energyLeft} (${windPlant.type})');
  print('Nuclear: ${nuclearPlant.energyLeft} (${nuclearPlant.type})');

  windPlant.consumeEnergy(20);
  nuclearPlant.consumeEnergy(20); // consume la mitad: 10

  // Ambas se pueden pasar como EnergyPlant (polimorfismo),
  // sin importar si usaron extends o implements.
  print('Carga con wind: ${chargePhone(windPlant)}');
  print('Carga con nuclear: ${chargePhone(nuclearPlant)}');
}

double chargePhone(EnergyPlant plant) {
  if (plant.energyLeft < 10) {
    throw Exception('Not enough energy');
  }
  return plant.energyLeft - 10;
}

// enum: conjunto fijo de valores posibles. Evita usar Strings sueltos
// como 'nuclear' o 'wind' que se pueden escribir mal.
enum PlantType { nuclear, wind, water }

// abstract class: NO se puede instanciar directamente (EnergyPlant() da error).
// Sirve como "molde" o contrato que otras clases deben cumplir.
abstract class EnergyPlant {
  double energyLeft;
  final PlantType type;

  EnergyPlant({required this.energyLeft, required this.type});

  // Método abstracto: no tiene cuerpo, las clases hijas DEBEN implementarlo.
  void consumeEnergy(double amount);
}

// ============================================================
// EXTENDS (herencia)
// ============================================================
// Cómo se usa:
//   class Hija extends Padre { ... }
//   - Hereda todo lo del padre: propiedades, constructor (vía super) y
//     métodos que ya tengan cuerpo.
//   - Solo debes implementar los métodos abstractos.
//   - Se llama al constructor del padre con `: super(...)`.
//   - Solo se puede extender UNA clase.
//
// Cuándo usarlo:
//   - Cuando hay una relación "ES UN" real (WindPlant ES UNA EnergyPlant).
//   - Cuando quieres reutilizar código/lógica del padre sin reescribirlo.
//
// Es el MÁS USADO en el día a día (ej: en Flutter,
// `class MyWidget extends StatelessWidget`).
class WindPlant extends EnergyPlant {
  WindPlant({required double initialEnergy})
      : super(energyLeft: initialEnergy, type: PlantType.wind);

  @override
  void consumeEnergy(double amount) => energyLeft -= amount;
}

// ============================================================
// IMPLEMENTS (interfaz / contrato)
// ============================================================
// Cómo se usa:
//   class Clase implements Contrato { ... }
//   - NO hereda nada: ni código, ni constructor, ni valores.
//   - Debes volver a declarar TODAS las propiedades y métodos
//     con @override (por eso aquí repetimos energyLeft y type).
//   - No se usa `super(...)`.
//   - Se pueden implementar VARIAS clases: implements A, B, C
//
// Cuándo usarlo:
//   - Cuando solo quieres garantizar que la clase "cumple" con cierta
//     forma (tiene tales métodos/propiedades), pero con su propia lógica.
//   - Cuando necesitas cumplir varios contratos a la vez.
//   - Muy usado en arquitectura limpia (repositorios, datasources) y
//     para crear clases falsas (mocks) en tests.
//
// ¿Cuál se recomienda?
//   - Si quieres reutilizar código -> extends (el más común).
//   - Si solo quieres un contrato, sin heredar código -> implements.
class NuclearPlant implements EnergyPlant {
  @override
  double energyLeft;

  @override
  final PlantType type = PlantType.nuclear;

  // required porque energyLeft no puede ser nulo
  NuclearPlant({required this.energyLeft});

  @override
  void consumeEnergy(double amount) {
    energyLeft -= (amount * 0.5);
  }
}
