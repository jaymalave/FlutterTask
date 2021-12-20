import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/models/user_model.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/controllers/user_preferences.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUserController extends GetxController {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final userDataController = Get.put(UserDataController());
  void addUser(User user) {
    users.doc(user.username).set({
      'bio': user.bio,
      'name': user.name,
      'dp': user.dp,
      'phone': user.phone,
      'username': user.username,
      'userToken': user.token, // 42
    }).then((value) => {
          print("user added"),
          UserPreferences.setUsername(user.username),
          UserPreferences.setName(user.name),
          UserPreferences.setPhone(user.phone),
          UserPreferences.setDp(user.dp),
          UserPreferences.setBio(user.bio),
          userDataController.setDetails(user.name, user.bio, user.dp),
        });
  }
}
