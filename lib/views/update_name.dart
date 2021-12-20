import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/edit_data_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:get/get.dart';

class UpdateName extends StatefulWidget {
  const UpdateName({Key? key}) : super(key: key);

  @override
  _UpdateNameState createState() => _UpdateNameState();
}

class _UpdateNameState extends State<UpdateName> {
  final _updateNameController = TextEditingController();
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
                  controller: _updateNameController,
                  decoration: InputDecoration(
                    hintText: "e.g Shawn Mendes",
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
              editdataController.editName(_updateNameController.text);
              Navigator.pop(context);
              setState(() {});
            },
            child: const Text("Update name"),
          ),
        ],
      ),
    );
  }
}
