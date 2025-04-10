import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController inputUsuario = TextEditingController();
  TextEditingController inputContrasena = TextEditingController();
  String comprobacion = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
        Text(comprobacion),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            controller: inputUsuario,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Introduzca su nombre de usuario',
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            controller: inputContrasena,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Introduzca su contraseña',
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                if(inputContrasena.text == "MarSaku07" && inputUsuario.text == "martinsakurai"){
                  comprobacion = "INGRESO CORRECTO";
                  }
                  else{
                  comprobacion = "EL NOMBRE DE USUARIO O LA CONTRASEÑA ES INCORRECTA";
                  }
              });
            },
            child: const Text('Ingresar'))
      ]),
    ));
  }
}
