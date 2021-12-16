import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditDataController {
  final userDataController = Get.put(UserDataController());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void editName(String newName) {
    userDataController.name = newName;
    users.doc(userDataController.username).update({'name': newName});
  }
  void editBio(String newBio) {
    userDataController.bio = newBio;
    users.doc(userDataController.username).update({'bio': newBio});
  }
  void editDp(String newDp) {
    userDataController.dp = newDp;
    users.doc(userDataController.username).update({'dp': newDp});
  }
}
