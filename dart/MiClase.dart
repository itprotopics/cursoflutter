void main() {
  var vehiculo = Vehiculo('mazda');

  vehiculo.marca = 'mazda';
  vehiculo.arrancar();

}

class Vehiculo {

  late String marca;

  // Vehiculo(String nombreMarca) {
  //   marca = nombreMarca;
  // }

  Vehiculo(this.marca);

  void arrancar() {
    print('Hola soy el auto $marca y estoy arrrancando');
  }
}

