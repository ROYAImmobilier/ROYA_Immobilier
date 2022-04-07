import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Colors/colors.dart';
import 'package:roya_immobilie/Controller/AnonceController.dart';
import 'package:roya_immobilie/View/page/Home/widget/drawerpage.dart';
import 'package:roya_immobilie/View/page/page_details/details.dart';
import 'package:roya_immobilie/View/page/serche_page.dart';

import '../../cashd_image/image.dart';
import '../../varia_ble/variable.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AnnonceController());
    return Scaffold(
      drawer: DrawerPage(),
        backgroundColor: Color(0xffefefef),
        appBar: AppBar(
         title:  Center(
          child: icon_apps,),
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
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: GetBuilder<AnnonceController>(
          // init: AnnonceController(),
          builder: (controller) => controller.cartProductsModel.length != 0
              ? ListView.builder(
                  itemCount: controller.cartProductsModel.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(Details(
                            image: controller.cartProductsModel[i].cover,
                            data: controller.cartProductsModel[i]));
                      },
                      child: ScreenUtilInit(
                          splitScreenMode: true,
                          builder: () {
                            return Directionality(
                              textDirection: TextDirection.ltr,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Stack(children: [
                                  Container(
                                    child: cachedImage("https://dashboard.royaimmo.ma/images/annonces/"+controller.cartProductsModel[i].cover,),
                                    height: 120.h,
                                    width: 150.w,
                                    decoration:  const BoxDecoration(
                                      // image: DecorationImage(
                                      //                 image:
                                      //                 fit: BoxFit.fill,
                                      //               ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 150.w),
                                    height: 120.h,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),

                                    ),
                                    child: Stack(children: [
                                     Padding(
                                        padding: EdgeInsets.only(top: 15.h,left: 10.w),
                                        child: Text(
                                          controller.cartProductsModel[i].title,
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 14.r,
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: GetBuilder<AnnonceController>(
                                          init: AnnonceController(),
                                          builder: (controller) => Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                                    icon:  Icon(
                                                      Icons.star,
                                                      color: goldColor,
                                                    ),
                                                    onPressed: () {
                                                      controller
                                                          .removebook(controller.cartProductsModel[i]);
                                                    },
                                                  ),
                                          ),
                                        ),),

                                      Container(
                                        margin: EdgeInsets.only(top: 60.h,left: 10.w),
                                        child: Wrap(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on_rounded,
                                                  size: 14.r,
                                                ), Text( controller.cartProductsModel[i].region,style: TextStyle(fontSize: 12.r),),
                                              ],
                                            ),

                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.home,
                                                  size: 14.r,
                                                ), Text(controller.cartProductsModel[i].city,style: TextStyle(fontSize: 14.r),),
                                              ],
                                            ),

                                          ],
                                        ),
                                      )
                                    ],),
                                  ),

                                ],

                                ),
                              ) ,


                            );
                          }),
                      // child: Card(
                      //   color: Colors.white,
                      //   child: ListTile(
                      //     leading: Container(
                      //       height: 200.h,
                      //       width: 150.w,
                      //       child: Image.network(
                      //           "https://dashboard.royaimmo.ma/images/annonces/${controller.cartProductsModel[i].cover}",
                      //            fit: BoxFit.fill,
                      //         height: 200,
                      //       ),
                      //     ),
                      //     title: Text(controller.cartProductsModel[i].title),
                      //     subtitle: Text(
                      //         controller.cartProductsModel[i].region +
                      //             '-' +
                      //             controller.cartProductsModel[i].city),
                      //     trailing: IconButton(
                      //       icon:  Icon(
                      //         Icons.star,
                      //         color: goldColor,
                      //       ),
                      //       onPressed: () {
                      //         controller
                      //             .removebook(controller.cartProductsModel[i]);
                      //       },
                      //     ),
                      //   ),
                      // ),
                    );
                  },
                )
              : SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icon/favorite2.svg',
                        ),
                      ),
                      Text(
                        'favorite is Empty',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
              ),
        ));
  }
}
