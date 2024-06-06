import 'package:assement_lm_sv/config/responsiveScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

final advencedDrawerController = AdvancedDrawerController();
class _MenuState extends State<Menu> {

  bool responsiveSizeScreenTablet = true;
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

      responsiveSizeScreenTablet = true;
    }
    return AdvancedDrawer(
        controller: advencedDrawerController,
        backdropColor: Color(0xff5DADE2),
        animationCurve: Curves.easeIn,
        childDecoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20)),),
        animationDuration: Duration(milliseconds: 300),
        drawer: Padding(
          padding: responsiveSizeScreenTablet ? EdgeInsets.symmetric(vertical: 35,horizontal: 10) : EdgeInsets.symmetric(vertical: 20,horizontal: 10) ,
          child: SafeArea(
            child: Column(
              children: [
                responsiveSizeScreenTablet ? Image.asset("assets/img/logo_cnm_200 x 200.png") : Image.asset("assets/img/logo_cnm_128 x 128.png"),
                responsiveSizeScreenTablet ? Divider(color: Colors.white,indent: 35, endIndent: 20,height: MediaQuery.of(context).size.height * 0.05,thickness: 2) : Divider(color: Colors.white,indent: 20, endIndent: 20,height: MediaQuery.of(context).size.height * 0.05,thickness: 2)
              ],
            ),
          ),
        ),

        child:Scaffold(
        appBar: AppBar(
        backgroundColor:  Color(0xff2471A3),
        title:  Text("CNM",style: const TextStyle(color: Colors.white)),
        leading: IconButton(
        onPressed: (){
          setState(() {
            drawerControl();
          });
        },
        icon: const Icon(Icons.menu,color: Colors.white),
        ),
      ),
       ),
    );
  }
  void drawerControl(){
    advencedDrawerController.showDrawer();
  }
}







/*
body: ResponsiveScreen(
mobile: Container(
width: double.infinity,
decoration: BoxDecoration(
gradient: LinearGradient(colors: [Color(0xff71ADD5),Color(0xff2471A3)]),
),
),


tablet: MediaQuery.of(context).orientation == Orientation.portrait ? */
/*Screen Portrait*//*

Container()
    :  */
/*Screen Landscape*//*

Container()
),*/
