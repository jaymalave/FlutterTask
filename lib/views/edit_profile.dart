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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            Constants.editProfileHead,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(userDataController.dp),
                    radius: 50,
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(primary: AppPallete.bgColor),
                  child: const Icon(
                    Icons.edit,
                    color: AppPallete.textLight,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const UpdateDp(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Name:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // Text(userDataController.name),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        userDataController.name,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                OutlinedButton(
                  style: OutlinedButton.styleFrom(primary: AppPallete.bgColor),
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
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Bio:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      userDataController.bio,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(primary: AppPallete.bgColor),
                child: const Icon(
                  Icons.edit,
                  color: AppPallete.textLight,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const UpdateBio(),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
