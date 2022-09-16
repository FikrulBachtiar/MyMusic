import 'package:get/get.dart';
import 'package:my_music/config/shared_preference.dart';

class ProfileObs extends GetxController {
  SharedPreferenceConfig shared = SharedPreferenceConfig();

  @override
  void onInit() {
    everAll([username, photoUrl, emails], (callback) {
      shared.setName(username.value);
      shared.setPhotoUrl(photoUrl.value);
      shared.setEmail(emails.value);
    });
    super.onInit();
    init();
  }

  init() async {
    String? names = await shared.getName();
    String? photo = await shared.getPhotoUrl();
    String? email = await shared.getEmail();
    username.value = names == '' ? 'Pengguna' : names;
    photoUrl.value = "";
    emails.value = email;
  }

  var username = 'Pengguna'.obs;
  var emails = ''.obs;
  var photoUrl = ''.obs;
}
