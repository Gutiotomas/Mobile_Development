import 'package:flutter/material.dart';

class CustomImage extends StatefulWidget {
  const CustomImage({super.key});

  @override
  State<CustomImage> createState() {
    return _CustomImageState();
  }
}

class _CustomImageState extends State<CustomImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/unal_1.png', fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Icon(
            Icons.settings,
            size: 30,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
