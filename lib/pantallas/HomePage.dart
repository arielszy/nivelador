import 'package:flutter/material.dart';
import 'package:nivelador/loader.dart';
import 'package:nivelador/moldes/Pelicula.dart';
import 'package:provider/provider.dart';
import '../api.dart';
import '../widgets/PeliculaWidget.dart';
import 'package:nivelador/main.dart';

Widget homePage() {
  Loader load;
  return DefaultTabController(
    //controla el estado de las pestañas
    length: 2,
    child: Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(height: 50),
          child: TabBar(
            //genera la barra de pestañas
            tabs: [
              Tab(
                child: Text(
                  'Mas populares',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Mas vistas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          //se agrega para que se renderize como debe
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: TabBarView(
              //contenido de las pestañas. va segun el orden
              children: [
                render('popular'),
                render('top_rated'),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

render(String tipo) {
  //genera y muestra el listado de peliculas
  return FutureBuilder(
    future: obtenerPeliculas(tipo),
    builder: (context, snapshot) => snapshot.hasError == false
        ? snapshot.hasData
            ? ListView.builder(
                itemBuilder: (context, index) => PeliculaWidget(
                  pelicula: snapshot.data[index],
                ),
                itemCount: snapshot.data.length,
              )
            : Center(child: CircularProgressIndicator())
        : Text('error'),
  );
}

Widget render2(String tipo) {
  Loader load;

  tipo == 'popular'
      ? ListView.builder(
          itemBuilder: (context, index) => PeliculaWidget(
            pelicula: load.lista_popular[index],
          ),
          itemCount: load.lista_popular.length,
        )
      : ListView.builder(
          itemBuilder: (context, index) => PeliculaWidget(
            pelicula: load.lista_top_rated[index],
          ),
          itemCount: load.lista_top_rated.length,
        );
}
