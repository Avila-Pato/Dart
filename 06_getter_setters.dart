// Punto de entrada del programa
void main() {

  // Crea un objeto Square y le pasa el lado = 10
  final mySquare = Square(side: 10.0);

  // Obtiene el área usando el getter "area"
  print('Area: ${mySquare.area}');
}


// Clase que representa un cuadrado
class Square {

  // Variable privada que guarda el tamaño del lado
  double _side;


  // Constructor de la clase
  // "required" significa que side es obligatorio
  Square({required double side})

      // Inicializa _side con el valor recibido
      : _side = side;


  // Getter para obtener el área
  // Se puede usar como: mySquare.area
  double get area {

    // Calcula lado × lado
    return _side * _side;
  }


  // Setter para modificar el lado
  // Se puede usar como: mySquare.side = 20
  set side(double value) {

    // Muestra el nuevo valor por consola
    print('Setting new value $value');

    // Comprueba que el valor no sea negativo
    if (value < 0) {

      // Lanza un error
      throw 'Value must be greater than zero';
    }

    // Si es válido, cambia el valor de _side
    _side = value;
  }


  // Método que calcula el área
  // => significa que retorna directamente la expresión
  double calculateArea() => _side * _side;
}