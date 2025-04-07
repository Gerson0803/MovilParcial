import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class CelsiusRankineScreen extends StatefulWidget {
  @override
  _CelsiusRankineScreenState createState() => _CelsiusRankineScreenState();
}

class _CelsiusRankineScreenState extends State<CelsiusRankineScreen> {
  double input = 0.0;
  double result = 0.0;
  bool isCtoR = true;

  void convert() {
    setState(() {
      result = isCtoR
          ? (input + 273.15) * 9 / 5
          : (input - 491.67) * 5 / 9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Celsius ↔ Rankine')),
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
              title: Text(isCtoR ? 'Celsius → Rankine' : 'Rankine → Celsius'),
              value: isCtoR,
              onChanged: (val) => setState(() => isCtoR = val),
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