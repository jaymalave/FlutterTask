import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/views/home_page.dart';

class DetailSetup extends StatefulWidget {
  const DetailSetup({Key? key}) : super(key: key);

  @override
  _DetailSetupState createState() => _DetailSetupState();
}

class _DetailSetupState extends State<DetailSetup> {
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _dpController = TextEditingController();
  final _usernameController = TextEditingController();
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
    return Scaffold(
        appBar: AppBar(title: const Text("Complete setup")),
        body: Column(
          children: [
            const Text("Phone no"),
            TextField(
              controller: _phoneController,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Name"),
            TextField(
              controller: _nameController,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Bio"),
            TextField(
              controller: _bioController,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("profile picture URL"),
            TextField(
              controller: _dpController,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("username"),
            TextField(
              controller: _usernameController,
            ),
            ElevatedButton(
              onPressed: () {
                users
                    .add({
                      'bio': _bioController.text,
                      'name': _nameController.text,
                      'dp': _dpController.text,
                      'phone': _phoneController.text,
                      'username': _usernameController.text,
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
              },
              child: const Text("Sign up"),
            )
          ],
        ));
  }
}
