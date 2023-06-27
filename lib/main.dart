import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'utilities/user_shared_preferences.dart';

void main() async {
  await UserSharedPreferences.init;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
