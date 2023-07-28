  import 'package:flutter/material.dart';

  void main() {
    runApp(MyApp());
  }
  class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Inicio (),
    );
  }
}

  class Inicio extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Opacity(
                opacity: 0.7,
                child: Image.asset(
                  'assets/sillas.png',
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Comprar',
                      style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Bienvenido, Aqui podrás Tapizar tus Sillas',
                      style: TextStyle(color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      'Alquilar',
                      style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 330, // Ajusta el valor para mover el botón hacia abajo
                left: 0,
                right: 0,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Menu()),
                    );
                      // Aquí puedes colocar el código que se ejecutará cuando se presione el botón.
                    },
                    child: Text('Ingresar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }


class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Align(
                alignment: Alignment.center,
                child:Column(
                  mainAxisSize: MainAxisSize.min,
                  children:[
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Usuario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, size: 30,),
              title: Text('Inicio'),
              onTap: () {
                // Aquí puedes agregar la navegación a la pantalla de inicio
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.build, size: 30,),
              title: Text('Tapiceria'),
              onTap: () {
                // Aquí puedes agregar la navegación a la pantalla de arreglar
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.add_shopping_cart, size: 30,),
              title: Text('Comprar'),
              onTap: () {
                // Aquí puedes agregar la navegación a la pantalla de comprar
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.store, size: 30),
              title: Text('Alquiler'),
              onTap: () {
                // Aquí puedes agregar la navegación a la pantalla de alquiler
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, size: 30,),
              title: Text('Salir'),
              onTap: () {
                // Aquí puedes agregar la navegación a la pantalla de salir
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Contenido de la pantalla principal',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}