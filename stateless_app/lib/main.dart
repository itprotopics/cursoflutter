import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  static const myIconSize = 40.0;
  static const TextStyle textStyle =
      TextStyle(color: Colors.grey, fontSize: 30.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless widget'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MyCard(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                  size: myIconSize,
                ),
                title: Text("I love Flutter", style: textStyle),
                    ])))
          ]),
    );
  }
}

class MyCard extends StatelessWidget {
  final Widget title;
  final Widget icon;

  const MyCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: <Widget>[this.title, this.icon]),
    ));
  }
}
