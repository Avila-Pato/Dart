void main() async {
  try {
    final value = await httpGet(
      'https://api.nasa.com/planetary/apod?api_key=DEMO_KEY',
    );
    print(value);
  } on Exception catch (error) {
    print('Error en la peticion http -> $error');
  }
   catch (error) {
    print('Opps, algo salio mal -> $error');
  }finally {
    print('Fin de la peticion http');
  }
}

// Asyc va a retornar un future
Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));
  throw Exception('Error en la peticion http'); 
  // return 'Status http: ?';
  // return 'Valor de la peticion http';
}
