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
  bool showHidePassword = true;
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
        mobile: customContainer(img: "assets/img/logo_cnm_128 x 128.png",sizeHeightBox: 0.6 , sizeWidthTextField: 0.75,marginTextField: 30, sizeSurffixIcon: 27),

        tablet: MediaQuery.of(context).orientation == Orientation.portrait ?  /*Portrait*/
        customContainer(img: "assets/img/logo_cnm_200 x 200.png",sizeHeightBox: 0.7, sizeWidthTextField: 0.55,sizeSurffixIcon: 30)

        : /*Landscape*/
        Container(
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xff71ADD5),Color(0xff2471A3)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
          ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  height: MediaQuery.of(context).size.height * 0.85,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(200),bottomRight: Radius.circular(200)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff2471A3),
                        offset: Offset(0.5,0.5),
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const Text("ក្រសួងសុខាភិបាល",style: TextStyle(color: Color(0xff2471A3),fontSize: 30,fontFamily: KhmerFonts.moul,fontWeight: FontWeight.w500, package: "Khmer_fonts")),
                      Divider(
                        color: Color(0xff2471A3),
                        indent: MediaQuery.of(context).size.width * 0.12,
                        endIndent: MediaQuery.of(context).size.width * 0.12,
                      ),
                     const Text("ម.គ.ច",style: TextStyle(color: Color(0xff2471A3),fontSize: 30,fontFamily: KhmerFonts.moul,fontWeight: FontWeight.w500, package: "Khmer_fonts")),
                      const SizedBox(height: 30),
                       Image.asset("assets/img/logo_cnm_200 x 200.png",fit: BoxFit.fill)
                    ],
                  ),
                ),

                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.442,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            /*decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),*/
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.3),
                                suffixIcon: Icon(Icons.email_outlined,color: Colors.white,size: 30),
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.white)
                                ),
                                errorText: _validateEmail ? "Email cannot be null" : null,
                              ),
                              controller: _email,
                            ),
                          ), /*TextField Email*/
                          SizedBox(height: 30),
                          Container(
                            /*decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),*/
                            child: TextFormField(
                              obscureText: showHidePassword,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                suffixIcon: clickShowHidePassword(sizeIcon: 30,color: 0xffffffff),
                                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.3),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                errorText: _validatePassword ? "Password cannot be null" : null,
                              ),
                              controller: _password,
                            ),
                          ), /*TextField Password*/
                          SizedBox(height: 30),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            /*decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),*/
                            child: FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    validationLogin();
                                  });
                                },
                                backgroundColor: Color(0xff71ADD5),
                                child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 25),)
                            ),
                          ), /*Button Login*/
                          SizedBox(height: 40),
                          Container(
                            child: TextButton(
                              onPressed: (){},
                              child: Text("No Account! Need Help?",style: TextStyle(color: Colors.white,fontSize: 18)),
                            ),
                          ), /*Forgot Password*/
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

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
                                   borderRadius: BorderRadius.circular(20),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Color(0xff2471A3)),
                                   borderRadius: BorderRadius.circular(20),
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Color(0xff2471A3)),
                                   borderRadius: BorderRadius.circular(20)
                                 ),
                                 labelText: "Email",
                                 labelStyle: const TextStyle(color: Color(0xff2471A3)),
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
                               obscureText: showHidePassword,
                               decoration: InputDecoration(
                                  suffixIcon: clickShowHidePassword(sizeIcon: sizeSurffixIcon,color: 0xff2471A3),
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(20),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Color(0xff2471A3)),
                                   borderRadius: BorderRadius.circular(20),
                                 ),
                                   focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(color: Color(0xff2471A3)),
                                       borderRadius: BorderRadius.circular(20),
                                   ),
                                   labelText: "Password",
                                   labelStyle: const TextStyle(color: Color(0xff2471A3)),
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
                                   validationLogin();
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

  validationLogin(){
    if(_email.text == "")
      _validateEmail = true;
    else
      _validateEmail = false;

    if(_password.text == "")
      _validatePassword = true;
    else
      _validatePassword = false;
  }

  Widget clickShowHidePassword({required double sizeIcon, required int color}){
    return IconButton(
        onPressed: (){
          setState(() {
            showHidePassword = !showHidePassword;
          });
        },
        icon: showHidePassword ? Icon(Icons.visibility,size: sizeIcon) : Icon(Icons.visibility_off,size: sizeIcon),
        color: Color(color),
    );
  }
}
