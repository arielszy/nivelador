import 'package:flutter/material.dart';
import 'package:nivelador/api.dart';

class ListadoProvider with ChangeNotifier {
  ListadoProvider.generos() {
    final listaGeneros = obtenerGeneros();
  }
}
