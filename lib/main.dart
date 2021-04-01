import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Busqueda.dart';

void main() {
  runApp(NivelApp());
}

class NivelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoviApp',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Back(),
    );
  }
}

class Back extends StatefulWidget {
  @override
  _BackState createState() => _BackState();
}

class _BackState extends State<Back> {
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'MoviApp',
          style: TextStyle(color: Colors.grey[300]),
        ),
        backgroundColor: Colors.grey[600],
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: indexPage == 0
              ? homePage()
              : busqueda()), //si indexPage es 0 muestra la home sino muestra la busqueda (? es if : es else)
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.grey[800]),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Buscar",
              backgroundColor: Colors.grey[800]),
        ],
        onTap: (index) => _cambiarPagina(index),
        currentIndex: indexPage,
      ),
    );
  }

  void _cambiarPagina(int index) {
    setState(() {
      indexPage = index;
    });
  }
}
