import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({ Key? key }) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final userDataController = Get.put(UserDataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        automaticallyImplyLeading: false,
        ),
      body: Column(
        children:  [
          const Center(child: Text('Profile Page')),
          Center(child: Text(userDataController.name)),
          Center(child: Text(userDataController.bio)),
          Center(child: Text(userDataController.username)),
          Center(child: Image.network(userDataController.dp),),
        ],
      ),
    );
  }
}