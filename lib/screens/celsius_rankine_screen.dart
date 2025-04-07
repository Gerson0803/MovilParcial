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
      appBar: AppBar(title: Text('Conversor de Temperatura')),
      drawer: CustomDrawer(),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.thermostat_rounded, size: 100, color: Colors.orange),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Ingresa el valor',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.input),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (val) => input = double.tryParse(val) ?? 0.0,
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Celsius'),
                          Switch(
                            value: isCtoR,
                            onChanged: (val) => setState(() => isCtoR = val),
                          ),
                          Text('Rankine'),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: convert,
                        icon: Icon(Icons.sync_alt),
                        label: Text('Convertir'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Resultado:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        result.toStringAsFixed(2),
                        style: TextStyle(fontSize: 30, color: Colors.orange),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
