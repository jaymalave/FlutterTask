import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/edit_data_controller.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/views/update_bio.dart';
import 'package:flutter_task/views/update_dp.dart';
import 'package:flutter_task/views/update_name.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final userDataController = Get.put(UserDataController());
  final double circleRadius = 120.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: double.infinity,
        color: AppPallete.bgColor,
        child: Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: circleRadius / 2.0,
                  ),

                  ///here we create space for the circle avatar to get ut of the box
                  child: Container(
                    height: 700.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: AppPallete.bgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8.0,
                          offset: Offset(0.0, 5.0),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: circleRadius / 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  userDataController.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 34.0),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      primary: AppPallete.bgColor),
                                  child: const Icon(
                                    Icons.edit,
                                    color: AppPallete.textLight,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => const UpdateName(),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32.0),
                              child: SizedBox(
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        const Text(
                                          'Username',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            userDataController.username,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 20.0, fontFamily: ''),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        const Text(
                                          "Phone",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            userDataController.phone,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 20.0, fontFamily: ''),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Bio',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                    primary:
                                                        AppPallete.bgColor),
                                                child: const Icon(
                                                  Icons.edit,
                                                  color: AppPallete.textLight,
                                                ),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        const UpdateBio(),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            userDataController.bio,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: '',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ),

                ///Image Avatar
                Container(
                  width: circleRadius,
                  height: circleRadius,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 1.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(userDataController.dp),
                            radius: 50,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              primary: AppPallete.bgColor),
                          child: const Icon(
                            Icons.edit,
                            color: AppPallete.textDark,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const UpdateDp(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}


              // OutlinedButton(
              //   style: OutlinedButton.styleFrom(primary: AppPallete.bgColor),
              //   child: const Icon(
              //     Icons.edit,
              //     color: AppPallete.textLight,
              //   ),
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (context) => const UpdateBio(),
              //     );
              //   },
              // ),
