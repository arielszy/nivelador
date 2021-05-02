import 'package:dio/dio.dart';
import 'package:nivelador/moldes/Pelicula.dart';

Future<List<Pelicula>> obtenerPeliculas(String tipo) async {
  try {
    Response respuesta = await Dio().get(
        "https://api.themoviedb.org/3/movie/$tipo?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es");

    Map generos = await obtenerGeneros();
    var datosObtenidos = respuesta.data['results'];
    var listaPeliculas = datosObtenidos
        .map(
            (datosJson) => Pelicula.armar(datos: datosJson, generosId: generos))
        .toList();

    return List<Pelicula>.from(listaPeliculas); //devuelve listdo de peliculas
  } catch (e) {
    return [];
  }
}

Future<Map> obtenerGeneros() async {
  try {
    Response respuesta = await Dio().get(
        "https://api.themoviedb.org/3/genre/movie/list?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es");

    Map mapa = Map.fromIterable(respuesta.data['genres'],
        key: (e) => e['id'],
        value: (e) => e[
            'name']); //crea un mapa a partir de una lista de mapas donde la key es el id y el value es el name
    return mapa;
  } catch (e) {
    return {};
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



hacer lista de extensiones


*/