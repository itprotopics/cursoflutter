import 'package:flutter/material.dart';
import 'package:stateless_app/screens/card.dart';

class MyApp extends StatelessWidget {
  static const myIconSize = 40.0;
  static const TextStyle textStyle =
      TextStyle(color: Colors.grey, fontSize: 30.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Stateless widget')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            MyCard(
                title: Text("I love Flutter", style: textStyle),
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: myIconSize,
                )),
            MyCard(
                title: Text("I like this video", style: textStyle),
                icon: Icon(
                  Icons.thumb_up_alt,
                  color: Colors.blue,
                  size: myIconSize,
                )),
            MyCard(
                title: Text("Next video", style: textStyle),
                icon: Icon(
                  Icons.queue_play_next,
                  color: Colors.brown,
                  size: myIconSize,
                ))
          ],
        ));
  }
}
