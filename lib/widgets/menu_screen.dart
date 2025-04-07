import 'package:conversores_flutter/screens/celsius_rankine_screen.dart';
import 'package:conversores_flutter/screens/lightyears_au_screen.dart';
import 'package:conversores_flutter/screens/velocidad_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menú')),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CelsiusRankineScreen()));
              },
              child: Container(
                color: const Color.fromARGB(255, 158, 187, 210),
                child: Center(
                  child: Text(
                    'Celsius ↔ Rankine',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LightYearsAUScreen()));
              },
              child: Container(
                color: const Color.fromARGB(255, 159, 244, 162),
                child: Center(
                  child: Text(
                    'Años luz ↔ UA',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VelocidadScreen()));
              },
              child: Container(
                color: const Color.fromARGB(255, 217, 170, 101),
                child: Center(
                  child: Text(
                    'Velocidad: km/h ↔ m/s',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
