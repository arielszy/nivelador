import 'package:flutter/material.dart';
import 'package:nivelador/providers/api.dart';
import 'package:nivelador/moldes/Pelicula.dart';

class PeliculaProvider extends ChangeNotifier {
  List<Pelicula> masPopulares = [];
  List<Pelicula> masVistas = [];
  List<Pelicula> peliculasfavoritas = [];
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

  toggleFav(Pelicula pelicula) {
    int indexOfP =
        masPopulares.indexWhere((element) => element.id == pelicula.id);
    int indexOfW = masVistas.indexWhere((element) => element.id == pelicula.id);
    int indexOfS =
        resultadoBusqueda.indexWhere((element) => element.id == pelicula.id);

    if (pelicula.isFav) {
      pelicula.isFav = false;

      if (indexOfP != -1) {
        masPopulares[indexOfP].isFav = false;
      }
      if (indexOfW != -1) {
        masVistas[indexOfW].isFav = false;
      }
      if (indexOfS != -1) {
        resultadoBusqueda[indexOfS].isFav = false;
      }
      peliculasfavoritas.removeWhere((element) => element.id == pelicula.id);
    } else {
      pelicula.isFav = true;
      if (indexOfP != -1) {
        masPopulares[indexOfP].isFav = true;
      }
      if (indexOfW != -1) {
        masVistas[indexOfW].isFav = true;
      }
      if (indexOfS != -1) {
        resultadoBusqueda[indexOfS].isFav = true;
      }
      peliculasfavoritas.add(pelicula);
    }

    notifyListeners();
  }
}
