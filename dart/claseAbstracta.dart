abstract class Vehiculo {

  String? color;
  String? modelo;
  String? marca;

  void miCombustible();

}

abstract class EsTransporte {
  void queTransporteSoy();
}

class Camion extends Vehiculo implements EsTransporte {
  @override
  void miCombustible() {
    print("Diesel");
  }
  
  @override
  void queTransporteSoy() {
    print('Soy un camion');
  }

}

void main() {
  var camion = new Camion();

  camion.color = 'Rojo';

  camion.miCombustible();
  camion.queTransporteSoy();

}


