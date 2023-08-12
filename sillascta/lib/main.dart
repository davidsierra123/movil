import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'view/alquiler.dart';
import 'view/carrusel.dart';
import 'view/tapiceria.dart';
import 'view/compra.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              'assets/images/sillas.png',
              fit: BoxFit.cover,
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 185.0), // Agrega un padding izquierdo
                  child: Text(
                    'Comprar',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Bienvenido, Aqui podrás Tapizar Sillas',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 185.0),
                  child: Text(
                    'Alquilar',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 190, // Ajusta el valor para mover el botón hacia abajo
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(
                          appStore:
                              AppStore()), // Pasa la instancia de AppStore aquí
                    ),
                  );
                  // Aquí puedes colocar el código que se ejecutará cuando se presione el botón.
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 12), // Ajusta los valores según necesites
                  textStyle: const TextStyle(
                      fontSize: 18), // Ajusta el tamaño del texto
                ),
                child: const Text('¡Ingresar!'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// INICIO DE LA VISTA DEL MENU DESPLEGABLE PRINCIPAL (LAYAOT)

class Menu extends StatelessWidget {
  final AppStore
      appStore; // Agrega el campo para almacenar la instancia de AppStore

  const Menu(
      {super.key,
      required this.appStore}); // Modifica el constructor para recibir la instancia de AppStore

  @override
  Widget build(BuildContext context) {
    return DemoMWNavigationRailScreen1(
        appStore: appStore); // Pasa la instancia de AppStore aquí
  }
}

class DemoMWNavigationRailScreen1 extends StatefulWidget {
  const DemoMWNavigationRailScreen1({Key? key, required this.appStore})
      : super(key: key);

  final AppStore
      appStore; // Agrega el campo para almacenar la instancia de AppStore

  @override
  // ignore: library_private_types_in_public_api
  _DemoMWNavigationRailScreen1State createState() =>
      _DemoMWNavigationRailScreen1State();
}

class _DemoMWNavigationRailScreen1State
    extends State<DemoMWNavigationRailScreen1> {
  List<Widget> widgets = <Widget>[
    const Center(child: HorizontalCarousel()),
    const Center(child: Alquiler()),
    const Center(child: Tapiceria()),
    const Center(child: Compra()),
    const Center(
        child: Text("Schedule View",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    const Center(
        child: Text("Settings View",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
  ];

  int _selectedIndex = 0;
  String title = 'David';
  bool showHorizontalCarousel = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              extended: isExpanded,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                  showHorizontalCarousel = index == 0;
                });
              },
              leading: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        isExpanded
                            ? Icons.clear
                            : Icons
                                .menu, // Cambia los iconos según la expansión
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                    ),
                  ],
                ),
              ),
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Inicio', style: TextStyle(fontSize: 16)),
                  selectedIcon: Icon(Icons.home, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.store),
                  label: Text('Alquiler', style: TextStyle(fontSize: 16)),
                  selectedIcon: Icon(Icons.store, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.build),
                  label: Text('Tapiceria', style: TextStyle(fontSize: 16)),
                  selectedIcon: Icon(Icons.build, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.add_shopping_cart),
                  label: Text('Compra', style: TextStyle(fontSize: 16)),
                  selectedIcon:
                      Icon(Icons.add_shopping_cart, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.exit_to_app),
                  label: Text('Salir', style: TextStyle(fontSize: 16)),
                  selectedIcon: Icon(Icons.exit_to_app, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Settings', style: TextStyle(fontSize: 16)),
                  selectedIcon: Icon(Icons.settings, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
              ],
            ),
            const VerticalDivider(width: 0),
            Expanded(
              child: _selectedIndex == 0
                  ? const HorizontalCarousel() // Muestra HorizontalCarousel si _selectedIndex es 0
                  : _selectedIndex == 1
                      ? const Alquiler()
                      : _selectedIndex == 2
                          ? const Tapiceria()
                          : _selectedIndex == 3
                              ? const Compra()
                              : widgets[_selectedIndex],

              // : _selectedIndex == 2
              //     ? Compras()
              //     : SizedBox(), // Agrega más condiciones si tienes más pantallas
            )
          ],
        ),
      ),
    );
  }
}

class AppStore {
  Color? textPrimaryColor;
  Color? iconColorPrimaryDark;
  Color? scaffoldBackground;
  Color? backgroundColor;
  Color? backgroundSecondaryColor;
  Color? appColorPrimaryLightColor;
  Color? textSecondaryColor;
  Color? appBarColor;
  Color? iconColor;
  Color? iconSecondaryColor;
  Color? cardColor;

  AppStore() {
    textPrimaryColor = const Color(0xFF212121);
    iconColorPrimaryDark = const Color.fromARGB(255, 33, 33, 33);
    scaffoldBackground = const Color(0xFFEBF2F7);
    backgroundColor = Colors.black;
    backgroundSecondaryColor = const Color(0xFF131d25);
    appColorPrimaryLightColor = const Color(0xFFF9FAFF);
    textSecondaryColor = const Color(0xFF5A5C5E);
    appBarColor = Colors.white;
    iconColor = const Color.fromARGB(255, 0, 128, 255);
    iconSecondaryColor = const Color(0xFFA8ABAD);
    cardColor = const Color(0xFF191D36);
  }
}
