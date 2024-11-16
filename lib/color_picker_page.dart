import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color _pickedColor = Colors.white;

  void _colorPicker() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Pick a Color",
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _pickedColor,
              onColorChanged: (value) {
                setState(() {
                  _pickedColor = value;
                });
              },
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "OK",
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: _pickedColor,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SelectableText.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "Picked Color: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextSpan(
                  text: _pickedColor.toHexString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SelectableText.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "RGB: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextSpan(
                  text:
                      '(${_pickedColor.red}, ${_pickedColor.green}, ${_pickedColor.blue})',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: _colorPicker,
            child: const Text(
              'Color Picker',
            ),
          ),
        ],
      ),
    );
  }
}
