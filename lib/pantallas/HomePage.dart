import 'package:flutter/material.dart';
import 'package:nivelador/providers/PeliculaProvider.dart';
import 'package:provider/provider.dart';
import '../widgets/PeliculaWidget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                  Consumer<PeliculaProvider>(
                    builder: (context, value, child) => ListView.builder(
                      itemBuilder: (context, index) => PeliculaWidget(
                        pelicula: value.masPopulares[index],
                      ),
                      itemCount: value.masPopulares.length,
                    ),
                  ),
                  Consumer<PeliculaProvider>(
                    builder: (context, value, child) => ListView.builder(
                      itemBuilder: (context, index) => PeliculaWidget(
                        pelicula: value.masVistas[index],
                      ),
                      itemCount: value.masVistas.length,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
/* 
  otro(String tipo) {
    return Consumer<Loader>(
      builder: (context, value, child) {
        value.masPopulares != null
            ? tipo == 'popular'
                ? ListView.builder(
                    itemBuilder: (context, index) => PeliculaWidget(
                      pelicula: value.masPopulares[index],
                    ),
                    itemCount: value.masPopulares.length,
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => PeliculaWidget(
                      pelicula: value.masVistas[index],
                    ),
                    itemCount: value.masVistas.length,
                  )
            : CircularProgressIndicator();
        return this;
      },
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
              pelicula: load.masPopulares[index],
            ),
            itemCount: load.masPopulares.length,
          )
        : ListView.builder(
            itemBuilder: (context, index) => PeliculaWidget(
              pelicula: load.masVistas[index],
            ),
            itemCount: load.masVistas.length,
          );
    return this;
  }

 */
}
