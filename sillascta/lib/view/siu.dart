import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _getImageFromGallery() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _getImageFromCamera() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image and Inputs')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Agregamos un padding alrededor de los elementos
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Input 1 (Disabled)',
                  enabled: false,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Input 2 (Disabled)',
                  enabled: false,
                ),
              ),
              const SizedBox(height: 16),
              _image != null
                  ? Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _getImageFromGallery,
                child: const Text('Pick Image from Gallery'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _getImageFromCamera,
                child: const Text('Take a Photo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
