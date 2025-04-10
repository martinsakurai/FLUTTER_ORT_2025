import 'package:flutter/material.dart';

String texto = "MECA"; // Inicialmente vacío
double tamanoTexto = 24;
Color colorTexto = Colors.black;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
MainAppState createState() { return MainAppState(); }
}

class MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(texto, style: TextStyle(fontSize: tamanoTexto, color: colorTexto)),
              const SizedBox(height: 20),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ElevatedButton(onPressed: () {setState(() {texto = "MECA";});},child: const Text("SHOW"),),
                      const SizedBox(height: 10),
                      ElevatedButton(onPressed: () {setState(() {tamanoTexto = tamanoTexto + 5;});},child: const Text("+"),),
                      const SizedBox(height: 10),
                      ElevatedButton(onPressed: () {setState(() {colorTexto = Colors.blue;});},child: const Text("AZUL"),),
                      const SizedBox(height: 10),
                      ElevatedButton(onPressed: () {setState(() {if(texto == texto.toUpperCase()){texto = texto.toLowerCase();}else{texto = texto.toUpperCase();}});},child: const Text("MAY-MIN"),), 
                    ]
                    
                  ),

                  const SizedBox(width: 10),

                  Column(
                    children: [
                      ElevatedButton(onPressed: () {setState(() {texto = "";});},child: const Text("DELETE"),),
                      const SizedBox(height: 10),
                      ElevatedButton(onPressed: () {setState(() {tamanoTexto = tamanoTexto - 5;});},child: const Text("-"),),
                      const SizedBox(height: 10),
                      ElevatedButton(onPressed: () {setState(() {colorTexto = Colors.red;});},child: const Text("ROJO"),),
                      const SizedBox(height: 10),
                      ElevatedButton(onPressed: () {setState(() {colorTexto = Colors.black; tamanoTexto = 24;});},child: const Text("REINICIAR"),), 
                    ],
                  )
                ],
              )
            ],

    
              )
            ,
          )
        
          ),
        );
  }
}