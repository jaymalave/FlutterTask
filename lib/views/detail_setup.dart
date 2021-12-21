import 'dart:io' as io;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/controllers/add_user_controller.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/models/user_model.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

class DetailSetup extends StatefulWidget {
  const DetailSetup({Key? key}) : super(key: key);

  @override
  _DetailSetupState createState() => _DetailSetupState();
}

class _DetailSetupState extends State<DetailSetup> {
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _dpController = TextEditingController();
  final userDataController = Get.put(UserDataController());
  final addDataController = Get.put(AddUserController());
  var userToken;
  var dpUrl;
  File? _imageFile = null;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    super.initState();
    var messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) => {userToken = value});
  }

  @override
  Widget build(BuildContext context) {
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
        dpUrl = imageUrl;
      });
      print(dpUrl);
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: AppPallete.bgColor,
          appBar: AppBar(
            title: const Text(Constants.profileSetup),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 75,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          Constants.formName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          style: const TextStyle(color: AppPallete.textLight),
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                                fontSize: 15.0, color: Colors.white),
                            hintText: 'e.g John Doe',
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
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 75,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          Constants.formBio,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          style: const TextStyle(color: AppPallete.textLight),
                          minLines: null,
                          maxLines: 5,
                          controller: _bioController,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                                fontSize: 15.0, color: Colors.white),
                            hintText:
                                'e.g Software Developer, Guitarist, Books Enthusiast',
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
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SizedBox(
                      width: 75,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          Constants.formProfile,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 5,
                  color: AppPallete.bgColor,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: _imageFile != null
                        ? SizedBox(child: Image.file(_imageFile!))
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppPallete.bgColor),
                            child: const Icon(Icons.camera_alt_rounded),
                            onPressed: pickImage,
                          ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await uploadImageToFirebase(context);
                    User userObj = User(
                      username: userDataController.username,
                      name: _nameController.text,
                      dp: dpUrl,
                      bio: _bioController.text,
                      phone: userDataController.phone,
                      token: userToken,
                    );
                    addDataController.addUser(userObj);
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('phone', userObj.phone);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text(Constants.register),
                )
              ],
            ),
          )),
    );
  }
}
