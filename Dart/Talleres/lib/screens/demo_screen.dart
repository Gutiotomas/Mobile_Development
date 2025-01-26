import 'package:flutter/material.dart';
import 'package:intro/screens/configuration_screen.dart';

import '../data/helper/shared_preferences_helper.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

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
                    "Container 2",
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
                        Navigator.of(context).push(MaterialPageRoute(
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
  }
}
