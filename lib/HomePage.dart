import 'package:flutter/material.dart';

Widget homePage() {
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
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
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
