import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Colors.blueAccent);

  String flutterText = '';
  int index = 0;
  List<String> collecionPalabras = ['Flutter', 'es', 'genial'];

  void onPressButton() {
    setState(() {
      flutterText = collecionPalabras[index];
      index = index < 2 ? index + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statefull widget'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              flutterText,
              style: const TextStyle(fontSize: 40),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: onPressButton,
                style: style,
                child: const Text('Actualizar'))
          ],
        ),
      ),
    );
  }
}
