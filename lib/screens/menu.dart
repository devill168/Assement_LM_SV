
import 'package:assement_lm_sv/config/responsiveScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

import '../models/variableGridView.dart';

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

  final List<DataPic> iconGridView = [
    DataPic(icon: Icons.checklist,nameTitle: "Surveillance"),
    DataPic(icon: Icons.forest,nameTitle: "Last Mile"),
    DataPic(icon: Icons.pie_chart,nameTitle: "Report"),
    DataPic(icon: Icons.medical_information,nameTitle: "Information Detail"),
    DataPic(icon: Icons.storage,nameTitle: "Offline Data"),
    DataPic(icon: Icons.settings,nameTitle: "Setting"),
  ];

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


              tablet: orientationScreen ? /*Portrait*/
              ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff71ADD5),Color(0xff2471A3)],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft)),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                        SizedBox(height: 50),

                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.08),
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.79,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.18,horizontal:  MediaQuery.of(context).size.height * 0.025),
                                child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 2,
                                    childAspectRatio: 2,
                                  ),
                                  itemBuilder: (context,index){
                                    return Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.35,
                                          height: MediaQuery.of(context).size.height * 0.12,
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            border: Border.all(color: Colors.lightBlue),
                                            color: Colors.white, /*Background Color Main-Gridview*/
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0xff71ADD5),
                                                offset: Offset(1,1),
                                                blurRadius: 3,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.8,
                                                height: MediaQuery.of(context).size.height * 0.07,
                                                child: IconButton(onPressed: (){
                                                  /*if(index == 0){
                                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login()),(route) => false);
                                                  }
                                                  else if(index == 1){
                                                    Navigator.push(context,MaterialPageRoute(builder: (context) => const List_View()));
                                                  }*/
                                                }, icon: Icon(iconGridView[index].icon,color: Color(0xff2471A3),size: 50,)),
                                              ),
                                              Divider(color: Colors.lightBlue.shade300),
                                              Text(iconGridView[index].nameTitle,style: TextStyle(color: Color(0xff2471A3),fontSize: 20)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  itemCount: iconGridView.length,
                                ),
                              ),
                            ),

                            Positioned(
                                top: 5,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(colors: [Color(0xffAED6F1), Color(0xffFBFCFC)],begin: Alignment.topRight,end: Alignment.bottomRight),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: PageView(
                                    scrollDirection: Axis.vertical,
                                    children:  [
                                      Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            CircleAvatar(backgroundColor: Color(0xff71ADD5),backgroundImage: AssetImage("assets/img/user.png"), radius: 50),
                                            SizedBox(height: 10),
                                            Text("SAKY",style: TextStyle(color: Color(0xff2471A3),fontSize: 25)),
                                            Text("AU",style: TextStyle(color: Color(0xff2471A3),fontSize: 25)),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("10/June/2024",style: TextStyle(color: Color(0xff2471A3),fontSize: 20)),
                                                Text("Version 1.0.1",style: TextStyle(color: Color(0xff2471A3),fontSize: 20)),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Assement Last Mile & Surveillance", style: TextStyle(fontSize: responsiveSizeScreenTablet? 30 : 22,color:  Color(0xff2471A3))),
                                           SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                IconButton(onPressed: (){}, icon: Icon(Icons.facebook,color: Colors.blue,size: 50)),
                                                IconButton(onPressed: (){}, icon: Icon(Icons.telegram,color: Colors.lightBlueAccent.shade200,size: 40)),
                                                IconButton(onPressed: (){}, icon: Icon(Icons.public,color: Colors.blue,size: 50)),
                                                IconButton(onPressed: (){}, icon: Icon(Icons.tiktok,color: Colors.black,size: 50)),
                                              ],
                                            ),
                                            Text("Information In Social Media",style: TextStyle(color: Color(0xff2471A3),fontSize: 30)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
                  : /*Landscape*/
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

