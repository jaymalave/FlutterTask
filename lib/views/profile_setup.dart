import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/views/detail_setup.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _usernameController = TextEditingController();
  final userDataController = Get.put(UserDataController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppPallete.bgColor,
        appBar: AppBar(
          title: const Text(Constants.profileSetup),
          backgroundColor: AppPallete.color[900],
        ),
        body: Column(
          children: [
            const Center(
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Enter the username",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                height: 100,
                width: 300,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'e.g my_username1',
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
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('users')
                      .where('username', isEqualTo: _usernameController.text)
                      .get()
                      .then((QuerySnapshot<Map<String, dynamic>> doc) => {
                            //if (doc.docs.first.exists)
                            if (doc.docs.isEmpty)
                              {
                                userDataController
                                    .setUsername(_usernameController.text),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DetailSetup(),
                                  ),
                                ),
                              }
                            else
                              {
                                print(Constants.usernameTaken),
                                Toast.show("Username already exists!", context,
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.BOTTOM),
                              }
                          });
                },
                child: const Text(Constants.checkIfAvailable)),
          ],
        ),
      ),
    );
  }
}
