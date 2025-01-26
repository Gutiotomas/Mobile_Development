import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Hola, soy Tomás Gutiérrez.",
            style: TextStyle(color: Colors.orange),
          ),
          Text(
            "Tengo 23 años",
            style: TextStyle(color: Colors.orange),
          ),
          Text(
            "y mi correo es: tgutierrez@unal.edu.co",
            style: TextStyle(color: Colors.orange),
          ),
        ],
      ),
    );
  }
}
