
class Vehiculo{
  String? color;
  String? modelo;
  String? marca;

  void mostrarVehiculo() {
    print('Marca: $marca, Modelo $modelo, color: $color');    
  }

  void queVehiculoSoy() {
    print('Todavia no estoy implementado');
  }

  Vehiculo(this.modelo, this.marca);
}

class Camion extends Vehiculo {

  Camion(super.modelo, super.marca);

  
  @override 
  void queVehiculoSoy() {
    print('Soy un camion');
  } 
}

class Auto extends Vehiculo {

  Auto(super.modelo, super.marca);


  @override 
  void queVehiculoSoy() {
    print('Soy un auto');
  } 

}

void main(List<String> args) {

  var camion = new Camion('pick', 'Ford');


  camion.mostrarVehiculo();

}