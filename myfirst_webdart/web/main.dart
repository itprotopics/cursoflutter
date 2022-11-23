
import 'dart:html';
import 'dart:collection';


void main() {
  var rosco = Rosco();

  var primeraDefinicion = rosco.obtenerPregunta(true);

  querySelector("#letra")?.text = primeraDefinicion?.letra;
  querySelector("#pregunta")?.text = primeraDefinicion?.definicion;

  querySelector("#btnEnviar")?.onClick.listen((event) {
    var respuesta = (querySelector("#textRespuesta") as InputElement).value;
    var letra = querySelector("#letra")?.text;
    print('respuesta = $respuesta letra = $letra');

    String mensaje = rosco.evaluarRespuesta(letra!, respuesta!);

    Pregunta? nuevaPregunta = rosco.obtenerPregunta(false);

    print('La nueva pregunta es $nuevaPregunta');

    actualizarUI(nuevaPregunta!);

    print('El mensaje es $mensaje');
  });
}

void actualizarUI(Pregunta pregunta) {
  querySelector('#letra')?.text = pregunta.letra;
  querySelector('#pregunta')?.text = pregunta.definicion;
  querySelector('#textRespuesta')?.text = '';
}

class Rosco {
  late ListQueue<Pregunta> roscoPreguntas = ListQueue<Pregunta>();
  List<String> respondidas = [];
  RoscoApi roscoApi = new RoscoApi();

  Rosco() {
    roscoPreguntas.addAll(roscoApi.obtenerRoscos());
  }

  Pregunta? obtenerPregunta(bool inicial) {
  
    if (inicial)  return roscoPreguntas.first;
    
    Pregunta? siguientePregunta = roscoPreguntas.firstWhere (
          (rosco) => !respondidas.any((x) => x == rosco.letra), orElse: () => Pregunta('','','') );
    

    // ignore: unnecessary_null_comparison
    if (siguientePregunta.letra == '') {
      respondidas = [];
      siguientePregunta = obtenerPregunta(false);
    }

    print('La pregunta que se pregresa en obtener es ${siguientePregunta!.letra}');
    return siguientePregunta;
  }

  Pregunta pasaPalabra() {
    return Pregunta('', '', '');
  }

  String evaluarRespuesta(String letra, String respuesta) {
    String mensaje = '';

    Pregunta pregunta =
        roscoPreguntas.firstWhere((rosco) => rosco.letra == letra);

    respondidas.add(pregunta.letra!);

    print('Las letras respondidas son $respondidas');

    // if (esCorrecta == true) {
    //   mensaje = 'Letra $letra respuesta correcta';
    // } else {
    //   mensaje = 'Letra $letra respuesta incorrecta';
    // }

    mensaje = pregunta.respuesta == respuesta
        ? 'Letra $letra respuesta correcta'
        : 'Letra $letra respuesta incorrecta';

    print('El mensaje que se mostrara es $mensaje');

    return mensaje;
  }

  //String? newMethod(Pregunta pregunta) => pregunta.letra;
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

  List<Pregunta> obtenerRoscos() {
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
