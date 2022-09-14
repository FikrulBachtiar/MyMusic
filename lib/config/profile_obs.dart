import 'package:get/get.dart';
import 'package:my_music/config/shared_preference.dart';

class ProfileObs extends GetxController {
  SharedPreferenceConfig shared = SharedPreferenceConfig();

  @override
  void onInit() {
    super.onInit();
    init();
    everAll([username, photoUrl, emails], (callback) {
      shared.setName(username.toString());
      shared.setPhotoUrl(photoUrl.toString());
      shared.setEmail(emails.toString());
    });
  }

  init() async {
    var names = await shared.getName();
    var photo = await shared.getPhotoUrl();
    var email = await shared.getEmail();
    username.value = names == '' ? 'Pengguna' : names;
    photoUrl.value = photo;
    emails.value = email;
  }

  var username = 'Pengguna'.obs;
  var emails = ''.obs;
  var photoUrl = ''.obs;
}
