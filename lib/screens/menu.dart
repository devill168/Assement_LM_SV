
import 'package:assement_lm_sv/config/responsiveScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

final advencedDrawerController = AdvancedDrawerController();
class _MenuState extends State<Menu> {
  bool isOpenDrawer = true;
  bool responsiveSizeScreenTablet = true;
  bool isActiveCambodia = false;
  bool isActiveEngland = false;
  bool isActiveSummary = false;
  bool isActiveNotification = false;
  bool isActiveAbout = false;
  bool isActiveContact = false;
  bool isActiveLogout = false;
  bool orientationScreen = true;
  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width >= 1 && MediaQuery.of(context).size.width <= 650){
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]);

      responsiveSizeScreenTablet = false;
    }
    else{
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight
      ]);

      if(MediaQuery.of(context).orientation == Orientation.portrait)
        orientationScreen = true;
      else
        orientationScreen = false;

      responsiveSizeScreenTablet = true;
    }
    return AdvancedDrawer(
        controller: advencedDrawerController,
        backdropColor: const Color(0xff71ADD5).withOpacity(0.9),
        animationCurve: Curves.easeInOut,
        openRatio: responsiveSizeScreenTablet? orientationScreen? 0.65 : 0.4 : 0.75,
        openScale: responsiveSizeScreenTablet? orientationScreen? 0.90 :1 : 0.85,
        childDecoration: BoxDecoration(
        borderRadius: orientationScreen? BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20)) : null),
        animationDuration: const Duration(milliseconds: 300),
        drawer: ResponsiveScreen(
            mobile: customContainerDrawer(sizeWidthDrawer: 20,sizeHightDrawer: 10, sizeHightDivider: 0.05, nameLogo: "assets/img/logo_cnm_128 x 128.png"),

            tablet: orientationScreen
                ? /*Drawer Portrait*/
            customContainerDrawer(sizeHightDrawer: 35,sizeWidthDrawer: 50, sizeHightDivider: 0.05 ,nameLogo: "assets/img/logo_cnm_200 x 200.png")
                : /*Drawer Landscape*/
            ListView(
                  children: [
                    customContainerDrawer(sizeHightDrawer: 35,sizeWidthDrawer: 60, sizeHightDivider: 0.08 ,nameLogo: "assets/img/logo_cnm_200 x 200.png")
                  ],
                ),
        ),


        child:Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xff71ADD5),Color(0xff2471A3)], begin: Alignment.topRight, end: Alignment.bottomLeft))),
          title: Text("Malaria Information System",style: TextStyle(color: Colors.white,fontSize: responsiveSizeScreenTablet? 27 : 20)),
          centerTitle: true,
          leading: IconButton(
            padding: EdgeInsets.only(left: responsiveSizeScreenTablet? 20 : 10),
            onPressed: (){
              setState(() {
                drawerControl();
              });
            },
            icon: Icon(Icons.menu,color: Colors.white,size: 35),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 20),
              onPressed: (){},
                icon: Icon(Icons.notifications_active,color: Colors.white,size: 35),
            )
          ],
         ),

          body: ResponsiveScreen(
              mobile:  Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xff71ADD5),Color(0xff2471A3)], begin: Alignment.topRight, end: Alignment.bottomLeft))),


              tablet: orientationScreen ?
              ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff71ADD5),Color(0xff2471A3)],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft)),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                        Text("Assement Last Mile & Surveillance", style: TextStyle(fontSize: responsiveSizeScreenTablet? 27 : 20,color: Colors.white)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.facebook,color: Colors.white,size: 50)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.telegram,color: Colors.white,size: 50)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.public,color: Colors.white,size: 50)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.tiktok,color: Colors.white,size: 50)),
                            ]
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
                  :
              Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xff71ADD5),Color(0xff2471A3)], begin: Alignment.topRight, end: Alignment.bottomLeft)))
          ),
       ),
    );
  }

  Padding customContainerDrawer({required double sizeWidthDrawer, required double sizeHightDrawer, required double sizeHightDivider ,required String nameLogo}) {
    return Padding(
            padding: EdgeInsets.symmetric(vertical: sizeHightDrawer,horizontal: sizeWidthDrawer),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image.asset(nameLogo),
                      Divider(color: Colors.white,indent: 10, endIndent: 10,height: MediaQuery.of(context).size.height * sizeHightDivider,thickness: 1),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        focusColor: Colors.grey.withOpacity(0.2),
                        onTap: () {
                          setState(() {
                            isActiveCambodia = true;
                            isActiveEngland = false;
                          });
                        }, // Image tapped
                        splashColor: Colors.white10, // Splash color over image
                        child: Container(
                          width: 80,
                          height: 60,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: isActiveCambodia ? BoxDecoration(
                              color: Colors.white70.withOpacity(0.25),
                              border: Border.all(color: Colors.white70),
                              borderRadius: BorderRadius.circular(10)) : null,
                          child: Ink.image(
                            image: AssetImage("assets/img/flag_cambodia.png"),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            isActiveEngland = true;
                            isActiveCambodia = false;
                          });
                        }, // Image tapped
                        splashColor: Colors.white30, // Splash color over image
                        child: Container(
                          width: 80,
                          height: 60,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: isActiveEngland ? BoxDecoration(
                              color: Colors.white70.withOpacity(0.25),
                              border: Border.all(color: Colors.white70),
                              borderRadius: BorderRadius.circular(10)) : null,
                          child: Ink.image(
                            image: AssetImage("assets/img/flag_united england.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50 ,horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(width: 8, height: 30, color: isActiveSummary? Colors.orangeAccent.shade200 : Colors.transparent),
                            TextButton.icon(
                                onPressed: (){
                                  setState(() {
                                    isActiveSummary = true;
                                    isActiveNotification = false;
                                    isActiveAbout = false;
                                    isActiveContact = false;
                                    isActiveLogout = false;
                                  });
                                },
                                icon: Icon(Icons.pie_chart,color: Colors.white,size: 25),
                                label: Text("Summary",style: TextStyle(color: Colors.white,fontSize: 20))
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(width: 8, height: 30, color: isActiveNotification ? Colors.orangeAccent.shade200 : Colors.transparent),
                            TextButton.icon(
                                onPressed: (){
                                  setState(() {
                                    isActiveNotification = true;
                                    isActiveSummary = false;
                                    isActiveAbout = false;
                                    isActiveContact = false;
                                    isActiveLogout = false;
                                  });
                                },
                                icon: Icon(Icons.notifications_active,color: Colors.white,size: 25),
                                label: Text("Notification",style: TextStyle(color: Colors.white,fontSize: 20))
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(width: 8, height: 30, color: isActiveAbout? Colors.orangeAccent.shade200 : Colors.transparent),
                            TextButton.icon(
                                onPressed: (){
                                  setState(() {
                                    isActiveAbout = true;
                                    isActiveSummary = false;
                                    isActiveNotification = false;
                                    isActiveContact = false;
                                    isActiveLogout = false;
                                  });
                                },
                                icon: Icon(Icons.account_box,color: Colors.white,size: 25),
                                label: Text("About",style: TextStyle(color: Colors.white,fontSize: 20))
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(width: 8, height: 30, color: isActiveContact? Colors.orangeAccent.shade200 : Colors.transparent),
                            TextButton.icon(
                                onPressed: (){
                                  setState(() {
                                    isActiveContact = true;
                                    isActiveSummary = false;
                                    isActiveNotification = false;
                                    isActiveAbout = false;
                                    isActiveLogout = false;

                                  });
                                },
                                icon: Icon(Icons.phone_iphone,color: Colors.white,size: 25),
                                label: Text("Contact",style: TextStyle(color: Colors.white,fontSize: 20))
                            ),
                          ],
                        ),
                        Divider(color: Colors.white, thickness: 1,height: MediaQuery.of(context).size.height * 0.08),
                        Row(
                          children: [
                            Container(width: 8, height: 30, color: isActiveLogout? Colors.orangeAccent.shade200 : Colors.transparent),
                            TextButton.icon(
                                onPressed: (){
                                  setState(() {
                                    isActiveLogout = true;
                                    isActiveContact = false;
                                    isActiveSummary = false;
                                    isActiveNotification = false;
                                    isActiveAbout = false;
                                  });
                                },
                                icon: Icon(Icons.logout,color: Colors.white,size: 25),
                                label: Text("Logout",style: TextStyle(color: Colors.white,fontSize: 20))
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                        Text("C.N.M || (V 1.0.1)",style: TextStyle(fontSize: 17, color: Colors.white,fontFamily: KhmerFonts.moul , package: "Khmer_fonts"),)

                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }


  void drawerControl(){
    advencedDrawerController.showDrawer();
  }
}

