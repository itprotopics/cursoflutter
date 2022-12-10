import 'package:flutter/material.dart';
import 'package:tab_app/src/screens/contact.dart';
import 'package:tab_app/src/screens/home.dart';
import 'package:tab_app/src/screens/video.dart';

class MyTabs extends StatefulWidget {
  const MyTabs({super.key});

  @override
  State<MyTabs> createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Video tabs'),
            backgroundColor: Colors.redAccent,
            bottom: const TabBar(tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.ondemand_video)),
              Tab(icon: Icon(Icons.contacts)),
            ]),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          body:
              const TabBarView(children: <Widget>[Home(), Video(), Contact()]),
        ));
  }
}
