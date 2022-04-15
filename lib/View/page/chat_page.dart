import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/page/serche_page.dart';

import '../../screenSize/screenSized.dart';

class ChatPage extends StatelessWidget {
 ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Screenwidth = MediaQuery.of(context).size.width;
    var Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer:Drawer(),appBar: AppBar(

      title:  Center(
        child: SvgPicture.asset('assets/icon/logo-roya.svg',
          width: 40,
          height: 40,),),
      actions: [
        GestureDetector(

          onTap: (() => Get.to(Sercher())),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icon/search.svg',
              width: ScreenSized.IconFiltter(
                  Screenwidth, Screenheight).w,
              height: ScreenSized.IconFiltter(
                  Screenwidth, Screenheight).h,
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
                width: ScreenSized.IconFiltter(
                    Screenwidth, Screenheight).w,
                height: ScreenSized.IconFiltter(
                    Screenwidth, Screenheight).h
                , matchTextDirection: true),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip:
            MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      backgroundColor: Colors.white,
      elevation:0,
    ),body: Container(),);
  }
}
