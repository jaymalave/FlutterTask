import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/edit_data_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:get/get.dart';

class UpdateDp extends StatefulWidget {
  const UpdateDp({Key? key}) : super(key: key);

  @override
  _UpdateDpState createState() => _UpdateDpState();
}

class _UpdateDpState extends State<UpdateDp> {
  final _updateDpController = TextEditingController();
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
                  controller: _updateDpController,
                  decoration: InputDecoration(
                    hintText: "Enter address of your profile picture",
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
              editdataController.editDp(_updateDpController.text);
              Navigator.pop(context);
              setState(() {});
            },
            child: const Text("Update Dp"),
          ),
        ],
      ),
    );
  }
}
