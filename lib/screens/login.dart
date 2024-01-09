import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: Colors.lightGreen[200],
            padding: constraints.maxWidth < 500
                ? EdgeInsets.zero
                : const EdgeInsets.all(30.0),
            child: Center(
                child: Container(
              padding: const EdgeInsets.all(20),
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: const TextField(
                        decoration: InputDecoration(
                            labelText: "Username",
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder())),
                    ),
                    ElevatedButton(
                        child: const Text("Log in",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {})
                  ]),
            )));
      }));
}
