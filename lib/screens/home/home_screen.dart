import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../../class/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  final _textname = TextEditingController();
  final _textcontact = TextEditingController();
  final _textaddress = TextEditingController();
  final _textemail = TextEditingController();

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
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
        child: Container(
          height: 100,
          color: Color.fromARGB(100, 200, 200, 200),
          child: Row(
            children: [
              FlutterLogo(
                size: 50,
              ),
              const Text('Welcome to woolha.com',
                  style: const TextStyle(color: Colors.teal)),
              Icon(Icons.widgets),
            ],
          ),
        ),
      ),
    );
  }

  Future createUser({
    required String name,
    required String contact,
    required String address,
    String email = '',
  }) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final json = {
      'id': docUser.id,
      'name': name,
      'contact': contact,
      'address': address,
      'email': email,
      'timestamp': DateTime.now(),
    };

    //final json = user.toJson();

    await docUser.set(json);
  }
}
