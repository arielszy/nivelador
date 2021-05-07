import 'package:flutter/material.dart';
import 'package:nivelador/providers/PeliculaProvider.dart';
import 'package:nivelador/providers/api.dart';
import 'package:nivelador/widgets/PeliculaWidget.dart';
import 'package:provider/provider.dart';

class Busqueda extends StatefulWidget {
  @override
  _BusquedaState createState() => _BusquedaState();
}

class _BusquedaState extends State<Busqueda> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<PeliculaProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: [
          Text('Buscar una pelicula'),
          TextField(
              onChanged: (String value) async {
                print(value);
                //await obtenerPeliculasPorBusqueda(value);
                pro.resultadoBusqueda =
                    await obtenerPeliculasPorBusqueda(value);
                //setState(() {});
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.search),
                labelText: 'ingrese el titulo de la pelicula que desea buscar',
              ),
              autofocus: true,
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
              } //quita el teclado de la pantalla
              ),
          Container(
            child: Text('resultados:'),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<PeliculaProvider>(
                builder: (context, value, child) =>
                    value.resultadoBusqueda.length != 0
                        ? value.resultadoBusqueda[0] == 0
                            ? Text('no se encontraron resultados')
                            : ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 25,
                                    ),
                                itemBuilder: (context, index) => PeliculaWidget(
                                      pelicula: value.resultadoBusqueda[index],
                                    ),
                                itemCount: value.resultadoBusqueda.length)
                        : Text('inicie la busqueda para ver los resultados')),
          ),
        ],
      ),
    );
  }
}
