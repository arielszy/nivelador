//pagina que muestra el detalle de cada pelicula

import 'package:flutter/material.dart';
import 'package:nivelador/moldes/Pelicula.dart';

peliculaDetalle(Pelicula pelicula) {
  return Scaffold(
    appBar: AppBar(
      title: Text(pelicula.id),
    ),
  );
}