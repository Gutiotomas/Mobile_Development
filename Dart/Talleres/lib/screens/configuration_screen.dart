import 'package:flutter/material.dart';
import 'package:intro/data/helper/shared_preferences_helper.dart';
import 'package:intro/screens/demo_screen_sfw.dart';

import 'demo_screen.dart';

class ConfigurationScreen extends StatefulWidget {
  static const String route = '/configuracion';

  const ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() {
    return _ConfigurationScreenState();
  }
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  final SharedPreferencesHelper sharedPreferencesHelper =
      SharedPreferencesHelper();
  final List<String> _containerNames = [
    "No Aplica",
    "Hola mundo",
    "Desarrollo móvil",
    "Oscar"
  ];
  String _currentContainerName = "No Aplica";

  @override
  void initState() {
    super.initState();
    getContainerName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuración')),
      body: Center(
        child: DropdownButton<String>(
          value: _currentContainerName,
          items: _containerNames.map((String name) {
            return DropdownMenuItem(
              value: name,
              child: Text(name),
            );
          }).toList(), // Fix: Properly convert to List
          onChanged: (newValue) async {
            setState(() {
              _currentContainerName = newValue!;
            });
            await changeContainerName();
          },
        ),
      ),
    );
  }

  Future changeContainerName() async {
    await sharedPreferencesHelper.setContainerName(_currentContainerName);
    //Navigator.pop(context);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => DemoScreenSfw()));
  }

  Future getContainerName() async {
    String name = await sharedPreferencesHelper.getContainerName();
    setState(() {
      _currentContainerName = name;
    });
  }
}
