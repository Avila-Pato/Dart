
// los Streams son como los Observable en RxJS ayudan a manejar las asincronias en dart
// Los streams pueden ser retornados y usados como 
// objetos, funciones o métodos, son un flujo de 
// información que puede estar emitiendo valores 
// periódicamente, una única vez, o nunca.  
// Un Stream podría verse como una manguera 
// conectada a un tubo de agua, cuando abres el tubo el 
// agua fluye, cada gota de agua sería una emisión del 
// Stream, la manguera puede nunca cerrarse, cerrarse o 
// nunca abrirse.

void main() {

  emitNumbers().listen(print);
}

emitNumbers() {
  Stream<int> counterStream = Stream.periodic(Duration(seconds: 1), (int value) {
    return value;
  }).take(  
    10 // 10 emisiones
  );
  return counterStream;
  }


