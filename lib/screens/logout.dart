import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:larga_davsur/screens/signin.dart';
import '../class/variables.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text('Logout'),
        onPressed: () {
          authsignin_status = false;
          FirebaseAuth.instance.signOut().then((value) => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInScreen())));
        },
      )),
    );
  }
}
