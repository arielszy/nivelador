import 'package:flutter/material.dart';
import 'package:nivelador/providers/PeliculaProvider.dart';
import 'package:nivelador/widgets/PeliculaWidget.dart';
import 'package:provider/provider.dart';

class Favoritos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<PeliculaProvider>(
                    builder: (context, value, child) => ListView.separated(
                      //igual que builder pero con separacion entre items
                      separatorBuilder: (context, index) => SizedBox(
                        height: 25,
                      ),
                      itemBuilder: (context, index) => PeliculaWidget(
                        pelicula: value.peliculasfavoritas[index],
                      ),
                      itemCount: value.peliculasfavoritas.length,
                    ),
                  ),
    );
  }
}
