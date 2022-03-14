import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roya_immobilie/View/page/Home/widget/drawerpage.dart';
import 'package:roya_immobilie/View/page/Home/widget/stackwidget_2.dart';

import 'package:roya_immobilie/View/page/widget/stackwidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Scaffold(
        backgroundColor: Colors.white,
        drawer: DrawerPage(),
        appBar: AppBar(
          title: const Center(
              child: Icon(
            Icons.star,
            color: Colors.black,
          )),
          actions: [
            SvgPicture.asset(
              'assests/icon/search.svg',
              color: Colors.black,
            ),
          ],
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                //menu.svg
                icon: SvgPicture.asset(
                  'assets/icon/menu.svg',
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const StackWidget_2(),
      ),
    );
  }
}
