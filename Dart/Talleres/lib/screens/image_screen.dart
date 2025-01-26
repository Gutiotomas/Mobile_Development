import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          'assets/unal.jpeg',
          fit: BoxFit.cover,
        )),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Saludo Universidad",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        )
      ],
    );
  }
}
