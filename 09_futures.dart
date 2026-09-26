// Future valor que no esa disponible ahora, pero se va a
// disponer en el futuro.

// Podemos tener 3 estados: pending, completed, error
// trabaja con apis, leer base de datos, esperar unos segundos


void main() {

// Esto demora 1 segundo en espera
  httpGet('https://api.nasa.com/planetary/apod?api_key=DEMO_KEY')
      .then((value) => print(value))
      .catchError((error) => print(error));

}

Future<String> httpGet( String url) {
  //Future.delayed me sirve para simular un delay
  return Future.delayed(const Duration(seconds: 1), () {
    // excepttion
    throw 'Error en la peticion http';
    // return 'Hola Mundo';
  });
}

