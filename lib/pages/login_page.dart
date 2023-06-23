import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerPin = TextEditingController();
  bool isPinExist = false;
  String? _pin;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Note',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}