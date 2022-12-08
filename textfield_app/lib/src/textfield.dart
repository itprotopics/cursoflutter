import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String inpuText = '';
  TextEditingController textEditingController = TextEditingController();

  void onSubmitted(String value) {
    setState(() {
      inpuText = inpuText + '\n' + value;
      textEditingController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Textfield widget')),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onSubmitted: onSubmitted,
              decoration: const InputDecoration(hintText: 'Ingrese el texto'),
              controller: textEditingController,
            ),
            Text(inpuText)
          ]),
    );
  }
}
