import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/sillas.png',
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Comprar',
                    style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Bienvenido, Aqui podrás Tapizar tus Sillas',
                    style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold ),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    'Alquilar',
                    style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold ),
                    textAlign: TextAlign.end,
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
          ],
        ),
      ),
    );
  }
}
