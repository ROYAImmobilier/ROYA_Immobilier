import 'package:flutter/material.dart';


class ResponsiveLayout_ extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabliteBody;
  final Widget smallBody;


  const ResponsiveLayout_({required this.mobileBody, required this.tabliteBody,required this.smallBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print(MediaQuery.of(context).size.height);
        if (constraints.maxWidth < 385 && MediaQuery.of(context).size.height<600) {
          return smallBody;
        } else if(constraints.maxWidth > 800 ) {
          return tabliteBody;
        }else {
          print("1");
          return mobileBody;
        }
      },
    );
  }
}