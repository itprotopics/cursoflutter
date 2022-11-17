class Vehiculo {

  late String marca;
  late String modelo;
  late String color;

  //  Vehiculo(String nombreMarca, String nombreModelo) {
  //    marca = nombreMarca;
  //    modelo = nombreModelo;
  //  }


  Vehiculo(this.marca, this.modelo);

  void arrancar() {
    print('Hola soy el auto $marca y estoy arrrancando mi modelo es $modelo');
  }

  void cambiarMarca(Vehiculo vehiculo) {
    vehiculo.marca = 'Ford';
  }
}

void main() {

  var vehiculo = Vehiculo('Ford', 'pick-up');

  vehiculo.arrancar();

}