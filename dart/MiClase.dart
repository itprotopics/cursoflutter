

class Vehiculo {

  late String marca;
  late String modelo;
  late String color;

  // Vehiculo(String nombreMarca) {
  //   marca = nombreMarca;
  // }

  Vehiculo(this.marca);

  void arrancar() {
    print('Hola soy el auto $marca y estoy arrrancando');
  }

  void cambiarMarca(Vehiculo vehiculo) {
    vehiculo.marca = 'Ford';
  }
}

void main() {
  var vehiculo = Vehiculo('mazda');

  vehiculo.marca = 'mazda';
  vehiculo.arrancar();

  vehiculo.cambiarMarca(vehiculo);

  vehiculo.arrancar();

}