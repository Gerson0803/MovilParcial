import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class LightYearsAUScreen extends StatefulWidget {
  @override
  _LightYearsAUScreenState createState() => _LightYearsAUScreenState();
}

class _LightYearsAUScreenState extends State<LightYearsAUScreen> {
  double input = 0.0;
  double result = 0.0;
  bool isLYtoAU = true;
  final double auPerLY = 63241.1;

  void convert() {
    setState(() {
      result = isLYtoAU ? input * auPerLY : input / auPerLY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Años luz ↔ UA')),
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
              title: Text(isLYtoAU ? 'Años luz → UA' : 'UA → Años luz'),
              value: isLYtoAU,
              onChanged: (val) => setState(() => isLYtoAU = val),
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