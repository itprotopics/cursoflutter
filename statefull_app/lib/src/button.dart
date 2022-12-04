import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statefull widget'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Jose',
              style: TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              child: Text('Actualizar'),
              onPressed: () {},
            )
          ],
        ),
      )),
    );
  }
}
