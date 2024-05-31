import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveScreen({super.key,required this.mobile,required this.tablet,required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth >= 1 && constraints.maxWidth <= 650){
            return mobile;
          }
          else if (constraints.maxWidth >= 650 && constraints.maxWidth <= 1800){
            return tablet;
          }
          else{
            return desktop;
          }
        });
  }
}
