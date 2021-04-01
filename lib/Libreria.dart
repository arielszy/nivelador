import 'package:flutter/material.dart';

Widget tabBar() {
  return Column(
    children: [
      DefaultTabController(
        length: 2,
        child: TabBar(
          tabs: [
            Tab(
              child: Text(
                'Mas populares',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Mas vistas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget cuerpoPantallaPrincipal() {
  return Column(
    children: [
      tabBar(),
      tabBarContent(),
    ],
  );
}

Widget tabBarContent() {
  return Container(
    margin: EdgeInsets.all(20),
    padding: EdgeInsets.all(20),
    child: TabBarView(
      children: [
        Text('bar 1'), //esto muestra la respuesta de la api mas populares
        Text('bar 2'), //esto muestra la respuesta de la api mas vistas
      ],
    ),
  );
}

Widget tabBarDemo() {
  return DefaultTabController(
    length: 2,
    child: Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(height: 50),
          child: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Mas populares',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Mas vistas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: TabBarView(children: [
              Text("Home Body"),
              Text("Articles Body"),
            ]),
          ),
        )
      ],
    ),
  );
}
