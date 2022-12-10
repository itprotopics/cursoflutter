import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Icon(
            Icons.home,
            size: 120,
            color: Colors.blue,
          ),
          const Text('Primer Tab')
        ],
      ),
    );
  }
}
