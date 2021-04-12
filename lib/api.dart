import 'package:dio/dio.dart';
import 'package:nivelador/moldes/Pelicula.dart';
import 'moldes/Generos.dart';

Future<List<Pelicula>> obtenerPeliculas(String tipo) async {
  try {
    Response respuesta = await Dio().get(
        "https://api.themoviedb.org/3/movie/$tipo?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es");

    final datosObtenidos = respuesta.data['results'];
    var listaPeliculas =
        datosObtenidos.map((datosJson) => Pelicula.armar(datosJson)).toList();

    return List<Pelicula>.from(listaPeliculas); //devuelve listdo de peliculas
  } catch (e) {
    return e;
  }
}

Future<List<Generos>> obtenerGeneros() async {
  try {
    Response respuesta = await Dio().get(
        "https://api.themoviedb.org/3/genre/movie/list?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es");

    final datosObtenidos = respuesta.data['genres'];
    var listaGeneros =
        datosObtenidos.map((datosJson) => Generos.armar(datosJson)).toList();

    return List<Generos>.from(listaGeneros); //devuelve listado de generos
  } catch (e) {
    return e;
  }
}


/*documentacion:
https://www.themoviedb.org/documentation/api
https://developers.themoviedb.org/3/movies
https://developers.themoviedb.org/3/movies/get-movie-details
https://developers.themoviedb.org/3/movies/get-top-rated-movies
https://www.themoviedb.org/talk/51ef18b5760ee3182d125573
https://www.themoviedb.org/documentation/api/discover

creditos: https://api.themoviedb.org/3/movie/550/credits?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es
*/