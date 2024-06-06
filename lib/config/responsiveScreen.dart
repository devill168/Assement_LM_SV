import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;


  const ResponsiveScreen({super.key,required this.mobile,required this.tablet});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth >= 1 && constraints.maxWidth <= 650)
            return mobile;
          else (constraints.maxWidth > 650);
            return tablet;
        });
  }
}
