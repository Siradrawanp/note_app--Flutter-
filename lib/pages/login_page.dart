import 'package:flutter/material.dart';
import '../utilities/user_shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPin = TextEditingController();
  bool isPinExist = false;
  bool _obscureText = true;
  String? _pin;

  @override
  void initState() {
    String? pin = UserSharedPreferences.getPin();
    if (pin != null) {
      setState(() {
        isPinExist = true;
        _pin = pin;
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controllerPin.dispose();
    _controllerUsername.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80,),
              Text(
                'Note',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                'Collections',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                  fontWeight: FontWeight.w300,
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 40,),
              TextFormField(
                controller: _controllerUsername,
                cursorColor: Colors.white,
                style: const TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'tidak boleh kosong';
                  return null;
                },
              ),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _controllerPin,
                cursorColor: Colors.white,
                obscureText: _obscureText,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'PIN',
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  suffixIcon: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: const Icon(Icons.visibility),
                  )
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'tidak boleh kosong';
                  return null;
                },
              ),
              const SizedBox(height: 24,),
              ElevatedButton(
                onPressed: () async {
                  await UserSharedPreferences.setName(
                    name: _controllerUsername.text, 
                    pin: _controllerPin.text,
                  );
                  Navigator.of(context).pushNamed('/homePage');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
                ), 
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}