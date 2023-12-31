import 'package:flutter/material.dart';
import 'package:sillascta/view/Formu_Tapi.dart';


class MenuItem {
  final String title;
  final String imageUrl;

  MenuItem({required this.title, required this.imageUrl});
}

class Tapiceria extends StatefulWidget {
  const Tapiceria({super.key});

  @override
  State<Tapiceria> createState() => _TapiceriaState();
}

class _TapiceriaState extends State<Tapiceria> {
  final List<MenuItem> menuItems = [
    MenuItem(
      title: '',
      imageUrl: 'assets/images/sillaga.png',
    ),
    MenuItem(
      title: '',
      imageUrl: 'assets/images/sillaco.png',
    ),
    MenuItem(
      title: '',
      imageUrl: 'assets/images/sillavi.png',
    ),
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
              const SizedBox(height: 10),
              const Text(
                'Tapiceria',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const Formu_Tapi(), // Cambia 'Formulario' por el nombre de tu archivo.dart
              ),
            );
            // Acción al presionar el botón
          },
          child: const Text('¡Elegir!'),
        ),
        const SizedBox(height: 20), // Espacio entre elementos
      ],
    );
  }
}
