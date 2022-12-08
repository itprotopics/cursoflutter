import 'package:flutter/material.dart';

class MyDialogWidget extends StatefulWidget {
  const MyDialogWidget({super.key});

  @override
  State<MyDialogWidget> createState() => _MyDialogWidgetState();
}

enum DialogAction { yes, no }

class _MyDialogWidgetState extends State<MyDialogWidget> {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  String inputValue = '';

  void alertResult(DialogAction action) {
    print('Tu seleccion es $action');
  }

  void showAlert(String value) {
    // ignore: prefer_const_constructors
    AlertDialog dialog = AlertDialog(
      content: Text(value),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              alertResult(DialogAction.yes);
            },
            child: const Text("Si")),
        TextButton(
            onPressed: () {
              alertResult(DialogAction.no);
            },
            child: const Text("No"))
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  void myOnChanged(String value) {
    setState(() {
      inputValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog widget')),
      body: Column(
        // ignore: sort_child_properties_last
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(hintText: 'Ingrese el texto'),
            onChanged: myOnChanged,
          ),
          const Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
            style: style,
            onPressed: () {
              showAlert(inputValue);
            },
            child: const Text('Ver alerta'),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
