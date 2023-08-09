import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';


class HorizontalCarousel extends StatefulWidget {
  const HorizontalCarousel({super.key});

  @override
  State<HorizontalCarousel> createState() => _HorizontalCarouselState();
}

class _HorizontalCarouselState extends State<HorizontalCarousel> {
  final List<String> imageUrls = [
    'assets/images/tapi.png',
    'assets/images/sillasgra.png',
    'assets/images/sillaga.png',
  ];

  final List<String> titles = [
    'Tapiceria y mantenimiento',
    'Alquilar',
    'Comprar',
  ];

  final List<String> descriptions = [
    'Aqui podras realizar mantenimiento y Tapiceria a tus sillas o muebles.',
    'Podras Alquilar sillas para cualquier tipo de evento especial.',
    'Podras Comprar tus sillas de preferencia que te ofreceremos aqui.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider.builder(
          itemCount: imageUrls.length,
          options: CarouselOptions(
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            aspectRatio: 0.5,
            autoPlay: true,
          ),
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: () {
                // Navegar a la pantalla deseada según la imagen seleccionada
                if (index == 0) {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>  Alquiler(imageUrl: 'assets/images/sillatap.png',)),
                  // );
                }
              },
              child: Card(
                elevation: 19.0,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        imageUrls[index],
                        height: 420,
                        width: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Text(
                        descriptions[index],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80.0),
                        child: Text(
                          titles[index], // Título de la imagen
                          style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
} 