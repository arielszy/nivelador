import 'package:dio/dio.dart';
import 'package:nivelador/Pelicula.dart';

Future<List<Pelicula>> obtenerPeliculas(String tipo) async {
  try {
    Response respuesta = await Dio().get(
        "https://api.themoviedb.org/3/movie/$tipo?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es");

    final datosObtenidos = respuesta.data['results'];
    var lista =
        datosObtenidos.map((datosJson) => Pelicula.armar(datosJson)).toList();

    return List<Pelicula>.from(lista);
  } catch (e) {
    return [];
  }
}

Future<List< Generos >> obtenerGeneros() async {
  try {
    Response respuesta = await Dio().get(
        "https://api.themoviedb.org/3/genre/movie/list?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es");

    final datosObtenidos = respuesta.data['genres'];
    var lista =
        datosObtenidos.map((datosJson) => Generos.armar(datosJson)).toList();

    return List< Generos >.from(lista);
  } catch (e) {
    return [];
  }
}
