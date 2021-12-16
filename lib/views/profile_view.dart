import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/utils/constants.dart';
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Constants.profileHead),
          automaticallyImplyLeading: false,
          backgroundColor: AppPallete.primary,
          ),
        body: Column(
          children:  [
            const Center(child: Text(Constants.profileHead)),
            Center(child: Text(userDataController.name)),
            Center(child: Text(userDataController.bio)),
            Center(child: Text(userDataController.username)),
            Center(child: Image.network(userDataController.dp),),
          ],
        ),
      ),
    );
  }
}