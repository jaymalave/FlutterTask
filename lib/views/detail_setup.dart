import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:get/get.dart';

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
            backgroundColor: AppPallete.primary,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(Constants.formName),
              TextField(
                controller: _nameController,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(Constants.formBio),
              TextField(
                controller: _bioController,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(Constants.formProfile),
              TextField(
                controller: _dpController,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  users
                      .add({
                        'bio': _bioController.text,
                        'name': _nameController.text,
                        'dp': _dpController.text,
                        'phone': userDataController.phone,
                        'username': userDataController.username,
                        'userToken': userToken, // 42
                      })
                      .then((value) => {
                            print("User Added"),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                )),
                          })
                      .catchError((error) => print("Failed to add user: $error"));
                  userDataController.setBio(_bioController.text);
                  userDataController.setDpLink(_dpController.text);
                  userDataController.setName(_nameController.text);
                },
                child: const Text(Constants.register),
              )
            ],
          )),
    );
  }
}