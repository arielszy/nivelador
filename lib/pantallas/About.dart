import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => launch('http://wa.me/5491134374096'),
                child: Text('contacto por whatsapp')),
            ElevatedButton(
                onPressed: () => launch('malto:arielszy@yahoo.com.ar'),
                child: Text('contacto por mail')),
          ],
        ),
      ),
    );
  }
}
