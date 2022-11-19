import 'dart:html';


void main(List<String> args) {
  
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
    for (var letra in letras) {
      var index = letras.indexOf(letra);
      var roscoPregunta = Pregunta(letra, definiciones[index], respuestas[index]);
      roscoPreguntas.add(roscoPregunta);
    }
  }

  Pregunta obtenerPregunta() {
    return Pregunta('','','');
  }

  Pregunta pasaPalabra() {
    return Pregunta('','','');
  }

  String evaluarRespuesta() {
    return "";
  }



}

class Pregunta {

  String? letra;
  String? definicion;
  String? respuesta;

  Pregunta(this.letra, this.definicion, this.respuesta);


}