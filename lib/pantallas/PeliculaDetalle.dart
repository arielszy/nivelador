//pagina que muestra el detalle de cada pelicula

import 'package:flutter/material.dart';
import 'package:nivelador/moldes/Pelicula.dart';
import 'package:nivelador/providers/listado-provider.dart';
import 'package:provider/provider.dart';

peliculaDetalle(Pelicula pelicula) {
  return Scaffold(
    appBar: AppBar(
      title: Text(pelicula.id),
    ),
    body: Center(
      child: Consumer<ListadoProvider>(
          builder: (context, data, child) =>
              data.listado() != null ? Text('5') : Text('no')),
    ),
  );
}
