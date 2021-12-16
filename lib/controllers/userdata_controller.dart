import 'package:get/state_manager.dart';

class UserDataController extends GetxController {
  String phone = '';
  String username = '';
  String bio = '';
  String name = '';
  String dp = '';

  void setPhone(String phoneNo) {
    phone = phoneNo;
  }

  void setUsername(String userName) {
    username = userName;
  }

  void setBio(String userBio) {
    bio = userBio;
  }

  void setName(String actualName) {
    name = actualName;
  }

  void setDpLink(String dpLink) {
    dp = dpLink;
  }
}
