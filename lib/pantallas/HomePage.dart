import 'package:flutter/material.dart';
import '../api.dart';
import '../widgets/PeliculaWidget.dart';

Widget homePage() {
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
      builder: (context, snapshot) => snapshot.hasData
          ? ListView.builder(
              itemBuilder: (context, index) => PeliculaWidget(
                pelicula: snapshot.data[index],
              ),
              itemCount: snapshot.data.length,
            )
          : Center(child: CircularProgressIndicator()));
}
