import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text('Mi primera aplicacion'),
    ),
    body: Container(
      child: const Center(
        child: Text('Hola mund ss', style: TextStyle(fontSize: 40.0)),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        print('click');
      },
    ),
  ));

  runApp(app);
}
