//pagina que muestra el detalle de cada pelicula
import 'package:flutter/material.dart';
import 'package:nivelador/moldes/Pelicula.dart';

class PeliculaDetalle extends StatelessWidget {
  const PeliculaDetalle({Key key, this.pelicula}) : super(key: key);
  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pelicula.titulo),
      ),
      body: ListView(padding: EdgeInsets.all(10), children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('Portada'),
                pelicula.urlPortada == ''
                    ? Image.asset('imagenes/nodisponible.jpg')
                    : Image.network(
                        pelicula.urlPortada,
                        height: 250,
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
        Text(
          'argumento: ' + pelicula.descripcion,
          overflow: TextOverflow.visible,
        ),
      ]),
    );
  }
}
