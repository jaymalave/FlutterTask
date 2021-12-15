import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/views/detail_setup.dart';
import 'package:flutter_task/views/home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _usernameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile setup"),
          
          ),
        body: Column(
          children: [
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DetailSetup(),
                                    )),
                              }
                            else
                              {
                                print("username is taken!"),
                              }
                          });
                },
                child: const Text("Register")),
          ],
        ));
  }
}
