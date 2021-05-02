import 'package:flutter/material.dart';
import 'package:nivelador/providers/api.dart';
import 'package:nivelador/moldes/Pelicula.dart';

class PeliculaProvider extends ChangeNotifier {
  List<Pelicula> masPopulares;
  List<Pelicula> masVistas;
  //Map mapaGeneros;

  cargarDatosDesdeApi() async {
  //  mapaGeneros = await obtenerGeneros();
    masVistas = await obtenerPeliculas('top_rated');
    masPopulares = await obtenerPeliculas('popular');
    notifyListeners();
  }
}
