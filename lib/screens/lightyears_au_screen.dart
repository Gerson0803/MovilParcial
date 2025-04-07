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
      appBar: AppBar(title: Text('Conversor Espacial: Años luz ↔ UA')),
      drawer: CustomDrawer(),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.travel_explore, size: 100, color: Colors.deepPurple),
              SizedBox(height: 20),
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Ingresa el valor',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.tune),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (val) => input = double.tryParse(val) ?? 0.0,
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Años luz'),
                          Switch(
                            value: isLYtoAU,
                            onChanged: (val) => setState(() => isLYtoAU = val),
                          ),
                          Text('UA'),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: convert,
                        icon: Icon(Icons.swap_horiz),
                        label: Text('Convertir'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
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
                        style: TextStyle(fontSize: 30, color: Colors.deepPurple),
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
