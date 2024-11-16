import 'package:color_picker_app/color_picker_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Color Picker App",
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Color Picker App"),
        ),
        body: const ColorPickerPage(),
      ),
    );
  }
}
