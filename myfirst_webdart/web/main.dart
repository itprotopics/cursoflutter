import 'dart:html';

void main() {
  var rosco = Rosco();

  var primeraDefinicion = rosco.obtenerPregunta();

  querySelector("#letra")?.text = primeraDefinicion.letra;
  querySelector("#pregunta")?.text = primeraDefinicion.definicion;

  querySelector("#btnEnviar")?.onClick.listen((event) {
    var respuesta = (querySelector("#textRespuesta") as InputElement).value;
    var letra = querySelector("#letra")?.text;
    print('respuesta = $respuesta letra = $letra');
  });
}

class Rosco {
  late List<Pregunta> roscoPreguntas;

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

  Rosco() {
    roscoPreguntas = [];
    for (var letra in letras) {
      var index = letras.indexOf(letra);
      var roscoPregunta =
          Pregunta(letra, definiciones[index], respuestas[index]);
      roscoPreguntas.add(roscoPregunta);
    }
  }

  Pregunta obtenerPregunta() {
    return roscoPreguntas[0];
  }

  Pregunta pasaPalabra() {
    return Pregunta('', '', '');
  }

  String evaluarRespuesta(String letra, String respuesta) {
    var esCorrecta = roscoPreguntas.any((rosco) => rosco.letra == letra && 
    rosco.respuesta == respuesta);
  }
}

class Pregunta {
  String? letra;
  String? definicion;
  String? respuesta;

  Pregunta(this.letra, this.definicion, this.respuesta);
}
