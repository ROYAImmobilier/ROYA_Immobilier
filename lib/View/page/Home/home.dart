import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Controller/AnonceController.dart';
import 'package:roya_immobilie/View/page/Home/widget/drawerpage.dart';
import 'package:roya_immobilie/View/page/Home/widget/stackwidget_2.dart';

import '../../routing_screen.dart';
import '../serche_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  final controller = Get.put(AnnonceController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnnonceController>(
      // init: AnnonceController(),
      builder: (controller) => ScreenUtilInit(
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
              GestureDetector(
                onTap: (() => Get.to(Sercher())),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/icon/search.svg',
                    width: 20,
                    height: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  //menu.svg
                  icon: SvgPicture.asset('assets/icon/menu.svg',
                      width: 25, height: 25, matchTextDirection: true),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            backgroundColor: Colors.white,
            elevation: 1,
          ),
          body: StackWidget_2(
              data: allAnnonce, leng: allAnnonce.length),
        ),
      ),
    );
  }
}
