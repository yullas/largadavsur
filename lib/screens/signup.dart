import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:larga_davsur/class/widgets.dart';
import 'package:larga_davsur/screens/logout.dart';
import 'package:path/path.dart';

import '../class/alert_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

Future<String> getDeviceId() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Theme.of(Context as BuildContext).platform == TargetPlatform.iOS) {
    IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // Returns the device ID for iOS
  } else {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // Returns the device ID for Android
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  TextEditingController _usernameTC = TextEditingController();
  TextEditingController _emailTC = TextEditingController();
  TextEditingController _passwordTC = TextEditingController();
  TextEditingController _repasswordTC = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Registration",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.orange.shade200,
          Colors.orange.shade300,
          Colors.orange.shade500
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            reusableTextField(
                "Username", Icons.person_2_outlined, false, _usernameTC),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Email", Icons.mail, false, _emailTC),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Password", Icons.lock, true, _passwordTC),
            const SizedBox(
              height: 20,
            ),
            reusableTextField(
                "Re-type Password", Icons.lock, true, _repasswordTC),
            const SizedBox(
              height: 20,
            ),
            signInUpButton(context, false, () {
              if (_passwordTC.text == _repasswordTC.text) {
                AlertDialogsOkOnly.OKdialog(context, "Proceeding.", "");
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailTC.text, password: _passwordTC.text)
                    .then((value) => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogoutScreen()))
                        });
              } else {
                AlertDialogsOkOnly.OKdialog(
                    context, "Invalid credentials.", "Try Again");
              }
            })
          ]),
        )),
      ),
    );
  }
}
