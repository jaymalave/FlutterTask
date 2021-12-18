import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/views/edit_profile.dart';
import 'package:flutter_task/views/home.dart';
import 'package:flutter_task/views/profile_setup.dart';
import 'package:flutter_task/views/profile_view.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userDataController = Get.put(UserDataController());
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const Home(),
      const EditProfile(),
      const ProfileView(),
    ];
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: FlashyTabBar(
          backgroundColor: AppPallete.color[900],
          selectedIndex: _currentIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: const Icon(
                Icons.home_filled,
                color: AppPallete.textLight,
              ),
              title: const Text(Constants.home,
                  style: TextStyle(color: AppPallete.textLight)),
            ),
            FlashyTabBarItem(
              icon: const Icon(
                Icons.edit_outlined,
                color: AppPallete.textLight,
              ),
              title: const Text(Constants.editProfile,
                  style: TextStyle(color: AppPallete.textLight)),
            ),
            FlashyTabBarItem(
              icon: const Icon(
                Icons.account_circle,
                color: AppPallete.textLight,
              ),
              title: const Text(
                Constants.profile,
                style: TextStyle(color: AppPallete.textLight),
              ),
            ),
          ],
        ),
        body: tabs[_currentIndex],
        appBar: AppBar(
          centerTitle: true,
          title: const Text(Constants.appHead),
          automaticallyImplyLeading: false,
        ),
      ),
    );
  }
}
