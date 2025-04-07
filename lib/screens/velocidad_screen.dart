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
      appBar: AppBar(title: Text('Conversor de Velocidad')),
      drawer: CustomDrawer(),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.speed, size: 100, color: Colors.blue),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                          Text('km/h'),
                          Switch(
                            value: isKmToMs,
                            onChanged: (val) => setState(() => isKmToMs = val),
                          ),
                          Text('m/s'),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: convert,
                        icon: Icon(Icons.sync),
                        label: Text('Convertir'),
                        style: ElevatedButton.styleFrom(
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
                        style: TextStyle(fontSize: 32, color: Colors.blueAccent),
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
