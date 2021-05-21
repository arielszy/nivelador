//pagina que muestra el detalle de cada pelicula
import 'package:flutter/material.dart';
import 'package:nivelador/moldes/Pelicula.dart';
import 'package:nivelador/providers/api.dart';

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
        pelicula.urlAvatar == ''
            ? Image.asset('imagenes/nodisponible.jpg')
            : Image.network(
                pelicula.urlAvatar,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('año de lanzamiento: ${pelicula.fechaDeLanzamiento}'),
                Text('Puntaje: ${pelicula.puntaje}'),
                Text('generos: ${pelicula.generos}'),
              ],
            )
          ],
        ),
        Text(
          'argumento: ' + pelicula.descripcion,
          overflow: TextOverflow.visible,
        ),
        FutureBuilder(
          future: obtenerActores(pelicula.id),
          builder: (context, snapshot) => snapshot.hasData
              ? snapshot.hasError
                  ? Text('error')
                  : Text('Elenco: ${snapshot.data}')
              : LinearProgressIndicator(),
        )
      ]),
    );
  }
}
