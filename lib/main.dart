import 'package:flutter/material.dart';

void main() {
  runApp(NivelApp());
}

class NivelApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(),
      ),
    );
  }
}