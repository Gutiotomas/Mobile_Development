import 'package:flutter/material.dart';
import '../data_helper/shared_preferences_helper.dart';
import '../screens/custom_image.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() {
    return _ConfigState();
  }
}

class _ConfigState extends State<Config> {
  final SharedPreferencesHelper sharedPreferencesHelper =
      SharedPreferencesHelper();
  final List<String> _containerNames = [
    "Unal Colombia",
    "Escudo Unal",
    "Unal"
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
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => CustomImage()));
  }

  Future getContainerName() async {
    String name = await sharedPreferencesHelper.getContainerName();
    setState(() {
      _currentContainerName = name;
    });
  }
}
