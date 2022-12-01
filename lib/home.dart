import 'package:flutter/material.dart';

import 'dados_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color? theme = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        // actions: <Widget>[
        //   IconButton(
        //     onPressed: () {
        //       setState(() {
        //         theme = theme == Colors.black ? Colors.grey[50] : Colors.black;
        //       });
        //     },
        //     icon: const Icon(Icons.brightness_medium),
        //   ),
        // ],
      ),
      backgroundColor: theme,
      body: const DadosPage(),
    );
  }
}
