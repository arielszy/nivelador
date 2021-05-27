//pagina que muestra el detalle de cada pelicula
import 'package:flutter/material.dart';
import 'package:nivelador/moldes/Pelicula.dart';
import 'package:nivelador/providers/api.dart';

class PeliculaDetalle extends StatelessWidget {
  const PeliculaDetalle({this.pelicula});
  final Pelicula pelicula;
  static const styleTitulo = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static const styleCuerpo = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          pelicula.titulo,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: pelicula.urlAvatar != ''
                  ? Image.network(pelicula.urlAvatar,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.fill,
                      color: const Color.fromRGBO(
                          255, 255, 255, 0.6), //agrega opacidad
                      colorBlendMode: BlendMode.modulate)
                  : Image.asset('imagenes/cloud.jpg',
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                      color: const Color.fromRGBO(255, 255, 255, 0.6),
                      colorBlendMode: BlendMode.modulate),
            ),
            Container(
              color: const Color.fromRGBO(255, 255, 255, 0.3),
              margin: EdgeInsets.all(20),
              child: ListView(padding: EdgeInsets.all(10), children: [
                pelicula.urlPortada == ''
                    ? Image.asset(
                        'imagenes/nodisponible.jpg',
                        height: 300,
                        width: 200,
                      )
                    : Image.network(
                        pelicula.urlPortada,
                        height: 300,
                        width: 200,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Puntaje:',
                          style: styleTitulo,
                        ),
                        Text(
                          pelicula.puntaje,
                          style: styleCuerpo,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Año de lanzamiento:',
                          style: styleTitulo,
                        ),
                        Text(
                          pelicula.fechaDeLanzamiento,
                          style: styleCuerpo,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Generos',
                          style: styleTitulo,
                        ),
                        Text(
                          pelicula.generos,
                          style: styleCuerpo,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Text(
                      'Argumento',
                      style: styleTitulo,
                    ),
                    Text(
                      pelicula.descripcion,
                      overflow: TextOverflow.visible,
                      style: styleCuerpo,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                FutureBuilder(
                  future: obtenerActores(pelicula.id),
                  builder: (context, snapshot) => snapshot.hasData
                      ? snapshot.hasError
                          ? Text('')
                          : Column(
                              children: [
                                Text(
                                  'Elenco: ',
                                  style: styleTitulo,
                                ),
                                Text(
                                  snapshot.data,
                                  overflow: TextOverflow.visible,
                                  style: styleCuerpo,
                                ),
                              ],
                            )
                      : LinearProgressIndicator(),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  
}
