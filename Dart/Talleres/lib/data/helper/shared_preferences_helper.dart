import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final _containerNameKey = 'containerName';

  Future setContainerName(String containerName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_containerNameKey, containerName);
  }

  Future getContainerName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_containerNameKey) ?? "No Aplica";
  }
}
