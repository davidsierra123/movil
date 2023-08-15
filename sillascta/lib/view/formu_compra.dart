import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nb_utils/nb_utils.dart';
// ignore: unused_import
import 'package:sillascta/view/alquiler.dart';
import 'package:sillascta/view/m_pagos.dart'; // Importa el paquete carousel_slider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Formu_Compra(),
    );
  }
}

// ignore: camel_case_types
class Formu_Compra extends StatefulWidget {
  static String tag = '/DemoMWTextFormFieldScreen';

  const Formu_Compra({super.key});

  @override
  Formulario_Compra createState() => Formulario_Compra();
}

// ignore: camel_case_types
class Formulario_Compra extends State<Formu_Compra> {
  var formKey = GlobalKey<FormState>();
  var autoValidate = false;

  bool validateNumbersAndDots(String input) {
    final regex = RegExp(r'^[0-9.]+$');
    return regex.hasMatch(input);
  }

  // ignore: non_constant_identifier_names
  List<String> CantidadOptions = [
    'Seleccionar',
    '10 sillas',
    '50 sillas',
    '100 sillas',
    '1000 sillas'
  ];
  String selectedCantidad = 'Seleccionar';

  // ignore: non_constant_identifier_names
  // List<String> TiempoOptions = ['Seleccionar', '1 Hr', '5 Hrs', '10 Hrs'];
  // String selectedTiempo = 'Seleccionar';

  var usernameCont = TextEditingController();
  var emailCont = TextEditingController();
  var phoneCont = TextEditingController();
  var addressCont = TextEditingController();
  // ignore: non_constant_identifier_names
  var CedulaCont = TextEditingController();
  // ignore: non_constant_identifier_names
  var ExpeCont = TextEditingController();

  var usernameFocus = FocusNode();
  var emailFocus = FocusNode();
  var phoneFocus = FocusNode();
  var addressFocus = FocusNode();
  // ignore: non_constant_identifier_names
  var CedulaFocus = FocusNode();
  // ignore: non_constant_identifier_names
  var ExpeFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors
            .transparent, // Cambia el color del Container según tus necesidades
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  const Text(
                    'Formulario de Compra',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: usernameCont,
                    focusNode: usernameFocus,
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'Nombre y Apellido',
                      labelStyle: const TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    validator: (s) {
                      if (s!.trim().isEmpty) {
                        return 'Nombre y Apellido son requeridos';
                      }
                      if (!s.trim().isAlpha()) {
                        return 'Nombre o Apellido no es valido';
                      }
                      return null;
                    },
                  ),
                  // ESTE ES EL DISEÑO Y INPUT DE EL IMAIL
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: CedulaCont,
                    style: const TextStyle(fontSize: 16),
                    focusNode: CedulaFocus,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.credit_card,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'Num.Identificacion',
                      labelStyle: const TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    validator: (s) {
                      if (s!.trim().isEmpty) {
                        return 'Num.Identificacion es requerido';
                      }
                      if (!validateNumbersAndDots(s)) {
                        return 'Su Num.Identificacion no es valido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailCont,
                    style: const TextStyle(fontSize: 16),
                    focusNode: emailFocus,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'Correo electronico',
                      labelStyle: const TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'el correo es requerido';
                      if (!s.trim().validateEmail()) {
                        return 'Su correo no es valido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: addressCont,
                    focusNode: addressFocus,
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'Dirección',
                      labelStyle: const TextStyle(fontSize: 16),
                      alignLabelWithHint: true,
                    ),
                    maxLines: 1,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'La direccion es requerida';
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedCantidad,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCantidad = newValue!;
                      });
                    },
                    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                    items: CantidadOptions.map((Color) {
                      return DropdownMenuItem<String>(
                        value: Color,
                        child: Text(Color),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'Cantidad de sillas',
                      labelStyle: const TextStyle(fontSize: 16),
                    ),
                    validator: (value) {
                      if (value == null || value == 'Seleccionar') {
                        return 'Selecciona una Cantidad'; // Mensaje de error si no se ha seleccionado un estado válido
                      }
                      return null; // Sin errores
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: ExpeCont,
                    style: const TextStyle(fontSize: 16),
                    focusNode: ExpeFocus,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.create,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'Expecificaciones',
                      labelStyle: const TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    validator: (s) {
                      if (s!.trim().isEmpty) {
                        return 'Las expecificaciones son requeridas';
                      }
                      return null;
                    },
                  ),
                  Theme(
                    data: ThemeData.light(),
                    child: MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Datos registrados'),
                                content: const Text(
                                    'Sus datos han sido registrados correctamente.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Cerrar el AlertDialog
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const M_Pagos()), // Cambia 'OtraPantalla' por el nombre de tu archivo.dart
                                      );
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          autoValidate = true;
                        }

                        setState(() {});
                      },
                      child:
                          Text('¡Enviar!', style: boldTextStyle(color: white)),
                    ),
                  ).paddingTop(15)
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

AppStore appStore = AppStore();

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
    iconColorPrimaryDark = const Color(0xFF212121);
    scaffoldBackground = const Color(0xFFEBF2F7);
    backgroundColor = Colors.black;
    backgroundSecondaryColor = const Color(0xFF131d25);
    appColorPrimaryLightColor = const Color(0xFFF9FAFF);
    textSecondaryColor = const Color(0xFF5A5C5E);
    appBarColor = Colors.white;
    iconColor = const Color(0xFF212121);
    iconSecondaryColor = const Color(0xFFA8ABAD);
    cardColor = const Color(0xFF191D36);
  }
}
