void main() {

  String? bienvenida = saludos('Jose');

  print('El mensaje de bienvenida es $bienvenida');

  otroSaludo('Otro personaje');

  saludosOpcionales('Jose', 'Alavez', 45);

  saludosNombrados(apellido: 'Alavez', nombre: 'Jose');
}

String? saludos(String nombre) {

  String? retorno = null;

  retorno = 'Bienvenido $nombre';

  print('retorno en la funcion es $retorno');
  return retorno;
}

void otroSaludo(String nombre) => print('Este es otro mensaje de bienvenida para $nombre');


// Parametros posicionales opcionales

void saludosOpcionales(String nombre, [String? apellido, num? edad]) {

  if (apellido != null && edad != null) {
    print('Opcionales Bienvenido $nombre $apellido, edad $edad');
  }
  else {
    print('Opcionales Bienvenido $nombre');
  }
}


// Parametros opcionales nombrados
void saludosNombrados ({String nombre = 'Anonimo', String apellido = ''}) {
  var saludos = new StringBuffer('Nombrados Bienvenido a Dart');

  if (nombre != null) {
    saludos.write(' $nombre');
  }
  if (apellido != null) {
    saludos.write(' $apellido');
  }

  print(saludos.toString());
}