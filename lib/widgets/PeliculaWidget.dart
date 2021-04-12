import 'package:flutter/material.dart';
import 'package:nivelador/moldes/Pelicula.dart';
import 'package:nivelador/pantallas/PeliculaDetalle.dart';

class PeliculaWidget extends StatelessWidget {
  PeliculaWidget({this.pelicula});

  final Pelicula pelicula;

  final String url =
      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2'; // url base donde estan las imagenes

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => peliculaDetalle(pelicula)),
      ),
      child: Card(
        elevation: 5, // le da una sombra al card
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)), // redondea las esquinas
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  url + pelicula.urlAvatar,
                  height: 194,
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
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      pelicula.descripcion,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
    );
  }
}
