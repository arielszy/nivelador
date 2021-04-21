import 'package:flutter/material.dart';
import 'package:nivelador/api.dart';
import 'package:nivelador/moldes/Pelicula.dart';

class Loader extends ChangeNotifier {
  List<Pelicula> lista_popular;
  List<Pelicula> lista_top_rated;

  loader() async {
    lista_popular = await obtenerPeliculas('popular');
    lista_top_rated = await obtenerPeliculas('top_rated');
    notifyListeners();
  }

}
