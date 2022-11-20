import 'dart:html';
import 'dart:collection';

void main() {
  var rosco = Rosco();

  var primeraDefinicion = rosco.obtenerPregunta();

  querySelector("#letra")?.text = primeraDefinicion.letra;
  querySelector("#pregunta")?.text = primeraDefinicion.definicion;

  querySelector("#btnEnviar")?.onClick.listen((event) {
    var respuesta = (querySelector("#textRespuesta") as InputElement).value;
    var letra = querySelector("#letra")?.text;
    print('respuesta = $respuesta letra = $letra');

    String mensaje = rosco.evaluarRespuesta(letra!, respuesta!);

    print('El mensaje es $mensaje');
  });
}

class Rosco {
  late List<Pregunta> roscoPreguntas = [];

  RoscoApi roscoApi = new RoscoApi();

  Rosco() {
    roscoPreguntas.addAll(roscoApi.obtenerRoscos());
  }

  Pregunta obtenerPregunta() {
    return roscoPreguntas[0];
  }

  Pregunta pasaPalabra() {
    return Pregunta('', '', '');
  }

  String evaluarRespuesta(String letra, String respuesta) {
    String mensaje = '';

    var esCorrecta = roscoPreguntas
        .any((rosco) => rosco.letra == letra && rosco.respuesta == respuesta);

    // if (esCorrecta == true) {
    //   mensaje = 'Letra $letra respuesta correcta';
    // } else {
    //   mensaje = 'Letra $letra respuesta incorrecta';
    // }

    mensaje = esCorrecta ? 'Letra $letra respuesta correcta' :
      'Letra $letra respuesta incorrecta';

    return mensaje;
  }
}

class Pregunta {
  String? letra;
  String? definicion;
  String? respuesta;

  Pregunta(this.letra, this.definicion, this.respuesta);
}

class Db {
  static List letras = const ['A', 'B', 'C', 'D', 'E', 'F'];

  static List definiciones = const [
    'Persona que tripula una astronave o que esta entrenada para este trabajo',
    'Especie de talega o saco de tela y otro material que sirve para llevar o guardar algo',
    'Aparato destinado a registrar imagenes animadas para el cine o la television',
    'Obra literaria escrita para ser representada',
    'Que se prolonga muchisimo o excesivamente',
    'Laboratorio y despacho del farmaceutico'
  ];

  static List respuestas = [
    'Astronauta',
    'Bolsa',
    'Camara',
    'Drama',
    'Eterno',
    'Farmacia'
  ];
}

class RoscoApi {
  List<Pregunta> roscoPreguntas = [];

  List<Pregunta> obtenerRoscos () {

    roscoPreguntas = [];
    for (var letra in Db.letras) {
      var index = Db.letras.indexOf(letra);
      var roscoPregunta =
          Pregunta(letra, Db.definiciones[index], Db.respuestas[index]);
      roscoPreguntas.add(roscoPregunta);
    }

    return roscoPreguntas;

  }
}