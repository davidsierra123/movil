import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String imageUrl;

  MenuItem({required this.title, required this.imageUrl});
}

class Compra extends StatefulWidget {
  const Compra({super.key});

  @override
  State<Compra> createState() => _CompraState();
}

class _CompraState extends State<Compra> {
  final List<MenuItem> menuItems = [
    MenuItem(
      title: '',
      imageUrl: 'assets/images/sillaga.png',
    ),
    MenuItem(
      title: '',
      imageUrl: 'assets/images/sillabo.png',
    ),
    MenuItem(
      title: '',
      imageUrl: 'assets/images/sillaco.png',
    ),
    // Agrega más elementos aquí
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Compra',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Column(
                children: menuItems.map((item) {
                  return MenuItemWidget(item: item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem item;

  const MenuItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          item.imageUrl,
          height: 150,
          width: 180,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 5), // Espacio entre imagen y título
        Text(item.title),
        const SizedBox(height: 5), // Espacio entre título y botón
        ElevatedButton(
          onPressed: () {
            // Acción al presionar el botón
          },
          child: const Text('¡Comprar!'),
        ),
        const SizedBox(height: 20), // Espacio entre elementos
      ],
    );
  }
}
