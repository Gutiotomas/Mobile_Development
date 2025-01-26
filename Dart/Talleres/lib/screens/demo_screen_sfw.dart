import 'package:flutter/material.dart';
import 'package:intro/screens/configuration_screen.dart';

import '../data/helper/shared_preferences_helper.dart';

class DemoScreenSfw extends StatefulWidget {
  static const String route = '/configuracion';

  const DemoScreenSfw({super.key});

  @override
  State<DemoScreenSfw> createState() {
    return _DemoScreenSfw();
  }
}

class _DemoScreenSfw extends State<DemoScreenSfw> {
  String _name = '';

  @override
  void initState() {
    super.initState();
    getContainerName();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                alignment: Alignment.center,
                color: Colors.lightBlue,
                transform: Matrix4.rotationZ(-0.01),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Container 1",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, decoration: TextDecoration.none),
                  ),
                ),
              )),
          Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Container(
                alignment: Alignment.center,
                color: Colors.greenAccent,
                transform: Matrix4.rotationZ(0.03),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    _name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, decoration: TextDecoration.none),
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                height: 200,
                color: Colors.yellow,
                transform: Matrix4.rotationZ(-0.03),
                child: SizedBox(
                    width: double.infinity,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ConfigurationScreen()));
                      },
                      style: ButtonStyle(),
                      icon: const Icon(Icons.ads_click),
                      iconSize: 80,
                    )),
              ))
        ],
      ),
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
