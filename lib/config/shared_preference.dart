import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceConfig {
  Future<void> resetProfile() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setString('accessToken', "");
    await shared.setString('username', "");
    await shared.setString('photo_url', "");
    await shared.setString('email', "");
  }

  Future<void> setAccessToken(String? value) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setString('accessToken', value ?? "");
    return;
  }

  Future<String> getAccessToken() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString('accessToken') ?? "";
  }

  Future<void> setName(String? value) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setString('username', value ?? "");
    return;
  }

  Future<String> getName() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString('username') ?? "Pengguna";
  }

  Future<void> setPhotoUrl(String? value) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setString('photo_url', value ?? "");
    return;
  }

  Future<String?> getPhotoUrl() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString('photo_url') ?? "";
  }

  Future<void> setEmail(String? value) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setString('email', value ?? "");
    return;
  }

  Future<String> getEmail() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString('email') ?? "Pengguna";
  }
}
