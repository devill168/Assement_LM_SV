import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width >= 650 || MediaQuery.of(context).size.width <= 1800) {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(child: Text("Login Form",style: TextStyle(color: Colors.white,fontSize: 50),)),
    );
  }
}
