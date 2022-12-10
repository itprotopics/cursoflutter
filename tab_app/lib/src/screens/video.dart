import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  const Video({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Icon(
            Icons.ondemand_video,
            size: 120,
            color: Colors.green,
          ),
          Text('Segundo Tab')
        ],
      ),
    );
  }
}
