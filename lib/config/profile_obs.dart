import 'package:get/get.dart';
import 'package:my_music/config/shared_preference.dart';

class ProfileObs extends GetxController {
  SharedPreferenceConfig shared = SharedPreferenceConfig();

  init() async {
    String? names = await shared.getName();
    String? photo = await shared.getPhotoUrl();
    String? email = await shared.getEmail();
    username.value = names ?? 'Pengguna';
    photoUrl.value = photo ?? '';
    emails.value = email ?? '';
  }

  var username = 'Pengguna'.obs;
  var photoUrl = ''.obs;
  var emails = ''.obs;
}
