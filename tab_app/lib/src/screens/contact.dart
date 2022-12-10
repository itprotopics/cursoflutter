import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Icon(
            Icons.contacts,
            size: 120,
            color: Colors.grey,
          ),
          const Text('Tercer Tab')
        ],
      ),
    );
  }
}
