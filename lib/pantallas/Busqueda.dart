import 'package:flutter/material.dart';

class Busqueda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Buscar una pelicula'),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.search),
            labelText: 'ingrese el titulo de la pelicula que desea buscar',
          ),
          autofocus: true,
          onEditingComplete: () => FocusScope.of(context)
              .unfocus(), //quita el teclado de la pantalla
        ),
        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            child: Text('resultados:'),
          ),
        ),
      ],
    );
  }
}
