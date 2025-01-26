import 'package:flutter/material.dart';

//import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:intro/screens/configuration_screen.dart';
import 'package:intro/screens/demo_screen.dart';
import 'package:intro/screens/demo_screen_sfw.dart';
import 'package:intro/screens/image_screen.dart';

void main() {
  //setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const DemoScreenSfw(),
      routes: <String, WidgetBuilder>{
        ConfigurationScreen.route: (context) => ConfigurationScreen(),
      },
    );
  }
}
