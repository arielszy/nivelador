import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ListadoProvider extends ChangeNotifier {
  var _listaGeneros = {};

  get listado => _listaGeneros;

  generarListado(Map listado) {
    _listaGeneros = listado;
    notifyListeners();
  }

  Future obtenerGeneros() async {
    try {
      Response respuesta = await Dio().get(
          "https://api.themoviedb.org/3/genre/movie/list?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es");

      Map mapa = Map.fromIterable(respuesta.data['genres'],
          key: (e) => e['id'],
          value: (e) => e[
              'name']); //crea un mapa a partir de una lista de mapas donde la key es el id y el value es el name
      generarListado(mapa);
    } catch (e) {
      return 'error';
    }
  }

  ListadoProvider.init() {
    obtenerGeneros();
  }
}
