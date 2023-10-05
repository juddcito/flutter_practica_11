

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPage extends StatefulWidget {
  const SharedPage({super.key});

  @override
  State<SharedPage> createState() => _SharedPageState();
}

class _SharedPageState extends State<SharedPage> {
  
  int _edad = 0;
  String _nombre = '';

  @override
  void initState() {
    _grabarDatos();
    super.initState();
  }

  void _grabarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('edad', 22);
    prefs.setString('nombre', 'Judd');
  }

  void _leerDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _edad = prefs.getInt('edad')!;
    _nombre = prefs.getString('nombre')!;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica 11'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: $_nombre'),
            const SizedBox(height: 15),
            Text('Edad: $_edad')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _leerDatos();
          });
        },
        tooltip: 'Refrescar',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}