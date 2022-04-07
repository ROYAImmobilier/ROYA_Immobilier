import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roya_immobilie/View/page/Profile/profile.dart';
import 'package:roya_immobilie/View/page/favorite_page.dart';
import 'package:roya_immobilie/View/routing_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../../varia_ble/variable.dart';
import '../../../order/order_distination.dart';
import '../../auth/Login/login_screen.dart';


final List locale = [
  {'name': 'English', 'locale': const Locale('en', 'US')},
  {'name': 'France', 'locale': const Locale('fr', 'FR')},
  {'name': 'Arabic', 'locale': const Locale('ar', 'MA')},
];

class DrawerPage extends StatefulWidget {
  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
 // final CityController annonceController = Get.put(CityController());
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose Your Language'.tr),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name'.tr]),
                        onTap: () {
                          // print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffB6B2C8), // HexColor.fromHex("B6B2C8"),
              ),
              child: Stack(
                children: [
                  const Positioned(
                      top: 10,
                      left: 110,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Color(0xff5E5486),
                      )),
                  Positioned(
                      bottom: 10,
                      //left: 015,
                      child: Container(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Bienvenue ,".tr,
                                    style:  const TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'pour une experience optimisee , '.tr,
                                    style:   const TextStyle(fontSize: 18),

                                 //  stepGranularity: 5.0,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'veuillez vous connecter'.tr,
                                    style:  TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
              child: MaterialButton(
                color: const Color(0xffB68451),
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.circular(8.0),
                ),
                onPressed: () {
                  Get.to(Add_Annonce());
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icon/nav_menu/camera_add.svg',
                        width: 25,
                        height: 25,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      AutoSizeText(
                        'DEPOSER UNE ANNONCE'.tr,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),


            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child:
              isLogin==true?
              GestureDetector(
                  onTap: (){
                    Get.to(ProfilePage());
                  },
                  child:
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icon/nav_menu/person.svg',
                        width: 25,
                        height: 25,

                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Tableau De Bord'.tr, style: TextStyle(fontSize: 20))
                    ],
                  )):
              GestureDetector(
                onTap: (){
                  Get.to(LoginScreen());
                },
                child:
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icon/nav_menu/person.svg',
                      width: 25,
                      height: 25,
                    ),
                     SizedBox(
                      width: 15,
                    ),
                    Text('Se connecter'.tr, style: TextStyle(fontSize: 20))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            isLogin==true?  Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: GestureDetector(
                  onTap: (){
                    isLogin=false;
                    token_global="";
                    Get.offAll(const RoutingScreen());
                  },
                  child:
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icon/logout.svg',
                        width: 25,
                        height: 25,
                          matchTextDirection: true
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Se Déconnecter'.tr, style: TextStyle(fontSize: 20))
                    ],
                  )),
            ):Container(),

            isLogin==true?const SizedBox(
              height: 24,
            ):const SizedBox(            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icon/nav_menu/cc-chat.svg',
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('Chat'.tr, style: TextStyle(fontSize: 20))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: GestureDetector(
                onTap: (){
                  Get.to(const FavoritePage());
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icon/annonces/favor.svg',
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Mes favoris'.tr, style: TextStyle(fontSize: 20))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icon/nav_menu/language-sharp.svg',
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      buildLanguageDialog(context);
                      // setState(() {
                      //   var locale = Locale('ar', 'MA');
                      //   Get.updateLocale(locale);
                      // });
                    },
                    child:Text(
                      'Langues'.tr,
                      style: TextStyle(
                        fontSize: 20,

                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icon/nav_menu/telephone.svg',
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(
                    width:15,
                  ),
                  Text('Contactez nous'.tr, style: TextStyle(fontSize: 20))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icon/nav_menu/info.svg',
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Add_Annonce()),
                      // );
                    },
                    child: Text('Informations'.tr, style: const TextStyle(fontSize: 20)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}