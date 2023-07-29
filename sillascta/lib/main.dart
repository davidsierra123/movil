import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Inicio(),
    );
  }
}

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold),
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
                    MaterialPageRoute(
                      builder: (context) => Menu(appStore: AppStore()), // Pasa la instancia de AppStore aquí
                    ),
                  );
                  // Aquí puedes colocar el código que se ejecutará cuando se presione el botón.
                },
                child: Text('Ingresar'),
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
  final AppStore appStore; // Agrega el campo para almacenar la instancia de AppStore

  Menu({required this.appStore}); // Modifica el constructor para recibir la instancia de AppStore

  @override
  Widget build(BuildContext context) {
    return DemoMWNavigationRailScreen1(appStore: appStore); // Pasa la instancia de AppStore aquí
  }
}

class DemoMWNavigationRailScreen1 extends StatefulWidget {
  const DemoMWNavigationRailScreen1({Key? key, required this.appStore}) : super(key: key);

  final AppStore appStore; // Agrega el campo para almacenar la instancia de AppStore

  @override
  _DemoMWNavigationRailScreen1State createState() =>
      _DemoMWNavigationRailScreen1State();
}

class _DemoMWNavigationRailScreen1State
    extends State<DemoMWNavigationRailScreen1> {
  List<Widget> widgets = <Widget>[
    Center(
        child: Text("Home View",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(
        child: Text("Profile View",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(
        child: Text("Notifications View",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(
        child: Text("Stats View",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(
        child: Text("Schedule View",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(
        child: Text("Settings View",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
  ];

  int _selectedIndex = 0;
  String title = 'David';
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
                });
              },
              trailing: Container(
                padding: EdgeInsets.only(top: 64),
                child: IconButton(
                  icon: Icon(
                      isExpanded
                          ? Icons.arrow_back_ios_rounded
                          : Icons.arrow_forward_ios,
                      color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
              ),
              leading: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.account_circle,
                        size: 50, color: widget.appStore.iconColor), // Usa widget.appStore aquí
                    isExpanded
                        ? Text('Usuario', style: TextStyle(fontSize: 20))
                        : Container(),
                    isExpanded
                        ? Text('Admin', style: TextStyle(fontSize: 14))
                        : Container(),
                  ],
                ),
              ),
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Inicio', style: TextStyle(fontSize: 16)),
                  selectedIcon: Icon(Icons.home, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.store),
                  label: Text('Alquiler', style: TextStyle(fontSize: 16)),
                  selectedIcon:
                      Icon(Icons.store, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.build),
                  label: Text('Tapiceria', style: TextStyle(fontSize: 16)),
                  selectedIcon:
                      Icon(Icons.build, color: Colors.blue),
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
            VerticalDivider(width: 0),
            Expanded(
              child: widgets[_selectedIndex],
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
    textPrimaryColor = Color(0xFF212121);
    iconColorPrimaryDark = Color.fromARGB(255, 33, 33, 33);
    scaffoldBackground = Color(0xFFEBF2F7);
    backgroundColor = Colors.black;
    backgroundSecondaryColor = Color(0xFF131d25);
    appColorPrimaryLightColor = Color(0xFFF9FAFF);
    textSecondaryColor = Color(0xFF5A5C5E);
    appBarColor = Colors.white;
    iconColor = Color.fromARGB(255, 0, 128, 255);
    iconSecondaryColor = Color(0xFFA8ABAD);
    cardColor = Color(0xFF191D36);
  }
}
