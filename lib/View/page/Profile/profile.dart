import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../Model/cityrepo.dart';
import '../../../Model/ModelAnnonce.dart';
import '../../../Model/repositery.dart';
import '../../../cashd_image/image.dart';
import '../../../variable/variable.dart';
import '../../order/order_distination.dart';
import 'detaille_profile.dart';
import '../auth/Login/components/body.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);
  List<String> iconability = [];
  List<String> innerAbility = [];
  List<String> MainAbilities = [];
  List<String> AdditionalAbilities = [];
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> iconability = [];

  late int v = 0;
  List<ModelAnnonce> Poste = [];
  List<ModelAnnonce> PosteValide = [];
  List<ModelAnnonce> PosteNonValide = [];

  Color colorPost = Colors.blue;
  Color colorPosteValide = Colors.white;
  Color colorPosteNonValide = Colors.white;

  reloud() async {
    allAnnonceLogin = [];
    PosteNonValide = [];
    Poste = [];
    PosteValide = [];

    var response_1 = await http.get(
        Uri.parse('https://dashboard.royaimmo.ma/api/annonces/?limit=500'),
        headers: {
          //HttpHeaders.authorizationHeader:token_1.toString(),
          'Authorization': 'Bearer $token_global'
        });


    if (response_1.statusCode == 200) {
      final responseJsoon = json.decode(response_1.body);
      final responseJson = responseJsoon["data"];
      setState(() {
        for (Map annoncelogin in responseJson) {
          allAnnonceLogin.add(ModelAnnonce.fromJson(annoncelogin.cast()));
        }
    print(response_1.body);
        setState(() {
          Poste = allAnnonceLogin;
          for (int i = 0; i < Poste.length; i++) {
            if (Poste[i].validated == 1) {
              PosteValide.add(Poste[i]);
            } else {
              PosteNonValide.add(Poste[i]);
            }
          }
        });
      });
    }
  }

  _getRequests() async {
    reloud();
  }

  @override
  void initState() {
    setState(() {
      reloud();
      Poste = [];
      PosteNonValide = [];
      PosteValide = [];
      Poste = allAnnonceLogin;
      for (int i = 0; i < Poste.length; i++) {
        if (Poste[i].validated == 1) {
          PosteValide.add(Poste[i]);
        } else {
          PosteNonValide.add(Poste[i]);
        }
      }
    });
    super.initState();

  }

  String getSulg(id) {
    return "";
  }

  @override
  Widget build(BuildContext context) {


    if (relaod == true) {
      reloud();
      relaod = false;
    }
    getdate(int index) async {
      setState(() {
        progressdetille = true;
      });

      Navigator.of(context)
          .push(
            MaterialPageRoute(
                builder: (_) => DetailleProfile(
                      data: Poste[index],
                    )),
          )
          .then((val) => val ? _getRequests() : null);

      // Get.to(DetailleProfile(
      //   images: images,
      //   data: Poste[index],
      // ),);
      setState(() {
        progressdetille = false;
      });
    }

    return ScreenUtilInit(
      builder: () => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color(0xFFDDECF2).withOpacity(0.35),
            title: Center(
              child: SvgPicture.asset(
                'assets/icon/logo-roya.svg',
                width: 40,
                height: 40,
              ),
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        ClipPath(
                          clipper: CustomClipPath(),
                          child: Container(
                            //height: MediaQuery.of(context).size.height/1.9,
                            width: Get.width,
                            color: const Color(0xFFDDECF2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 20, right: 20, bottom: 5),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 50.0,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color(0xFFDDECF2).withOpacity(0.35),
                                      backgroundImage:  NetworkImage(
                                        "https://dashboard.royaimmo.ma/${avatar}",
                                      ),
                                      radius: 45.0,
                                    ),
                                  ),
                                ),
                                Text(username),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        MaterialButton(
                                          minWidth: 51,
                                          height: 51,
                                          elevation: 6,
                                          onPressed: () {
                                            setState(() {
                                              Poste = [];
                                              Poste = PosteNonValide;
                                              colorPost = Colors.white;
                                              colorPosteValide = Colors.white;
                                              colorPosteNonValide = Colors.blue;
                                              v = 2;
                                            });
                                          },
                                          color: colorPosteNonValide,
                                          padding: EdgeInsets.zero,
                                          child: Text(
                                              PosteNonValide.length.toString()),
                                          shape: const CircleBorder(),
                                        ),
                                        Text(
                                          'Non valider'.tr,
                                          //  style: Get.theme.textTheme.bodyText1,
                                        ).marginOnly(top: 10),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 60),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          MaterialButton(
                                            minWidth: 51,
                                            height: 51,
                                            elevation: 6,
                                            onPressed: () {
                                              setState(() {
                                                v = 0;
                                                Poste = [];
                                                Poste = allAnnonceLogin;
                                                colorPost = Colors.blue;
                                                colorPosteValide = Colors.white;
                                                colorPosteNonValide =
                                                    Colors.white;
                                              });
                                            },
                                            color: colorPost,
                                            padding: EdgeInsets.zero,
                                            child: Text(allAnnonceLogin.length
                                                .toString()),
                                            shape: const CircleBorder(),
                                          ),
                                          Text(
                                            'Post'.tr,
                                            //  style: Get.theme.textTheme.bodyText1,
                                          ).marginOnly(top: 10),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        MaterialButton(
                                          minWidth: 51,
                                          height: 51,
                                          elevation: 6,
                                          onPressed: () {
                                            setState(() {
                                              Poste = [];
                                              Poste = PosteValide;
                                              colorPost = Colors.white;
                                              colorPosteValide = Colors.blue;
                                              colorPosteNonValide =
                                                  Colors.white;
                                              v = 1;
                                            });
                                          },
                                          color: colorPosteValide,
                                          padding: EdgeInsets.zero,
                                          child: Text(
                                              PosteValide.length.toString()),
                                          shape: const CircleBorder(),
                                        ),
                                        Text(
                                          'Valider'.tr,
                                          // style: Get.theme.textTheme.bodyText1,
                                        ).marginOnly(top: 10),
                                      ],
                                    ),
                                  ],
                                ).marginOnly(bottom: 60),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Stack(
                        children: [
                          Poste.length != 0
                              ? ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: Poste.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      getdate(index);
                                    },
                                    child: Slidable(
                                      key: UniqueKey(),
                                      startActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              flex: 2,
                                              autoClose: true,
                                              label: 'Update'.tr,
                                              onPressed: (context) async {
                                                if (!verify_region)
                                                  await ServicesRgion.getUsers()
                                                      .then(
                                                    (regions) {
                                                      setState(() {
                                                        region = regions!;
                                                        verify_region = true;
                                                      });
                                                    },
                                                  );
                                                //amar

                                                //  verify = true;

                                                // Get.to(Add_Annonce());
                                                // reloud();

                                                Get.defaultDialog(
                                                    title: "Modification",
                                                    textCancel: "Cancel".tr,
                                                    textConfirm: "yes".tr,
                                                    middleText:
                                                        "Are you wante to modifier ?"
                                                            .tr,
                                                    onCancel: () {
                                                      Get.back();
                                                    },
                                                    onConfirm: () {
                                                      Get.back();
                                                      Get.to(Add_Annonce(
                                                        data: Poste[index],
                                                      ));
                                                    });

                                                verify_update = true;
                                                //  Get.to(Add_Annonce());
                                                // setState(() {
                                                //   reloud();
                                                //
                                                // });
                                                //delete
                                              },
                                              backgroundColor:
                                                  const Color(0xff5E5480),
                                              foregroundColor: Colors.white,
                                              icon: Icons.update,
                                            ),
                                          ]),
                                      endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        dismissible:
                                            DismissiblePane(onDismissed: () {
                                          Get.defaultDialog(
                                              title: "Supprimer",
                                              textCancel: "Cancel".tr,
                                              textConfirm: "yes".tr,
                                              middleText:
                                                  "Are you want to delete ?".tr,
                                             // barrierDismissible: false,
                                              onCancel: () {
                                                setState(() {
                                                  Navigator.pop(context);
                                                });
                                              },
                                              onConfirm: () async {
                                                await ModelAnnonceRepository.deleteitem(
                                                    id: Poste[index]
                                                        .id
                                                        .toString());
                                               Navigator.pop(context);
                                              });
                                        }),
                                        children: [
                                          SlidableAction(
                                            onPressed: (context) {
                                              Get.defaultDialog(
                                                  title: "Supprimer",
                                                  textCancel: "Cancel".tr,
                                                  textConfirm: "yes".tr,
                                                  middleText:
                                                      "Are you want to delete ?"
                                                          .tr,
                                                //  barrierDismissible: false,
                                                  onCancel: () {
                                                     Get.back();

                                                  },
                                                  onConfirm: () async {
                                                    await ModelAnnonceRepository
                                                        .deleteitem(
                                                            id: Poste[index]
                                                                .id
                                                                .toString());

                                                    setState(() {
                                                      reloud();
                                                    });
                                                   Get.back();
                                                  });
                                            },
                                            label: "Delete".tr,
                                            backgroundColor: Color(0xFFFE4A49),
                                            foregroundColor: Colors.white,
                                            icon: Icons.delete,
                                          ),
                                        ],
                                      ),
                                      child: Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: Stack(
                                            children: [
                                              Container(
                                                child: cachedImage(
                                                  "https://dashboard.royaimmo.ma/images/annonces/${Poste[index].cover}",
                                                ),
                                                height: 130.h,
                                                width: 150.w,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10)),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 150.w),
                                                height: 130.h,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10)),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10.h,
                                                                left: 10.w),
                                                        child: Text(
                                                          Poste[index]
                                                                  .price
                                                                  .toString() +
                                                              ' dh',
                                                          style: TextStyle(
                                                            fontSize: 18.sp,
                                                            color: Color(
                                                              0xffb58350,
                                                            ),
                                                          ),
                                                        )),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 35.h,
                                                          left: 10.w),
                                                      child: Text(
                                                        Poste[index].title,
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                        ),
                                                      ),
                                                    ),
                                                    // Positioned(
                                                    //     top: -5.h,
                                                    //     right: 0,
                                                    //     child: Align(alignment:Alignment.topRight,child: IconButton(onPressed: (){},
                                                    //         icon: const Icon( Icons.more_vert)))),
                                                    Positioned(
                                                      bottom: -10,
                                                      right: -2,
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        // child: IconButton(
                                                        //   onPressed: ()async {
                                                        //
                                                        //
                                                        //     await  ModelAnnonceRepository.deleteitem(id: Poste[index].id.toString());
                                                        //     setState(() {
                                                        //       if(v==0) {
                                                        //         allAnnonceLogin.remove(
                                                        //             Poste[index]);
                                                        //       }
                                                        //       else if (v==1) {
                                                        //         allAnnonceLogin.remove(
                                                        //             PosteValide[index]);
                                                        //       }else{
                                                        //         allAnnonceLogin.remove(
                                                        //             PosteNonValide[index]);
                                                        //       }
                                                        //       PosteNonValide=[];
                                                        //       Poste = [];
                                                        //       PosteValide = [];
                                                        //       Poste = allAnnonceLogin ;
                                                        //       for(int i =0 ; i<Poste.length ; i++){
                                                        //         if(Poste[i].validated==1){
                                                        //           PosteValide.add(Poste[i]);
                                                        //         }else{
                                                        //           PosteNonValide.add(Poste[i]);
                                                        //         }
                                                        //       }
                                                        //     });
                                                        //
                                                        //
                                                        //   },
                                                        //   icon: Icon(Icons.delete,
                                                        //       color: Colors.black54),
                                                        // ),
                                                      ),
                                                    ),

                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 85.h,
                                                          left: 10.w),
                                                      child: Wrap(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .location_on_rounded,
                                                                size: 14,
                                                              ),
                                                              Text(
                                                                Poste[index]
                                                                    .region,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12.sp),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.home,
                                                                size: 14,
                                                              ),
                                                              Text(
                                                                Poste[index]
                                                                    .city,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12.sp),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/notdata.svg',
                                        width: 100,
                                        height: 100,
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Text(
                                        'My Annonce is Empty',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path? path = Path();
    path.lineTo(0, size.height - 70);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 70);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
