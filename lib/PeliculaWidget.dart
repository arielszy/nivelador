import 'package:flutter/material.dart';

class PeliculaWidget extends StatelessWidget {
  PeliculaWidget({
    this.titulo = '',
    this.descripcion = '',
    this.urlAvatar = '',
  });

  final String titulo;
  final String descripcion;
  final String urlAvatar;
  final String url = 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          titulo,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          descripcion,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Image.network(
          url + urlAvatar,
          height: 194,
          fit: BoxFit.fitWidth,
        ),
        Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
