import 'package:flutter/material.dart';
import 'package:nivelador/providers/api.dart';
import 'package:nivelador/moldes/Pelicula.dart';

class PeliculaProvider extends ChangeNotifier {
  List<Pelicula> masPopulares;
  List<Pelicula> masVistas;
  List resultadoBusqueda = [];

  cargarDatosDesdeApi() async {
    masVistas = await obtenerPeliculas('top_rated');
    masPopulares = await obtenerPeliculas('popular');
    notifyListeners();
  }

  busqueda(String textoABuscar) async {
    resultadoBusqueda = await obtenerPeliculasPorBusqueda(textoABuscar);
    notifyListeners();
  }
}
