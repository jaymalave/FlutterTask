import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/utils/user_preferences.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class DetailSetup extends StatefulWidget {
  const DetailSetup({Key? key}) : super(key: key);

  @override
  _DetailSetupState createState() => _DetailSetupState();
}

class _DetailSetupState extends State<DetailSetup> {
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _dpController = TextEditingController();
  final userDataController = Get.put(UserDataController());
  var userToken;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    super.initState();
    var messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) => {userToken = value});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(Constants.profileSetup),
            backgroundColor: AppPallete.color[900],
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(Constants.formName),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _nameController,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(Constants.formBio),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _bioController,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(Constants.formProfile),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _dpController,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    users
                        .doc(userDataController.username)
                        .set({
                          'bio': _bioController.text,
                          'name': _nameController.text,
                          'dp': _dpController.text,
                          'phone': userDataController.phone,
                          'username': userDataController.username,
                          'userToken': userToken, // 42
                        })
                        .then((value) => {
                              Toast.show(Constants.userAdded, context,
                                  duration: Toast.LENGTH_LONG,
                                  gravity: Toast.BOTTOM),
                              UserPreferences.setUsername(
                                  userDataController.username),
                              UserPreferences.setName(_nameController.text),
                              UserPreferences.setPhone(userDataController.phone),
                              UserPreferences.setDp(_dpController.text),
                              UserPreferences.setBio(_bioController.text),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              ),
                            })
                        .catchError(
                          (error) => Toast.show(Constants.userNotAdded, context,
                              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM),
                        );
          
                    userDataController.setDetails(_nameController.text,
                        _bioController.text, _dpController.text);
                  },
                  child: const Text(Constants.register),
                )
              ],
            ),
          )),
    );
  }
}
