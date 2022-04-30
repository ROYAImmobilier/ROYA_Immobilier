import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/page/favorite_page.dart';
import 'package:roya_immobilie/View/routing_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Model/cityrepo.dart';
import '../../../../variable/variable.dart';
import '../../../order/order_distination.dart';
import '../../auth/Login/login_screen.dart';
import '../../Profile/profile.dart';
import '../../chat_page.dart';
import '../../contact_send.dart';

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
    return ScreenUtilInit(
        builder: () => Drawer(
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
                          Positioned(
                              top: 10,
                              left: 110,
                              child: CircleAvatar(
                                child: icon_apps,
                                radius: 60,
                                backgroundColor: Color(0xff5E5486),
                              )),
                          Positioned(
                              bottom: 10,
                              //left: 015,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Bienvenue ,".tr,
                                          style: TextStyle(
                                            fontSize: 22.sm,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'pour une experience optimisee , '.tr,
                                          style: TextStyle(fontSize: 18.sm),

                                          //  stepGranularity: 5.0,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'veuillez vous connecter'.tr,
                                          style: TextStyle(
                                            fontSize: 18.sm,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 12, right: 12),
                      child: MaterialButton(
                        color: const Color(0xffB68451),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        onPressed: () async {
                          verify_update = false;
                          if (region!.isEmpty) {
                            await ServicesRgion.getUsers().then(
                              (regions) {
                                setState(() {
                                  region = regions!;
                                });
                              },
                            );
                          }

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
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'DEPOSER UNE ANNONCE'.tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sm),
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
                      child: isLogin == true
                          ? GestureDetector(
                              onTap: () {
                                Get.to(Profile());
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icon/nav_menu/person.svg',
                                    width: 25,
                                    height: 25,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Tableau De Bord'.tr,
                                      style: TextStyle(fontSize: 20.sm))
                                ],
                              ))
                          : GestureDetector(
                              onTap: () {
                                Get.to(LoginScreen());
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icon/nav_menu/person.svg',
                                    width: 25,
                                    height: 25,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text('Se connecter'.tr,
                                      style: TextStyle(fontSize: 20.sm))
                                ],
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    isLogin == true
                        ? Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: GestureDetector(
                                onTap: () async {
                                  isLogin = false;
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.remove('token');
                                  await prefs.remove('username');
                                  setState(() {
                                    contact = [];
                                    indexPage=true;
                                    isCamindingfrom = false;
                                  });

                                  Get.offAll( RoutingScreen());
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icon/logout.svg',
                                        width: 25,
                                        height: 25,
                                        matchTextDirection: true),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text('Se Déconnecter'.tr,
                                        style: TextStyle(fontSize: 20.sm))
                                  ],
                                )),
                          )
                        : Container(),
                    isLogin == true
                        ? const SizedBox(height: 15)
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: GestureDetector(
                        onTap: ()=>Get.to(ChatPage()),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icon/nav_menu/cc-chat.svg',
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text('Contact'.tr, style: TextStyle(fontSize: 20.sm))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: GestureDetector(
                        onTap: () {
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
                            Text('favoris'.tr,
                                style: TextStyle(fontSize: 20.sm))
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
                            child: Text(
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
                    GestureDetector(
                      onTap: ()=>Get.to(ContactSend(idexiste: true,)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icon/nav_menu/telephone.svg',
                              width: 25,
                              height: 25,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text('Contactez nous'.tr,
                                style: TextStyle(fontSize: 20.sm))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 12, right: 12),
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
                            child: Text('Informations'.tr,
                                style: TextStyle(fontSize: 20.sm)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
