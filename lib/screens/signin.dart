import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:larga_davsur/class/alert_dialog.dart';
import 'package:larga_davsur/screens/home/home_screen.dart';
import 'package:larga_davsur/screens/logout.dart';
import 'package:larga_davsur/screens/signup.dart';
import 'package:larga_davsur/utils/color_utils.dart';
import '../class/widgets.dart';
import '../class/variables.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.orange.shade200,
          Colors.orange.shade300,
          Colors.orange.shade500 //hexStringToColor("CB2B93"),
          //hexStringToColor("9546C4"),
          //hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(children: <Widget>[
            logoWidget("assets/images/logo.png"),
            reusableTextField("Username / Email", Icons.person_2_outlined,
                false, _usernameController),
            SizedBox(
              height: 20,
            ),
            reusableTextField(
                "Password", Icons.lock_outline, true, _passwordController),
            SizedBox(
              height: 20,
            ),
            signInUpButton(context, true, () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _usernameController.text,
                      password: _passwordController.text)
                  .then((value) {
                authsignin_status == true;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }).onError((error, stackTrace) {
                AlertDialogsOkOnly.OKdialog(
                    context, "Invalid credentials.", "Try Again");
                _passwordController.text = "";
              });
            }),
            SignUpOption(),
          ]),
        )),
      ),
    );
  }

  Row SignUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have any account? ",
            style: TextStyle(
                color: Colors.white70, fontFamily: 'Roboto-Regular.ttf')),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "Register here",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Regular.ttf'),
          ),
        )
      ],
    );
  }
}
