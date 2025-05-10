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
  //creo las variables que voy a utilizar a lo largo de todo mi codigo
  TextEditingController inputUsuario = TextEditingController();
  TextEditingController inputContrasena = TextEditingController();
  String comprobacion = '';
  bool mostrarContrasena = false; 
  String mensaje = ""; 
  Color colorFondo = Colors.green;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bienvenido a MECA-LOGIN"), // este es el titulo de mi login
              const SizedBox(height: 20),
              Text(comprobacion),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: inputUsuario, // este es el campo de texto para el nombre de usuario
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Introduzca su nombre de usuario', // dentro de este campo, para hacerlo mas lindo esteticamente se muestra un borde 
                  ),
                ),
              ),
              const SizedBox(height: 20), // dejo un espacio entre el campo de usuario y el de contraseña
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  obscureText: !mostrarContrasena, // si es true, se esconde la contraseña, es para decir si se quiere mostrar con puntitos o no
                  controller: inputContrasena,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Introduzca su contraseña',
                    suffixIcon: IconButton( // suffixicon es una propiedad del inputDecoration que permite poner el icono de un ojo al final del textifeld
                      icon: Icon( // aca estamos usando un "iconbutton", por lo que el icono puede ser presionado
                        mostrarContrasena // condición: si mostrar contraseña es...
                            ? Icons.visibility // SI MOSTRARCONTRASEÑA ES TRUE: aparece un ojo abierto
                            : Icons.visibility_off, // SI ES FALSE: aparece un ojo cerrado
                      ),
                      onPressed: () { // COMO ES UN BOTÓN, SE PONE EL ONPRESSED. INVIERTE EL ESTADO DE LA CONTRASEÑA CUANDO SE LO PRESIONA
                        setState(() {
                          mostrarContrasena = !mostrarContrasena; // SE INVIERTE EL VALOR DE MOSTRARCONTRASEÑA
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Builder( 
                builder: (context) => ElevatedButton( 
                  onPressed: () {
                    
                    if (inputUsuario.text.isEmpty || inputContrasena.text.isEmpty) { // si algun campo esta vacio...
                      mensaje = "⚠️ COMPLETE TODOS LOS CAMPOS"; // se muestra mensaje de advertencia
                      colorFondo = Colors.orange; // elijo el color naranja para el fondo del snackbar
                    } 
                    else if (inputUsuario.text == "martinsakurai" &&
                        inputContrasena.text == "MarSaku07") { // Si el usuario y la contraseña coinciden con los esperados...
                      mensaje = "✅ INGRESO CORRECTO"; //le informo al usuario que ha logrado ingresar con exito
                      colorFondo = Colors.green; // elijo el color verde para el fondo del snackbar
                    } else {
                      mensaje = "❌ USUARIO O CONTRASEÑA INCORRECTOS"; //en cualquier otro caso, le indico al usuario que ha ingresado algun campo incorrectamente
                      colorFondo = Colors.red; // elijo el color rojo para el fondo del snackbar
                    }


                    // MOSTRAMOS EL SNACKBAR CON MENSAJE TEMPORAL EN LA PARTE INFERIOR
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(mensaje),
                        backgroundColor: colorFondo,
                        duration: const Duration(seconds: 4), // el cartel desaparece después de 4 segundos
                      ),
                    );
                  },
                  child: const Text('Ingresar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
