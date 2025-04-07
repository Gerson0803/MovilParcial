import 'package:conversores_flutter/widgets/menu_screen.dart';
import 'package:flutter/material.dart';
import 'screens/celsius_rankine_screen.dart';
import 'screens/lightyears_au_screen.dart';
import 'screens/velocidad_screen.dart';
import 'widgets/custom_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversores Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(),
    );
  }
}