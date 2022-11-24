import 'dart:html';
import 'dart:collection';

void main() {
  var rosco = Rosco();
  var roscoEstado = RoscoEstado();
  var primeraDefinicion = rosco.obtenerPregunta(true);

  querySelector("#letra")?.text = primeraDefinicion?.letra;
  querySelector("#pregunta")?.text = primeraDefinicion?.definicion;

  querySelector("#btnEnviar")?.onClick.listen((event) {
    if (roscoEstado.continuarRosco(rosco)) {
      var respuesta = (querySelector("#textRespuesta") as InputElement).value;
      var letra = querySelector("#letra")?.text;
      print('respuesta = $respuesta letra = $letra');

      String mensaje = rosco.evaluarRespuesta(letra!, respuesta!);

      Pregunta? nuevaPregunta = rosco.obtenerPregunta(false);

      print('La nueva pregunta es $nuevaPregunta');

      actualizarUI(nuevaPregunta!);

      print('El mensaje es $mensaje');
    }
  });

  querySelector("#btnPasaPalabra")?.onClick.listen((event) {
    String? letraActual = '';

    if (roscoEstado.continuarRosco(rosco)) {
      letraActual = querySelector("#letra")?.text;

      var nuevaPregunta = rosco.pasaPalabra(letraActual!);
      actualizarUI(nuevaPregunta);
    }
  });
}

void actualizarUI(Pregunta pregunta) {
  querySelector('#letra')?.text = pregunta.letra;
  querySelector('#pregunta')?.text = pregunta.definicion;
  querySelector('#textRespuesta')?.text = '';
}

void deshabilitar() {}

class Rosco implements Resultado {
  late ListQueue<Pregunta> roscoPreguntas = ListQueue<Pregunta>();
  List<String> respondidas = [];
  List<String> pasadas = [];
  RoscoApi roscoApi = new RoscoApi();

  @override
  int correctas = 0;

  @override
  int incorrectas = 0;

  @override
  int numPreguntas = 0;

  Rosco() {
    roscoPreguntas.addAll(roscoApi.obtenerRoscos());
    numPreguntas = roscoPreguntas.length;
  }

  Pregunta? obtenerPregunta(bool inicial) {
    if (inicial) return roscoPreguntas.first;

    Pregunta? siguientePregunta = roscoPreguntas.firstWhere(
        (rosco) =>
            !respondidas.any((x) => x == rosco.letra) &&
            !pasadas.any((element) => element == rosco.letra),
        orElse: () => Pregunta('', '', ''));

    // ignore: unnecessary_null_comparison
    if (siguientePregunta.letra == '') {
      if (puedoResetearRosco()) {
        pasadas = [];
        siguientePregunta = obtenerPregunta(false);
      } else {
        siguientePregunta = roscoPreguntas.last;
      }
    }

    print(
        'La pregunta que se pregresa en obtener es ${siguientePregunta!.letra}');

    return siguientePregunta;
  }

  Pregunta pasaPalabra(String letraActual) {
    var siguientePregunta = roscoPreguntas.firstWhere(
        (rosco) =>
            !(rosco.letra == letraActual) &&
            !pasadas.any((element) => element == rosco.letra) &&
            !respondidas.any((element) => element == rosco.letra),
        orElse: () => Pregunta('', '', ''));

    if (siguientePregunta.letra == '') {
      if (puedoResetearRosco()) {
        pasadas = [];
        return pasaPalabra('');
      } else {
        return roscoPreguntas.last;
      }
    }

    pasadas.add(letraActual);

    return siguientePregunta;
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

    if (pregunta.respuesta == respuesta) {
      correctas++;
      mensaje = 'Letra $letra respuesta correcta';
    } else {
      incorrectas++;
      mensaje = 'Letra $letra respuesta incorrecta';
    }
    print('El mensaje que se mostrara es $mensaje');

    return mensaje;
  }

  bool puedoResetearRosco() {
    return roscoPreguntas
        .any((rosco) => !respondidas.any((x) => x == rosco.letra));
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

abstract class Resultado {
  late int incorrectas;
  late int correctas;
  late int numPreguntas;
}

class RoscoEstado {
  bool continuar = true;

  bool continuarRosco(Resultado resultado) {
    evaluarRosco(resultado.correctas == resultado.numPreguntas,
        'Ganaste el Rosco!! Felicidades');
    evaluarRosco(
        resultado.incorrectas == resultado.numPreguntas, 'Se acabo el rosco');
    evaluarRosco(
        resultado.incorrectas + resultado.correctas == resultado.numPreguntas,
        'Se acabo el rosco');
    return continuar;
  }

  void evaluarRosco(bool condicion, mensaje) {
    if (condicion) {
      continuar = false;
      print(mensaje);
    }
  }
}
