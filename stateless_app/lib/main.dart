import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless widget'),
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                  child: Column(
                children: <Widget> [
                  const Text(
                    'JLAM',
                    style: TextStyle(color: Colors.grey, fontSize: 30.2),
                  ),
                  const Text('MAU'),
                ],
              ))
            ]),
      ),
    );
  }
}
