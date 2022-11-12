void main() {
  String paisHablaHispana = 'Cdhile';

  switch(paisHablaHispana) {
    case 'Canada':
      print('Incorrecto');
      break;
    case 'Francia':
      print('Incorrecto');
      break;
    case 'Chile':
      print('Correcto');
      break;
    default:
      throw('Sin definir');

  }
}