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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 75,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          Constants.formName,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'e.g John Doe',
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 10,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 75,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          Constants.formBio,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          minLines: 3,
                          maxLines: 5,
                          controller: _bioController,
                          decoration: InputDecoration(
                            hintText:
                                'e.g Software Developer, Guitarist, Books Enthusiast',
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 10,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 75,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          Constants.formProfile,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _dpController,
                          decoration: InputDecoration(
                            hintText: "Enter address of your profile picture",
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 10,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                              UserPreferences.setPhone(
                                  userDataController.phone),
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
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM),
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
