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
              indicatorWeight: 5.0,
              indicatorColor: Colors.black,
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

}
