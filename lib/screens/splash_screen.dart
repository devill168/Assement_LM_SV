import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:assement_lm_sv/config/responsiveScreen.dart';
import 'package:assement_lm_sv/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    if(MediaQuery.of(context).size.width <= 3500) {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    return ResponsiveScreen(
      mobile: customSizeScreenLogo(customSizeWidth: 1,customSizeHeight: 0.3),
      tablet: customSizeScreenLogo(customSizeWidth: 0.9,customSizeHeight: 0.35),
      desktop: customSizeScreenLogo(customSizeWidth: 1,customSizeHeight: 1),
    );
  }


  AnimatedSplashScreen customSizeScreenLogo({required double customSizeWidth, required double customSizeHeight}) {
    return AnimatedSplashScreen(
      duration: 8000,
      backgroundColor: Colors.grey.shade100,
      splashIconSize: MediaQuery.of(context).size.width * customSizeWidth,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * customSizeWidth,
            height: MediaQuery.of(context).size.height * customSizeHeight,
            child: Image.asset("assets/img/animation logo (online-video-cutter.com).gif",fit: BoxFit.fill),
          ),
        ],
      ),
      nextScreen: Login(),
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
