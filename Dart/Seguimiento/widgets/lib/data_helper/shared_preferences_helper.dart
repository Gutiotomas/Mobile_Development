import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final _imageNameKey = "imageName";

  Future<void> setImageName(String imageName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imageNameKey, imageName);
  }

  Future<String> getImageName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_imageNameKey) ?? "unal_1.png";
  }
}
