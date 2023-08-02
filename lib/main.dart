import 'package:flutter/material.dart';
import 'package:note_app/pages/note_form_page.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'utilities/user_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSharedPreferences.init();
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
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginPage',
      routes: {
        '/loginPage':(context) => const LoginPage(),
        '/homePage':(context) => const HomePage(),
        '/noteFormPage':(context) => const NoteFormPage(),
      },
    );
  }
}
