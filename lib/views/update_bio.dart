import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/edit_data_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:flutter_task/views/profile_view.dart';
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
      appBar: AppBar(title: const Text("Update bio"), centerTitle: true),
      backgroundColor: AppPallete.bgColor,
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: AppPallete.textLight,
                  ),
                  controller: _updateBioController,
                  decoration: InputDecoration(
                    hintText: "Enter bio here",
                    hintStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 20,
                        style: BorderStyle.solid,
                        color: AppPallete.textLight,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            child: const Text("Update Bio"),
          ),
        ],
      ),
    );
  }
}
