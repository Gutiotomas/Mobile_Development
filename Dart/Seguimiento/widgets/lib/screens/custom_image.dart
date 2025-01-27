import 'package:flutter/material.dart';
import '../data_helper/shared_preferences_helper.dart';
import '../screens/config.dart';

class CustomImage extends StatefulWidget {
  const CustomImage({super.key});

  @override
  State<CustomImage> createState() {
    return _CustomImageState();
  }
}

class _CustomImageState extends State<CustomImage> {
  String _name = '';

  @override
  void initState() {
    super.initState();
    getContainerName();
  }

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
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => Config()));
            },
            style: ButtonStyle(),
            icon: const Icon(Icons.settings),
            iconSize: 40,
          ),
        ),
      ],
    );
  }

  Future getContainerName() async {
    final SharedPreferencesHelper sharedPreferencesHelper =
        SharedPreferencesHelper();
    String name = await sharedPreferencesHelper.getContainerName();
    setState(() {
      _name = name;
    });
  }
}
