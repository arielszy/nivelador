import 'package:flutter/material.dart';
import 'package:nivelador/providers/PeliculaProvider.dart';
import 'package:nivelador/widgets/Loading.dart';
import 'pantallas/HomePage.dart';
import 'pantallas/Busqueda.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NivelApp());
}

class NivelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PeliculaProvider>(
            create: (context) => PeliculaProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MoviApp',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Next(),
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              ? HomePage()
              : Busqueda()), //si indexPage es 0 muestra la home sino muestra la busqueda (? es if : es else)
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

class Next extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget bak;
    var data = Provider.of<PeliculaProvider>(context);
    data.cargarDatosDesdeApi();
    if (data.mapaGeneros != null ||
        data.masPopulares != null ||
        data.masVistas != null) {
      if (data.mapaGeneros.isEmpty ||
          data.masPopulares.isEmpty ||
          data.masVistas.isEmpty) {
        bak = Text('hubo un error al cargar los datos');
      } else {
        bak = Home();
      }
    } else {
      bak = Loading();
    }
    return bak;
  }
}
