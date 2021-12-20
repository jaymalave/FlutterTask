import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/edit_data_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:get/get.dart';

class UpdateBio extends StatefulWidget {
  const UpdateBio({Key? key}) : super(key: key);

  @override
  State<UpdateBio> createState() => _UpdateBioState();
}

class _UpdateBioState extends State<UpdateBio> {
  final _updateBioController = TextEditingController();

  final editdataController = Get.put(EditDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.bgColor,
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _updateBioController,
                  decoration: InputDecoration(
                    hintText: "",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 10,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              editdataController.editBio(_updateBioController.text);
              Navigator.pop(context);
              setState(() {});
            },
            child: const Text("Update Bio"),
          ),
        ],
      ),
    );
  }
}
