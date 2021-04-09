import 'package:flutter/material.dart';
import 'api.dart';
import 'Pelicula.dart';
import 'PeliculaWidget.dart';

Widget homePage() {
  //List<Pelicula> masPopulares = obtenerPeliculas('popular') as List<Pelicula>;
  // List<Pelicula> masVistas = obtenerPeliculas('top_rated') as List<Pelicula>;
  return DefaultTabController(
    length: 2,
    child: Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(height: 50),
          child: TabBar(
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
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: TabBarView(children: [
              FutureBuilder(
                  future: obtenerPeliculas('popular'),
                  builder: (context, snapshot) => snapshot.hasData
                      ? ListView.builder(
                          itemBuilder: (context, index) => PeliculaWidget(
                            titulo: snapshot.data[index].titulo,
                            descripcion: snapshot.data[index].descripcion,
                            urlAvatar: snapshot.data[index].urlAvatar,
                          ),
                          itemCount: snapshot.data.length,
                        )
                      : Center(child: CircularProgressIndicator())),
              FutureBuilder(
                  future: obtenerPeliculas('top_rated'),
                  builder: (context, snapshot) => snapshot.hasData
                      ? ListView.builder(
                          itemBuilder: (context, index) => PeliculaWidget(
                            titulo: snapshot.data[index].titulo,
                            descripcion: snapshot.data[index].descripcion,
                            urlAvatar: snapshot.data[index].urlAvatar,
                          ),
                          itemCount: snapshot.data.length,
                        )
                      : Center(child: CircularProgressIndicator()))
            ]),
          ),
        )
      ],
    ),
  );
}
