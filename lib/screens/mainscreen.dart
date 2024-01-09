import 'package:flutter/material.dart';
import 'package:larga_davsur/screens/ride/firstform.dart';
import 'package:path/path.dart';

import '../class/alert_dialog.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  String myString = 'Hello, Flutter!';

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.orange.shade200,
          Colors.orange.shade300,
          Colors.orange.shade500
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              myString,
              style: const TextStyle(
                fontSize: 35, // Set the font size
                fontWeight: FontWeight.bold, // Set the font weight
                fontStyle: FontStyle.italic, // Set the font style
                color: Colors.blue, // Set the text color
                letterSpacing: 1.5, // Set the letter spacing
                shadows: [
                  Shadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    blurRadius: 3,
                  ),
                ],
                // Additional styling options...
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ride_firstform()));
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(350, 50)),
                shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                elevation: MaterialStateProperty.all(10),
              ),
              child: const Text(
                'I need a ride',
                style: TextStyle(
                  fontSize: 20, // Set the font size
                  fontWeight: FontWeight.bold, // Set the font weight
                  color: Colors.white, // Set the text color
                  letterSpacing: 1.5, // Set the letter spacing
                  // Additional styling options...
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                PersonSS(name: 'name', age: 21);
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(350, 50)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                elevation: MaterialStateProperty.all(10),
              ),
              child: const Text(
                "Buy me something",
                style: TextStyle(
                  fontSize: 20, // Set the font size
                  fontWeight: FontWeight.bold, // Set the font weight
                  color: Colors.white, // Set the text color
                  letterSpacing: 1.5, // Set the letter spacing
                  // Additional styling options...
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                PersonSS(name: 'name', age: 21);
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(350, 50)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                elevation: MaterialStateProperty.all(10),
              ),
              child: const Text(
                "Do some errands for me",
                style: TextStyle(
                  fontSize: 20, // Set the font size
                  fontWeight: FontWeight.bold, // Set the font weight
                  color: Colors.white, // Set the text color
                  letterSpacing: 1.5, // Set the letter spacing
                  // Additional styling options...
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonSS {
  String name;
  int age;

  PersonSS({required this.name, required this.age});

  void sayHello() {
    AlertDialogsOkOnly.OKdialog(Context as BuildContext, "Proceeding.", "1231");
  }
}
