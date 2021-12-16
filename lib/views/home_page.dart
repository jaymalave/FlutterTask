import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/views/profile_view.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userDataController = Get.put(UserDataController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppPallete.bgColor,
        appBar: AppBar(
          title: const Text("Home Page"),
          automaticallyImplyLeading: false,
          backgroundColor: AppPallete.primary,
        ),
        body: Column(
          children: [
            const Center(child: Text('Hello world')),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileView(),
                  ),
                );
              },
              child: const Text(
                "View Profile Page",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
