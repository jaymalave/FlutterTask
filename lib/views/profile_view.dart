import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/views/edit_profile.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String imageName = '/image_picker8062803527564014121.jpg';
  final userDataController = Get.put(UserDataController());
  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Center(
              child: Text(
            Constants.profileHead,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 30,
          ),
           Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(userDataController.dp),
              radius: 50,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Name:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(userDataController.name)),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Username:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(userDataController.username),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Bio:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(userDataController.bio),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
