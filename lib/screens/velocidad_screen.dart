import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class VelocidadScreen extends StatefulWidget {
  @override
  _VelocidadScreenState createState() => _VelocidadScreenState();
}

class _VelocidadScreenState extends State<VelocidadScreen> {
  double input = 0.0;
  double result = 0.0;
  bool isKmToMs = true;

  void convert() {
    setState(() {
      result = isKmToMs ? input / 3.6 : input * 3.6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Velocidad: km/h ↔ m/s')),
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Valor'),
              keyboardType: TextInputType.number,
              onChanged: (val) => input = double.tryParse(val) ?? 0.0,
            ),
            SwitchListTile(
              title: Text(isKmToMs ? 'km/h → m/s' : 'm/s → km/h'),
              value: isKmToMs,
              onChanged: (val) => setState(() => isKmToMs = val),
            ),
            ElevatedButton(
              onPressed: convert,
              child: Text('Convertir'),
            ),
            SizedBox(height: 20),
            Text('Resultado: $result'),
          ],
        ),
      ),
    );
  }
}