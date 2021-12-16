import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/edit_data_controller.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
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
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(userDataController.name),
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
                          ));
                },
                child: const Text("Edit name"),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(userDataController.bio),
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
                child: const Text("Edit bio"),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(userDataController.dp),
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
                child: const Text("Edit Dp"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
