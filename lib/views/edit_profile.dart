import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/edit_data_controller.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final userDataController = Get.put(UserDataController());
  final editdataController = Get.put(EditDataController());
  final _updateNameController = TextEditingController();
  final _updateBioController = TextEditingController();
  final _updateDpController = TextEditingController();
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
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Scaffold(
                              body: Column(
                                children: [
                                  TextField(
                                    controller: _updateDpController,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      editdataController
                                          .editDp(_updateDpController.text);
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: const Text("Update Dp"),
                                  ),
                                ],
                              ),
                            ));
                  },
                  child: const Icon(
                    Icons.edit,
                  ),
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
                Card(
                  elevation: 0,
                  color: AppPallete.bgColor,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Name:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                // Text(userDataController.name),
                Card(
                  color: AppPallete.bgColor,
                  shadowColor: Colors.black,
                  elevation: 5,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          userDataController.name,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Scaffold(
                        body: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextField(
                                controller: _updateNameController,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                editdataController
                                    .editName(_updateNameController.text);
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: const Text("Update name"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.edit,
                  ),
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
              Card(
                color: AppPallete.bgColor,
                elevation: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Bio:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Card(
                color: AppPallete.bgColor,
                shadowColor: Colors.black,
                elevation: 5,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        userDataController.bio,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Scaffold(
                            body: Column(
                              children: [
                                TextField(
                                  controller: _updateBioController,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    editdataController
                                        .editBio(_updateBioController.text);
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  child: const Text("Update Bio"),
                                ),
                              ],
                            ),
                          ));
                },
                child: const Icon(
                  Icons.edit,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
