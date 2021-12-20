import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';
import 'package:flutter_task/utils/colors.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:flutter_task/views/profile_setup.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_buttons/glassmorphism_buttons.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _phoneController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  final userDataController = Get.put(UserDataController());

  void loginUser(String phoneNo) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Toast.show("Enter a valid phone number", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                backgroundColor: AppPallete.bgColor,
                appBar: AppBar(
                  title: const Text(Constants.enterOtp),
                  backgroundColor: AppPallete.color[900],
                ),
                body: SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: OTPTextField(
                    length: 6,
                    fieldWidth: 50,
                    style: const TextStyle(fontSize: 17),
                    textFieldAlignment: MainAxisAlignment.spaceEvenly,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) async {
                      String smsCode = pin;

                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationId, smsCode: smsCode);

                      await auth.signInWithCredential(credential);
                      userDataController.setPhone(phoneNo);
                      Map<String, dynamic> data;
                      FirebaseFirestore.instance
                          .collection('users')
                          .where('phone', isEqualTo: phoneNo)
                          .get()
                          .then(
                            (QuerySnapshot<Map<String, dynamic>> doc) => {
                              if (doc.docs.isEmpty)
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfilePage(),
                                      )),
                                }
                              else
                                {
                                  data = doc.docs.first.data(),
                                  userDataController.setUserState(
                                    data['name'],
                                    data['username'],
                                    data['phone'],
                                    data['bio'],
                                    data['dp'],
                                  ),
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  ),
                                }
                            },
                          );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppPallete.bgColor,
        appBar: AppBar(
          title: const Text(Constants.loginWithOtp),
          automaticallyImplyLeading: false,
          backgroundColor: AppPallete.color[900],
        ),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(Constants.enterNumber),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Center(
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GlassyButton(
                    title: "Done",
                    onTap: () {
                      String userPhone = '+91' + _phoneController.text;
                      loginUser(userPhone);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
