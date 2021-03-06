import 'package:flutter/material.dart';
import 'package:nivelador/moldes/Pelicula.dart';
import 'package:nivelador/pantallas/PeliculaDetalle.dart';

class PeliculaWidget extends StatelessWidget {
  PeliculaWidget({this.pelicula});

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //boton con el card dentro, para pasar al detalle al tocar.
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[400], // background color
        // onPrimary: Colors.white, // foreground color
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PeliculaDetalle(pelicula: pelicula)),
      ),
      child: Card(
        elevation: 5, // le da una sombra al card
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)), // redondea las esquinas
        margin: EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            //le da un degradado al fondo
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.grey,
            ],
            stops: [
              0.8,
              0.9,
            ],
          )),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                ClipRRect(
                  //recorta las esquinas de la imagen
                  borderRadius: BorderRadius.circular(20),
                  child: pelicula.urlPortada == ''
                      ? Image.asset('imagenes/nodisponible.jpg')
                      : Image.network(
                          pelicula.urlPortada,
                          height: 140,
                        ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  //se agrega expanded par evitar error de render
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        pelicula.titulo,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(pelicula.generos),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        pelicula.descripcion,
                        overflow: TextOverflow
                            .ellipsis, //puntos suspensivos cuando se queda sin lugar
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Mas detalles...',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
