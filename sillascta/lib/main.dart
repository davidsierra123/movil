import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(
                 '¡Hola, mundo!',
                 style: TextStyle(fontSize: 24.0),
               ),
               ElevatedButton(
                 onPressed: () {
                   // Aquí puedes colocar el código que se ejecutará cuando se presione el botón.
                   print('¡Botón presionado!');
                 },
                 child: Text('Ingresar'),
               ),
             ],
          ),
        ),
      ),
    );
  }
}