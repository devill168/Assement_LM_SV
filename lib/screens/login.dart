import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width >= 1 || MediaQuery.of(context).size.width <= 650) {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    else{
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight
      ]);
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xff71ADD5),Color(0xff2471A3)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Text("ក្រសួងសុខាភិបាល",style: TextStyle(color: Colors.white,fontSize: 27,fontFamily: KhmerFonts.moul,fontWeight: FontWeight.w500, package: "Khmer_fonts")),
              Divider(
                color: Colors.white,
                indent: MediaQuery.of(context).size.width * 0.13,
                endIndent: MediaQuery.of(context).size.width * 0.13,
              ),
              Text("ម.គ.ច",style: TextStyle(color: Colors.white,fontSize: 27,fontFamily: KhmerFonts.moul,fontWeight: FontWeight.w500, package: "Khmer_fonts")),
              Image.asset("assets/img/logo_cnm_128 x 128.png",fit: BoxFit.fill),
            ],
          ),
        ),
      ),
    );
  }
}
