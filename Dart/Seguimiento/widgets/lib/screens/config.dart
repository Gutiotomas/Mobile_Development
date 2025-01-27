import 'package:flutter/material.dart';
import '../data/helper/shared_preferences_helper.dart';
import 'custom_image.dart';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  final SharedPreferencesHelper sharedPreferencesHelper =
      SharedPreferencesHelper();
  final List<String> _containerNames = ["Unal Colombia", "Escudo Unal", "Unal"];
  final List<String> _imageNames = ["unal_1.png", "unal_2.png", "unal_3.png"];
  String _currentContainerName = "Unal Colombia";

  @override
  void initState() {
    super.initState();
    _loadCurrentImageName();
  }

  Future<void> _loadCurrentImageName() async {
    String? imageName = await sharedPreferencesHelper.getImageName();
    int index = _imageNames.indexOf(imageName);
    if (index != -1) {
      setState(() {
        _currentContainerName = _containerNames[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
        centerTitle: true,
      ),
      body: Center(
        child: DropdownButton<String>(
          value: _currentContainerName,
          items: _containerNames.map((String name) {
            return DropdownMenuItem(
              value: name,
              child: Text(name),
            );
          }).toList(),
          onChanged: (newValue) async {
            setState(() {
              _currentContainerName = newValue!;
            });
            int index = _containerNames.indexOf(_currentContainerName);
            await sharedPreferencesHelper.setImageName(_imageNames[index]);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => CustomImage()));
          },
        ),
      ),
    );
  }
}
