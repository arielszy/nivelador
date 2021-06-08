import 'package:flutter/material.dart';
import 'pantallas/About.dart';
import 'providers/PeliculaProvider.dart';
import 'widgets/Loading.dart';
import 'pantallas/Favoritos.dart';
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
              : indexPage == 1
                  ? Busqueda()
                  : indexPage == 2
                      ? Favoritos()
                      : About()), //si indexPage es 0 muestra la home si es 1 muestra la busqueda y si es 2 muestra favoritos y si es 3 muestr contacto
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
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: "Favoritos",
              backgroundColor: Colors.grey[800]),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Acerca de",
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

//este widget carga los datos y muestra el resultado: si hay error muestra error y si no manda a la home
class Next extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<PeliculaProvider>(context, listen: false).cargarDatosDesdeApi();
    return Consumer<PeliculaProvider>(
        builder: (context, value, child) =>
            value.masPopulares != null || value.masVistas != null
                ? value.masPopulares.isEmpty || value.masVistas.isEmpty
                    ? Loading()
                    : Home()
                : Scaffold(
                    body: Center(
                      child: Text('hubo un error al cargar los datos'),
                    ),
                  ));
  }
}
