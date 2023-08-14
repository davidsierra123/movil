import 'package:flutter/material.dart';
import 'package:sillascta/view/formulario.dart';

// ignore: camel_case_types
class M_Pagosss {
  final String title;
  final String imageUrl;

  M_Pagosss({required this.title, required this.imageUrl});
}

// ignore: camel_case_types
class M_Pagos extends StatefulWidget {
  const M_Pagos({super.key});

  @override
  State<M_Pagos> createState() => Metodos_Pago();
}

// ignore: camel_case_types
class Metodos_Pago extends State<M_Pagos> {
  // ignore: non_constant_identifier_names
  final List<M_Pagosss> M_Pagossss = [
    M_Pagosss(
      title: '',
      imageUrl: 'assets/images/logo.png',
    ),
    M_Pagosss(
      title: '',
      imageUrl: 'assets/images/daviplata.png',
    ),
    M_Pagosss(
      title: '',
      imageUrl: 'assets/images/c_entrega.png',
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
                'Metodos de pago',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Column(
                children: M_Pagossss.map((item) {
                  return M_PagosssWidget(item: item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class M_PagosssWidget extends StatelessWidget {
  final M_Pagosss item;

  const M_PagosssWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
              20), // Ajusta el radio de borde como prefieras
          child: Image.asset(
            item.imageUrl,
            height: 150,
            width: 290,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5), // Espacio entre imagen y título
        Text(item.title),
        const SizedBox(height: 5),
         // Espacio entre título y botón
        ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) =>
            //         const Formulario(), // Cambia 'Formulario' por el nombre de tu archivo.dart
            //   ),
            // );
          },
          child: const Text('¡Seleccionar!'),
        ),
        const SizedBox(height: 20), // Espacio entre elementos
      ],
    );
  }
}
