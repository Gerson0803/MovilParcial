import 'package:flutter/material.dart';
import '../screens/celsius_rankine_screen.dart';
import '../screens/lightyears_au_screen.dart';
import '../screens/velocidad_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menú de conversores', style: TextStyle(color: Colors.white, fontSize: 24)),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text('Celsius ↔ Rankine'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CelsiusRankineScreen()));
            },
          ),
          ListTile(
            title: Text('Años luz ↔ UA'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LightYearsAUScreen()));
            },
          ),
          ListTile(
            title: Text('Velocidad: km/h ↔ m/s'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => VelocidadScreen()));
            },
          ),
        ],
      ),
    );
  }
}