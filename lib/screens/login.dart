import 'package:assement_lm_sv/config/responsiveScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _validateEmail = false;
  bool _validatePassword = false;
  @override
  Widget build(BuildContext context) {

    if(MediaQuery.of(context).size.width >= 1 && MediaQuery.of(context).size.width <= 650) {
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
        body: ResponsiveScreen(
        mobile: customContainer(img: "assets/img/logo_cnm_128 x 128.png",sizeHeightBox: 0.6 , sizeWidthTextField: 0.75,marginTextField: 30, sizeSurffixIcon: 30),

        tablet: MediaQuery.of(context).orientation == Orientation.portrait ?  /*Portrait*/
        customContainer(img: "assets/img/logo_cnm_200 x 200.png",sizeHeightBox: 0.7, sizeWidthTextField: 0.55,sizeSurffixIcon: 35)

        : /*Landscape*/
        Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xff71ADD5),Color(0xff2471A3)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
          ),
          )
        ),
        ),
      ),
    );
  }

  Container customContainer({String img = "", required double sizeHeightBox, required double sizeWidthTextField, double marginTextField = 0, required double sizeSurffixIcon}) {
    return Container(
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff71ADD5),Color(0xff2471A3)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: ListView(
          children: [
           Column(
             children: [
               SizedBox(height: 30),
               Text("ក្រសួងសុខាភិបាល",style: TextStyle(color: Colors.white,fontSize: 27,fontFamily: KhmerFonts.moul,fontWeight: FontWeight.w500, package: "Khmer_fonts")),
               Divider(
                 color: Colors.white,
                 indent: MediaQuery.of(context).size.width * 0.13,
                 endIndent: MediaQuery.of(context).size.width * 0.13,
               ),
               Text("ម.គ.ច",style: TextStyle(color: Colors.white,fontSize: 27,fontFamily: KhmerFonts.moul,fontWeight: FontWeight.w500, package: "Khmer_fonts")),
               SizedBox(height: 10),
               Stack(
                 alignment: Alignment.center,
                 children: [
                   Container(
                     margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.08),
                     width: MediaQuery.of(context).size.width * 0.9,
                     height: MediaQuery.of(context).size.height * sizeHeightBox,
                     decoration: const BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.all(Radius.circular(30)),
                       boxShadow: [
                         BoxShadow(
                           offset: Offset(0.5, 0.5),
                           color: Color(0xff2471A3),
                           blurRadius: 2,
                           spreadRadius: 2,
                         ),
                       ],
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(20),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           SizedBox(height: marginTextField),
                           Container(
                            child: TextFormField(
                               decoration: InputDecoration(
                                 suffixIcon: Icon(Icons.email_outlined,color: Color(0xff2471A3),size: sizeSurffixIcon),
                                 border: OutlineInputBorder(
                                     borderSide: BorderSide(color: Color(0xff2471A3)),
                                     borderRadius: BorderRadius.circular(20)
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Color(0xff2471A3)),
                                   borderRadius: BorderRadius.circular(20)
                                 ),
                                 labelText: "Email",
                                 constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * sizeWidthTextField),
                                 errorText: _validateEmail? "Email cannot null" :null,
                               ),
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                             ),
                           ), /*Textbox Email*/
                           SizedBox(height: 30),
                           Container(
                             child: TextFormField(
                               obscureText: true,
                               decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Color(0xff2471A3),size: sizeSurffixIcon),
                                   border: OutlineInputBorder(
                                       borderSide: BorderSide(color: Color(0xff2471A3)),
                                       borderRadius: BorderRadius.circular(20)
                                   ),
                                   focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(color: Color(0xff2471A3)),
                                       borderRadius: BorderRadius.circular(20),
                                   ),
                                   labelText: "Password",
                                   constraints: BoxConstraints(
                                     maxWidth: MediaQuery.of(context).size.width * sizeWidthTextField,
                                   ),
                                 errorText: _validatePassword ? "Password cannot be null" : null,
                               ),
                               controller: _password,
                             ),
                           ), /*Textbox Password*/
                           SizedBox(height: 30),
                           Container(
                             width: MediaQuery.of(context).size.width * sizeWidthTextField,
                             child: FloatingActionButton(
                               child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 25)),
                               backgroundColor: Color(0xff2471A3),
                               onPressed: (){
                                 setState(() {
                                   if(_email.text == "")
                                     _validateEmail = true;
                                   else
                                     _validateEmail = false;

                                   if(_password.text == "")
                                     _validatePassword = true;
                                   else
                                     _validatePassword = false;
                                 });
                               },
                             ),
                           ), /*Button Login*/
                           SizedBox(height: 40),
                           Container(
                             child: TextButton(
                               onPressed: (){},
                                child: Text("No Account! Need Help?", style: TextStyle(color: Color(0xff2471A3),fontSize: 18)),
                             ),
                           ), /*Forgot Password*/
                         ],
                       ),
                     ),
                   ),
                   Positioned(
                       top: 10,
                       child: Image.asset(img,fit: BoxFit.fill)
                   ),
                 ],
               ),
             ],
           ),
          ],
        ),
      );
  }
}
