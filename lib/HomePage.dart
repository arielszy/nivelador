import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'MoviApp',
          style: TextStyle(color: Colors.grey[300]),
        ),
        backgroundColor: Colors.grey[600],
      ),
      body: tabBar(),
    );
  }
}

ir(context) {
  // return Navigator.push(context, MaterialPageRoute(builder: (context)=>Scaffold()));
}

tabBar() {
  return DefaultTabController(
    length: 2,
    child: TabBar(
      tabs: [
        Tab(text: 'hola',),
        Tab(text: 'chau',),
      ],
    ),
  );
}
