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
    DataPic(icon: Icons.question_answer_outlined,nameTitle: "DQA Surveillance"),
    DataPic(icon: Icons.storage,nameTitle: "Offline Data"),
    DataPic(icon: Icons.settings,nameTitle: "Setting"),
    DataPic(icon: Icons.edit,nameTitle: "Add"),
    DataPic(icon: Icons.preview,nameTitle: "Preview"),
    DataPic(icon: Icons.health_and_safety_outlined,nameTitle: "HC"),
    DataPic(icon: Icons.groups,nameTitle: "VMW"),
    DataPic(icon: Icons.screen_search_desktop_outlined,nameTitle: "Device"),
    DataPic(icon: Icons.import_export,nameTitle: "Export Data"),
  ];

  final List<Show_HideContainer> isVisible =[
   Show_HideContainer(isVisibleContainer: false),
    Show_HideContainer(isVisibleContainer: false),
    Show_HideContainer(isVisibleContainer: false),
    Show_HideContainer(isVisibleContainer: false),
    Show_HideContainer(isVisibleContainer: false),
    Show_HideContainer(isVisibleContainer: false),
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
            mobile: ListView(children: [customContainerDrawer(sizeWidthDrawer: 20,sizeHightDrawer: 10, sizeHightDivider: 0.05, nameLogo: "assets/img/logo_cnm_128 x 128.png"),]),

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
              mobile: ListView(
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
                        SizedBox(height: 30),

                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.1),
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.75,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.16),
                                child: ListView(
                                  children: [
                                    boxContainer(sizeIcon: 30,sizeTitle: 13)
                                  ],
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
                                    children: [
                                     const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            CircleAvatar(backgroundColor: Color(0xff71ADD5),backgroundImage: AssetImage("assets/img/user.png"), radius: 30),
                                            SizedBox(height: 10),
                                            Text("SAKY",style: TextStyle(color: Color(0xff2471A3),fontSize: 15)),
                                            Text("AU",style: TextStyle(color: Color(0xff2471A3),fontSize: 15)),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("10/June/2024",style: TextStyle(color: Color(0xff2471A3),fontSize: 10)),
                                                Text("Version 1.0.1",style: TextStyle(color: Color(0xff2471A3),fontSize: 10)),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Assement Last Mile & Surveillance", style: TextStyle(fontSize: responsiveSizeScreenTablet? 25 : 13,color:  Color(0xff2471A3))),
                                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                IconButton(onPressed: (){}, icon: Icon(Icons.facebook,color: Colors.blue,size: 25)),
                                                IconButton(onPressed: (){}, icon: Icon(Icons.telegram,color: Colors.lightBlueAccent.shade200,size: 25)),
                                                IconButton(onPressed: (){}, icon: Icon(Icons.public,color: Colors.blue,size: 25)),
                                                IconButton(onPressed: (){}, icon: Icon(Icons.tiktok,color: Colors.black,size: 25)),
                                              ],
                                            ),
                                            Text("Information In Social Media",style: TextStyle(fontSize: responsiveSizeScreenTablet? 25 : 13,color:  Color(0xff2471A3))),
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
              ),

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
                                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.18),
                                child: ListView(
                                  children: [
                                    boxContainer(sizeIcon: 50,sizeTitle: 18)
                                  ],
                                )
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
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            CircleAvatar(backgroundColor: Color(0xff71ADD5),backgroundImage: AssetImage("assets/img/user.png"), radius: 40),
                                            SizedBox(height: 10),
                                            Text("SAKY",style: TextStyle(color: Color(0xff2471A3),fontSize: 20)),
                                            Text("AU",style: TextStyle(color: Color(0xff2471A3),fontSize: 20)),
                                            SizedBox(height: 15),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("10/June/2024",style: TextStyle(color: Color(0xff2471A3),fontSize: 15)),
                                                Text("Version 1.0.1",style: TextStyle(color: Color(0xff2471A3),fontSize: 15)),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Assement Last Mile & Surveillance", style: TextStyle(fontSize: responsiveSizeScreenTablet? 25 : 17,color:  Color(0xff2471A3))),
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
                                            Text("Information In Social Media",style: TextStyle(fontSize: responsiveSizeScreenTablet? 25 : 17,color:  Color(0xff2471A3))),
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
                        height: MediaQuery.of(context).size.height * 0.8,
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

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.442,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        radius: 100,
                                        onTap: (){
                                          setState(() {
                                            isVisible[0].isVisibleContainer = !isVisible[0].isVisibleContainer;
                                            isVisible[1].isVisibleContainer = false;
                                            isVisible[2].isVisibleContainer = false;
                                            isVisible[3].isVisibleContainer = false;
                                            isVisible[4].isVisibleContainer = false;
                                            isVisible[5].isVisibleContainer = false;
                                          });
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.2,
                                          height: MediaQuery.of(context).size.height * 0.2,
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            border: Border.all(color:isVisible[0].isVisibleContainer? Colors.transparent : Colors.white),
                                            color: isVisible[0].isVisibleContainer? Color(0xff2471A3) : Colors.transparent, /*Background Color Main-Gridview*/
                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(iconGridView[0].icon,color: Colors.white,size: 50),
                                              Divider(color: Colors.white),
                                              Text(iconGridView[0].nameTitle,style: TextStyle(color: Colors.white ,fontSize: 35)),
                                            ],
                                          ),
                                        ),
                                      ),

                                      InkWell(
                                        radius: 100,
                                        onTap: (){
                                          setState(() {
                                            isVisible[0].isVisibleContainer = false;
                                            isVisible[1].isVisibleContainer = !isVisible[1].isVisibleContainer;
                                            isVisible[2].isVisibleContainer = false;
                                            isVisible[3].isVisibleContainer = false;
                                            isVisible[4].isVisibleContainer = false;
                                            isVisible[5].isVisibleContainer = false;
                                          });
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.2,
                                          height: MediaQuery.of(context).size.height * 0.2,
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            border: Border.all(color:isVisible[1].isVisibleContainer? Colors.transparent : Colors.white),
                                            color: isVisible[1].isVisibleContainer? Color(0xff2471A3) : Colors.transparent, /*Background Color Main-Gridview*/
                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(iconGridView[1].icon,color: Colors.white,size: 50),
                                              Divider(color: Colors.white),
                                              Text(iconGridView[1].nameTitle,style: TextStyle(color: Colors.white ,fontSize: 35)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        radius: 100,
                                        onTap: (){
                                          setState(() {
                                            isVisible[0].isVisibleContainer = !isVisible[0].isVisibleContainer;
                                            isVisible[1].isVisibleContainer = false;
                                            isVisible[2].isVisibleContainer = false;
                                            isVisible[3].isVisibleContainer = false;
                                            isVisible[4].isVisibleContainer = false;
                                            isVisible[5].isVisibleContainer = false;
                                          });
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.2,
                                          height: MediaQuery.of(context).size.height * 0.2,
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            border: Border.all(color:isVisible[0].isVisibleContainer? Colors.transparent : Colors.white),
                                            color: isVisible[0].isVisibleContainer? Color(0xff2471A3) : Colors.transparent, /*Background Color Main-Gridview*/
                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(iconGridView[0].icon,color: Colors.white,size: 50),
                                              Divider(color: Colors.white),
                                              Text(iconGridView[0].nameTitle,style: TextStyle(color: Colors.white ,fontSize: 35)),
                                            ],
                                          ),
                                        ),
                                      ),

                                      InkWell(
                                        radius: 100,
                                        onTap: (){
                                          setState(() {
                                            isVisible[0].isVisibleContainer = false;
                                            isVisible[1].isVisibleContainer = !isVisible[1].isVisibleContainer;
                                            isVisible[2].isVisibleContainer = false;
                                            isVisible[3].isVisibleContainer = false;
                                            isVisible[4].isVisibleContainer = false;
                                            isVisible[5].isVisibleContainer = false;
                                          });
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.2,
                                          height: MediaQuery.of(context).size.height * 0.2,
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            border: Border.all(color:isVisible[1].isVisibleContainer? Colors.transparent : Colors.white),
                                            color: isVisible[1].isVisibleContainer? Color(0xff2471A3) : Colors.transparent, /*Background Color Main-Gridview*/
                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(iconGridView[1].icon,color: Colors.white,size: 50),
                                              Divider(color: Colors.white),
                                              Text(iconGridView[1].nameTitle,style: TextStyle(color: Colors.white ,fontSize: 35)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        radius: 100,
                                        onTap: (){
                                          setState(() {
                                            isVisible[0].isVisibleContainer = !isVisible[0].isVisibleContainer;
                                            isVisible[1].isVisibleContainer = false;
                                            isVisible[2].isVisibleContainer = false;
                                            isVisible[3].isVisibleContainer = false;
                                            isVisible[4].isVisibleContainer = false;
                                            isVisible[5].isVisibleContainer = false;
                                          });
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.2,
                                          height: MediaQuery.of(context).size.height * 0.2,
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            border: Border.all(color:isVisible[0].isVisibleContainer? Colors.transparent : Colors.white),
                                            color: isVisible[0].isVisibleContainer? Color(0xff2471A3) : Colors.transparent, /*Background Color Main-Gridview*/
                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(iconGridView[0].icon,color: Colors.white,size: 50),
                                              Divider(color: Colors.white),
                                              Text(iconGridView[0].nameTitle,style: TextStyle(color: Colors.white ,fontSize: 35)),
                                            ],
                                          ),
                                        ),
                                      ),

                                      InkWell(
                                        radius: 100,
                                        onTap: (){
                                          setState(() {
                                            isVisible[0].isVisibleContainer = false;
                                            isVisible[1].isVisibleContainer = !isVisible[1].isVisibleContainer;
                                            isVisible[2].isVisibleContainer = false;
                                            isVisible[3].isVisibleContainer = false;
                                            isVisible[4].isVisibleContainer = false;
                                            isVisible[5].isVisibleContainer = false;
                                          });
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.2,
                                          height: MediaQuery.of(context).size.height * 0.2,
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            border: Border.all(color:isVisible[1].isVisibleContainer? Colors.transparent : Colors.white),
                                            color: isVisible[1].isVisibleContainer? Color(0xff2471A3) : Colors.transparent, /*Background Color Main-Gridview*/
                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(iconGridView[1].icon,color: Colors.white,size: 50),
                                              Divider(color: Colors.white),
                                              Text(iconGridView[1].nameTitle,style: TextStyle(color: Colors.white ,fontSize: 35)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

              ),
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


  Widget boxContainer({required double sizeIcon,required double sizeTitle}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*Row 1*/
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           InkWell(
             radius: 100,
             onTap: (){
               setState(() {
                 isVisible[0].isVisibleContainer = !isVisible[0].isVisibleContainer;
                 isVisible[1].isVisibleContainer = false;
                 isVisible[2].isVisibleContainer = false;
                 isVisible[3].isVisibleContainer = false;
                 isVisible[4].isVisibleContainer = false;
                 isVisible[5].isVisibleContainer = false;
               });
             },
             child: Container(
               width: MediaQuery.of(context).size.width * 0.35,
               height: MediaQuery.of(context).size.height * 0.12,
               margin: const EdgeInsets.all(5),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(20)),
                 border: Border.all(color:isVisible[0].isVisibleContainer? Colors.white : Colors.lightBlue),
                 color: isVisible[0].isVisibleContainer? Color(0xff2471A3) : Colors.white, /*Background Color Main-Gridview*/
                 boxShadow: [
                   BoxShadow(
                     color: Color(0xff71ADD5),
                     offset: Offset(1,1),
                     blurRadius: 2,
                     spreadRadius: 1,
                   ),
                 ],
               ),
             
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(iconGridView[0].icon,color:isVisible[0].isVisibleContainer? Colors.white : Color(0xff2471A3),size: sizeIcon),
                   Divider(color: isVisible[0].isVisibleContainer? Colors.white : Colors.lightBlue.shade300),
                   Text(iconGridView[0].nameTitle,style: TextStyle(color: isVisible[0].isVisibleContainer? Colors.white : Color(0xff2471A3),fontSize: sizeTitle)),
                 ],
               ),
             ),
           ),

           InkWell(
             radius: 100,
             onTap: (){
               setState(() {
                 isVisible[0].isVisibleContainer = false;
                 isVisible[1].isVisibleContainer = !isVisible[1].isVisibleContainer;
                 isVisible[2].isVisibleContainer = false;
                 isVisible[3].isVisibleContainer = false;
                 isVisible[4].isVisibleContainer = false;
                 isVisible[5].isVisibleContainer = false;
               });
             },
             child: Container(
               width: MediaQuery.of(context).size.width * 0.35,
               height: MediaQuery.of(context).size.height * 0.12,
               margin: const EdgeInsets.all(5),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(20)),
                 border: Border.all(color:isVisible[1].isVisibleContainer? Colors.white : Colors.lightBlue),
                 color: isVisible[1].isVisibleContainer? Color(0xff2471A3) : Colors.white, /*Background Color Main-Gridview*/
                 boxShadow: [
                   BoxShadow(
                     color: Color(0xff71ADD5),
                     offset: Offset(1,1),
                     blurRadius: 2,
                     spreadRadius: 1,
                   ),
                 ],
               ),

               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(iconGridView[1].icon,color:isVisible[1].isVisibleContainer? Colors.white : Color(0xff2471A3),size: sizeIcon),
                   Divider(color: isVisible[1].isVisibleContainer? Colors.white : Colors.lightBlue.shade300),
                   Text(iconGridView[1].nameTitle,style: TextStyle(color: isVisible[1].isVisibleContainer? Colors.white : Color(0xff2471A3),fontSize: sizeTitle)),
                 ],
               ),
             ),
           ),
         ],
       ),
        SizedBox(height: responsiveSizeScreenTablet? 10 : 5),
        Visibility(
          visible: isVisible[0].isVisibleContainer,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.25,
                color: Color(0xff2471A3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        width: responsiveSizeScreenTablet? MediaQuery.of(context).size.width * 0.23 :MediaQuery.of(context).size.width * 0.29,
                        height: MediaQuery.of(context).size.height * 0.14,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          border: Border.all(color:Colors.white),
                          color:Color(0xff2471A3), /*Background Color Main-Gridview*/

                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(iconGridView[6].icon,color:Colors.white,size: sizeIcon),
                            Divider(color:Colors.white),
                            Text(iconGridView[6].nameTitle,style: TextStyle(color:Colors.white,fontSize: sizeTitle)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        width: responsiveSizeScreenTablet? MediaQuery.of(context).size.width * 0.23 :MediaQuery.of(context).size.width * 0.29,
                        height: MediaQuery.of(context).size.height * 0.14,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          border: Border.all(color:Colors.white),
                          color:Color(0xff2471A3), /*Background Color Main-Gridview*/
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(iconGridView[7].icon,color:Colors.white,size: sizeIcon),
                            Divider(color:Colors.white),
                            Text(iconGridView[7].nameTitle,style: TextStyle(color:Colors.white,fontSize: sizeTitle)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: isVisible[1].isVisibleContainer,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.25,
                color: Color(0xff2471A3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        width: responsiveSizeScreenTablet? MediaQuery.of(context).size.width * 0.23 :MediaQuery.of(context).size.width * 0.29,
                        height: MediaQuery.of(context).size.height * 0.14,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          border: Border.all(color:Colors.white),
                          color:Color(0xff2471A3), /*Background Color Main-Gridview*/

                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(iconGridView[6].icon,color:Colors.white,size: sizeIcon),
                            Divider(color:Colors.white),
                            Text(iconGridView[6].nameTitle,style: TextStyle(color:Colors.white,fontSize: sizeTitle)),
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        width: responsiveSizeScreenTablet? MediaQuery.of(context).size.width * 0.23 :MediaQuery.of(context).size.width * 0.29,
                        height: MediaQuery.of(context).size.height * 0.14,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          border: Border.all(color:Colors.white),
                          color:Color(0xff2471A3), /*Background Color Main-Gridview*/
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(iconGridView[7].icon,color:Colors.white,size: sizeIcon),
                            Divider(color:Colors.white),
                            Text(iconGridView[7].nameTitle,style: TextStyle(color:Colors.white,fontSize: sizeTitle)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: responsiveSizeScreenTablet? 10 : 5),

        /*Row 2*/
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              radius: 100,
              onTap: (){
                setState(() {
                  isVisible[0].isVisibleContainer = false;
                  isVisible[1].isVisibleContainer = false;
                  isVisible[2].isVisibleContainer = !isVisible[2].isVisibleContainer;
                  isVisible[3].isVisibleContainer = false;
                  isVisible[4].isVisibleContainer = false;
                  isVisible[5].isVisibleContainer = false;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.12,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color:isVisible[2].isVisibleContainer? Colors.white : Colors.lightBlue),
                  color: isVisible[2].isVisibleContainer? Color(0xff2471A3) : Colors.white, /*Background Color Main-Gridview*/
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff71ADD5),
                      offset: Offset(1,1),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(iconGridView[2].icon,color:isVisible[2].isVisibleContainer? Colors.white : Color(0xff2471A3),size: sizeIcon),
                    Divider(color: isVisible[2].isVisibleContainer? Colors.white : Colors.lightBlue.shade300),
                    Text(iconGridView[2].nameTitle,style: TextStyle(color: isVisible[2].isVisibleContainer? Colors.white : Color(0xff2471A3),fontSize: sizeTitle)),
                  ],
                ),
              ),
            ),

            InkWell(
              radius: 100,
              onTap: (){
                setState(() {
                  isVisible[0].isVisibleContainer = false;
                  isVisible[1].isVisibleContainer = false;
                  isVisible[2].isVisibleContainer = false;
                  isVisible[3].isVisibleContainer = !isVisible[3].isVisibleContainer;
                  isVisible[4].isVisibleContainer = false;
                  isVisible[5].isVisibleContainer = false;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.12,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color:isVisible[3].isVisibleContainer? Colors.white : Colors.lightBlue),
                  color: isVisible[3].isVisibleContainer? Color(0xff2471A3) : Colors.white, /*Background Color Main-Gridview*/
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff71ADD5),
                      offset: Offset(1,1),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(iconGridView[3].icon,color:isVisible[3].isVisibleContainer? Colors.white : Color(0xff2471A3),size: sizeIcon),
                    Divider(color: isVisible[3].isVisibleContainer? Colors.white : Colors.lightBlue.shade300),
                    Text(iconGridView[3].nameTitle,style: TextStyle(color: isVisible[3].isVisibleContainer? Colors.white : Color(0xff2471A3),fontSize: sizeTitle)),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: responsiveSizeScreenTablet? 10 : 5),
        Visibility(
          visible: isVisible[2].isVisibleContainer,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.25,
                color: Color(0xff2471A3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        width: responsiveSizeScreenTablet? MediaQuery.of(context).size.width * 0.23 :MediaQuery.of(context).size.width * 0.29,
                        height: MediaQuery.of(context).size.height * 0.14,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          border: Border.all(color:Colors.white),
                          color:Color(0xff2471A3), /*Background Color Main-Gridview*/

                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(iconGridView[8].icon,color:Colors.white,size: sizeIcon),
                            Divider(color:Colors.white),
                            Text(iconGridView[8].nameTitle,style: TextStyle(color:Colors.white,fontSize: sizeTitle)),
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        width: responsiveSizeScreenTablet? MediaQuery.of(context).size.width * 0.23 :MediaQuery.of(context).size.width * 0.29,
                        height: MediaQuery.of(context).size.height * 0.14,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          border: Border.all(color:Colors.white),
                          color:Color(0xff2471A3), /*Background Color Main-Gridview*/
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(iconGridView[9].icon,color:Colors.white,size: sizeIcon),
                            Divider(color:Colors.white),
                            Text(iconGridView[9].nameTitle,style: TextStyle(color:Colors.white,fontSize: sizeTitle)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: isVisible[3].isVisibleContainer,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.25,
                color: Color(0xff2471A3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        width: responsiveSizeScreenTablet? MediaQuery.of(context).size.width * 0.23 :MediaQuery.of(context).size.width * 0.29,
                        height: MediaQuery.of(context).size.height * 0.14,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          border: Border.all(color:Colors.white),
                          color:Color(0xff2471A3), /*Background Color Main-Gridview*/

                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(iconGridView[6].icon,color:Colors.white,size: sizeIcon),
                            Divider(color:Colors.white),
                            Text(iconGridView[6].nameTitle,style: TextStyle(color:Colors.white,fontSize: sizeTitle)),
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        width: responsiveSizeScreenTablet? MediaQuery.of(context).size.width * 0.23 :MediaQuery.of(context).size.width * 0.29,
                        height: MediaQuery.of(context).size.height * 0.14,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          border: Border.all(color:Colors.white),
                          color:Color(0xff2471A3), /*Background Color Main-Gridview*/
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(iconGridView[7].icon,color:Colors.white,size: sizeIcon),
                            Divider(color:Colors.white),
                            Text(iconGridView[7].nameTitle,style: TextStyle(color:Colors.white,fontSize: sizeTitle)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: responsiveSizeScreenTablet? 10 : 5),

        /*Row 3*/
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              radius: 100,
              onTap: (){
                setState(() {
                  isVisible[0].isVisibleContainer = false;
                  isVisible[1].isVisibleContainer = false;
                  isVisible[2].isVisibleContainer = false;
                  isVisible[3].isVisibleContainer = false;
                  isVisible[4].isVisibleContainer = !isVisible[4].isVisibleContainer;
                  isVisible[5].isVisibleContainer = false;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.12,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color:isVisible[4].isVisibleContainer? Colors.white : Colors.lightBlue),
                  color: isVisible[4].isVisibleContainer? Color(0xff2471A3) : Colors.white, /*Background Color Main-Gridview*/
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff71ADD5),
                      offset: Offset(1,1),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(iconGridView[4].icon,color:isVisible[4].isVisibleContainer? Colors.white : Color(0xff2471A3),size: sizeIcon),
                    Divider(color: isVisible[4].isVisibleContainer? Colors.white : Colors.lightBlue.shade300),
                    Text(iconGridView[4].nameTitle,style: TextStyle(color: isVisible[4].isVisibleContainer? Colors.white : Color(0xff2471A3),fontSize: sizeTitle)),
                  ],
                ),
              ),
            ),

            InkWell(
              radius: 100,
              onTap: (){
                setState(() {
                  isVisible[0].isVisibleContainer = false;
                  isVisible[1].isVisibleContainer = false;
                  isVisible[2].isVisibleContainer = false;
                  isVisible[3].isVisibleContainer = false;
                  isVisible[4].isVisibleContainer = false;
                  isVisible[5].isVisibleContainer = !isVisible[5].isVisibleContainer;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.12,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color:isVisible[5].isVisibleContainer? Colors.white : Colors.lightBlue),
                  color: isVisible[5].isVisibleContainer? Color(0xff2471A3) : Colors.white, /*Background Color Main-Gridview*/
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff71ADD5),
                      offset: Offset(1,1),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(iconGridView[5].icon,color:isVisible[5].isVisibleContainer? Colors.white : Color(0xff2471A3),size: sizeIcon),
                    Divider(color: isVisible[5].isVisibleContainer? Colors.white : Colors.lightBlue.shade300),
                    Text(iconGridView[5].nameTitle,style: TextStyle(color: isVisible[5].isVisibleContainer? Colors.white : Color(0xff2471A3),fontSize: sizeTitle)),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: responsiveSizeScreenTablet? 10 : 5),
        Visibility(
          visible: isVisible[5].isVisibleContainer,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.25,
                color: Color(0xff2471A3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        width: responsiveSizeScreenTablet? MediaQuery.of(context).size.width * 0.23 :MediaQuery.of(context).size.width * 0.29,
                        height: MediaQuery.of(context).size.height * 0.14,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          border: Border.all(color:Colors.white),
                          color:Color(0xff2471A3), /*Background Color Main-Gridview*/

                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(iconGridView[10].icon,color:Colors.white,size: sizeIcon),
                            Divider(color:Colors.white),
                            Text(iconGridView[10].nameTitle,style: TextStyle(color:Colors.white,fontSize: sizeTitle)),
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        width: responsiveSizeScreenTablet? MediaQuery.of(context).size.width * 0.23 :MediaQuery.of(context).size.width * 0.29,
                        height: MediaQuery.of(context).size.height * 0.14,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          border: Border.all(color:Colors.white),
                          color:Color(0xff2471A3), /*Background Color Main-Gridview*/
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(iconGridView[11].icon,color:Colors.white,size: sizeIcon),
                            Divider(color:Colors.white),
                            Text(iconGridView[11].nameTitle,style: TextStyle(color:Colors.white,fontSize: sizeTitle)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: responsiveSizeScreenTablet? 10 : 5),


      ],
    );
  }

  void drawerControl(){
    advencedDrawerController.showDrawer();
  }
}

