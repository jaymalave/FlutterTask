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

  void setUserState(String sessionName, String sessionUsername,
      String sessionPhoneNo, String sessionBio, String sessionDp) {
    setName(sessionName);
    setUsername(sessionUsername);
    setPhone(sessionPhoneNo);
    setBio(sessionBio);
    setDpLink(sessionDp);
  }

  void setDetails(String detailsName, detailsBio, detailsDp) {
    setName(detailsName);
    setBio(detailsBio);
    setDpLink(detailsDp);
  }
}
