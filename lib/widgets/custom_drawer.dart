import 'package:flutter/material.dart';
import '../screens/celsius_rankine_screen.dart';
import '../screens/lightyears_au_screen.dart';
import '../screens/velocidad_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '🌐 Conversores',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildDrawerItem(
                  context,
                  icon: Icons.thermostat_outlined,
                  title: 'Celsius ↔ Rankine',
                  destination: CelsiusRankineScreen(),
                ),
                Divider(),
                _buildDrawerItem(
                  context,
                  icon: Icons.travel_explore,
                  title: 'Años luz ↔ UA',
                  destination: LightYearsAUScreen(),
                ),
                Divider(),
                _buildDrawerItem(
                  context,
                  icon: Icons.speed,
                  title: 'Velocidad: km/h ↔ m/s',
                  destination: VelocidadScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon, required String title, required Widget destination}) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
      },
    );
  }
}
