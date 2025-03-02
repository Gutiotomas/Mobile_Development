import 'package:flutter/material.dart';
import '../data/helper/shared_preferences_helper.dart';
import '../screens/config.dart';

class CustomImage extends StatefulWidget {
  const CustomImage({super.key});

  @override
  State<CustomImage> createState() {
    return _CustomImageState();
  }
}

class _CustomImageState extends State<CustomImage> {
  String _imageName = 'unal_1.png';

  @override
  void initState() {
    super.initState();
    getImageName();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/$_imageName', fit: BoxFit.cover),
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

  Future getImageName() async {
    final SharedPreferencesHelper sharedPreferencesHelper =
        SharedPreferencesHelper();
    String imageName = await sharedPreferencesHelper.getImageName();
    setState(() {
      _imageName = imageName;
    });
  }
}
