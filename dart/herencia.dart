
class Vehiculo{
  String? color;
  String? modelo;
  String? marca;

  void mostrarVehiculo() {
    print('Marca: $marca, Modelo $modelo, color: $color');    
  }

}

class Camion extends Vehiculo {

}

void main(List<String> args) {

  var camion = new Camion();

  camion.color = 'Blanco';
  camion.modelo = 'Truck';
  camion.marca = 'Volvo';

  camion.mostrarVehiculo();
}