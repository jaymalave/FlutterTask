import 'dart:io';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/edit_data_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

class UpdateDp extends StatefulWidget {
  const UpdateDp({Key? key}) : super(key: key);

  @override
  _UpdateDpState createState() => _UpdateDpState();
}

class _UpdateDpState extends State<UpdateDp> {
  final editdataController = Get.put(EditDataController());
  File? _imageFile = null;
  @override
  Widget build(BuildContext context) {
    var updatedDpUrl;
    
    final picker = ImagePicker();
    var url;
    Future pickImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        _imageFile = File(pickedFile!.path);
      });
    }

    Future uploadImageToFirebase(BuildContext context) async {
      String fileName = basename(_imageFile!.path);
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('uploads')
          .child('/$fileName');
      print(fileName);

      final metadata = firebase_storage.SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {'picked-file-path': fileName});
      firebase_storage.UploadTask uploadTask;
      //late StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
      uploadTask = ref.putFile(io.File(_imageFile!.path), metadata);

      firebase_storage.UploadTask task = await Future.value(uploadTask);
      var uploadT = await Future.value(uploadTask);
      var imageUrl = await uploadT.ref.getDownloadURL();
      setState(() {
        updatedDpUrl = imageUrl;
      });
      print(updatedDpUrl);
    }

    return Scaffold(
      backgroundColor: AppPallete.bgColor,
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: _imageFile != null
                  ? Image.file(_imageFile!)
                  : ElevatedButton(
                      child: const Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                        size: 50,
                      ),
                      onPressed: pickImage,
                    ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await uploadImageToFirebase(context);
              editdataController.editDp(updatedDpUrl);
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
