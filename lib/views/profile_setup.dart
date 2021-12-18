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
        appBar: AppBar(
          title: const Text(Constants.profileSetup),
          backgroundColor: AppPallete.color[900],
        ),
        body: Column(
          children: [
           const Center(
              child: SizedBox(
                child: Text("Enter the userrname"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _usernameController,
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
                                Toast.show("Username already exists!", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM),
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
