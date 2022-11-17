void main(List<String> args) {

  var list = [1, 6, 7, 32, 45];

  print(list.length);
  print(list[2]);

  for( int i=0; i < list.length; i++ ) {
    print('El valor del indice $i es ' + list[i].toString());
  }

   List<String> onlyString = <String>[];

   onlyString.add('Una');
   onlyString.add('Cadena');

   for(int i = 0; i< onlyString.length; i++) {

    print('elemento ' + onlyString[i]);
   }

}