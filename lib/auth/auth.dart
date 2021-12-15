import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task/views/home_page.dart';
import 'package:flutter_task/views/profile_setup.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _phoneController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  void loginUser(String phoneNo) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        print("user verified");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Scaffold(
              appBar: AppBar(title: const Text("Enter OTP")),
              body: OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width * 0.90,
                fieldWidth: 50,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) async {
                  String smsCode = pin;

                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: verificationId, smsCode: smsCode);

                  await auth.signInWithCredential(credential);
                  print("user verified via otp");

                    FirebaseFirestore.instance
                      .collection('users')
                      .where('phone', isEqualTo: phoneNo)
                      .get()
                      .then((QuerySnapshot<Map<String, dynamic>> doc) => {
                            //if (doc.docs.first.exists)
                            if (doc.docs.isEmpty)
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ProfilePage(),
                                    )),
                              }
                            else
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    )),
                              }
                          });
                },
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
    return Scaffold(
      appBar: AppBar(title: const Text("Login with OTP")),
      body: Center(
        child: Column(
          children: [
            Center(
              child: TextField(
                controller: _phoneController,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                loginUser(_phoneController.text);
              },
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}

