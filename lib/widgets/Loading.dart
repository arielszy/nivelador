import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'imagenes/icon.png',
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text('Cargando app...'),
            SizedBox(
              height: 20,
            ),
            Text('Por favor espere'),
          ],
        ),
      ),
    );
  }
}
