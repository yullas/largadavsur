import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationScreen extends StatelessWidget {
  final controller = TextEditingController();

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: TextField(controller: controller),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                final name = controller.text;

                createUser(name: name);
              },
            )
          ],
        ),
      );

  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');

    final json = {
      'name': name,
    };

    //final json = user.toJson();

    await docUser.set(json);
  }
}

class User {
  String id;
  String name;
  int age;
  DateTime birthday;

  User({
    this.id = '',
    this.name = '',
    this.age = 21,
    required this.birthday,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'birthday': birthday,
      };
}
