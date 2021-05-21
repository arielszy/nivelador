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
        "http://api.themoviedb.org/3/genre/movie/list?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es");

    Map mapa = Map.fromIterable(respuesta.data['genres'],
        key: (e) => e['id'],
        value: (e) => e[
            'name']); //crea un mapa a partir de una lista de mapas donde la key es el id y el value es el name
    return mapa;
  } catch (e) {
    return {};
  }
}

Future obtenerActores(String id) async {
  try {
    Response respuesta = await Dio().get(
        "https://api.themoviedb.org/3/movie/$id/credits?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es");

    var cast = respuesta.data['cast']
        .map((datosJson) => datosJson['original_name'])
        .toList();

    var result = cast.map((val) => val.trim()).join(', ');

    return result;
  } catch (e) {
    return {};
  }
}

Future<List> obtenerPeliculasPorBusqueda(String textoABuscar) async {
  List listaPeliculas;
  if (textoABuscar != '') {
    try {
      Response respuesta = await Dio().get(
          "https://api.themoviedb.org/3/search/movie?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&query=$textoABuscar&language=es");

      Map generos = await obtenerGeneros();
      List datosObtenidos = respuesta.data['results'];
      String cantidadResultados = respuesta.data['total_results'].toString();
      // List cantidadPaginas = [respuesta.data['total_pages']];

      cantidadResultados != '0'
          ? listaPeliculas = datosObtenidos
              .map((datosJson) =>
                  Pelicula.armar(datos: datosJson, generosId: generos))
              .toList()
          : listaPeliculas = [0];
      return List.from(listaPeliculas); //devuelve listdo de peliculas
    } catch (e) {
      print(e);
      listaPeliculas = [0];
      return listaPeliculas;
    }
  } else {
    listaPeliculas = [];
    return listaPeliculas;
  }
}

/*documentacion:
https://www.themoviedb.org/documentation/api
https://developers.themoviedb.org/3/movies
https://developers.themoviedb.org/3/movies/get-movie-details
https://developers.themoviedb.org/3/movies/get-top-rated-movies
https://www.themoviedb.org/talk/51ef18b5760ee3182d125573
https://www.themoviedb.org/documentation/api/discover
imagenes: https://www.themoviedb.org/t/p/w600_and_h900_bestv2
creditos: https://api.themoviedb.org/3/movie/550/credits?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es



hacer lista de extensiones


*/