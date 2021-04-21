//pagina que muestra el detalle de cada pelicula

import 'package:flutter/material.dart';
import 'package:nivelador/moldes/Pelicula.dart';
import 'package:nivelador/providers/listado-provider.dart';
import 'package:provider/provider.dart';
import 'package:nivelador/main.dart';

Widget peliculaDetalle(Pelicula pelicula) {
  return Scaffold(
    appBar: AppBar(
      title: Text(pelicula.titulo),
    ),
    body: ListView(padding: EdgeInsets.all(10), children: [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('Portada'),
                Image.network(
                  pelicula.urlPortada,
                  width: 250,
                  height: 350,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('año de lanzamiento: ' +
                    pelicula.fechaDeLanzamiento.substring(0,
                        4)), //corta el texto y manda solo los primeros 4 caracteres
                Text('Puntaje: ' + pelicula.puntaje),
              ],
            )
          ],
        ),
      ),
      Expanded(
        child: Text(
          'argumento: ' + pelicula.descripcion,
          overflow: TextOverflow.visible,
        ),
      ),
    ]),
  );
}
