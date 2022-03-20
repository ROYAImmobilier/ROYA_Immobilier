import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/page/page_details/icon_status.dart';
import 'package:roya_immobilie/View/page/searchfilter.dart';

class HomeC extends StatelessWidget {
  const HomeC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imge = [
      'https://st2.depositphotos.com/1007034/9755/i/950/depositphotos_97554836-stock-photo-luxurious-villa-with-pool.jpg'
          'https://st2.depositphotos.com/1007034/6589/i/950/depositphotos_65894943-stock-photo-luxury-villa-bunker.jpg',
      'https://img3.goodfon.com/wallpaper/nbig/5/f4/ssha-newport-beach-dom-villa.jpg',
      'https://i.pinimg.com/originals/0e/3a/5f/0e3a5f409b2bf6e1fa5bcb52a59a17c5.jpg',
      'https://s1.1zoom.me/big0/202/414713-svetik.jpg',
      'https://ws.pap.fr/cdnV1/57d80de0eccc22495148005e/57d80de0eccc22495148005e-1516023084-1024x546.jpg',
      'https://www.villanovo.fr/photos/5136/marrakech-villa-melka-4202355915da86556526203.02934761.1920.jpg',
      'https://www.marbella-hills-homes.com/cms/wp-content/uploads/2018/05/mh2998_1_villa-and-pool.jpg'
    ];
    return ScreenUtilInit(
      builder: () => Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Icon(
            Icons.star,
            color: Colors.black,
          )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icon/search.svg',
                width: 20,
                height: 20,
                color: Colors.black,
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
        body: Container(
          color: Color(0xffefefef),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 35.h),
                //margin: EdgeInsets.only(bottom: 60.h),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 252, 252),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r))),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icon/annonces/hand.svg',
                              width: 25, height: 25, matchTextDirection: true),
                          Text(
                            " Immobulier Neuf",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                      // IconButton(
                      //     onPressed: () {},//=> Get.to(SearchFiltter()),
                      //     icon: SvgPicture.asset(
                      //       'assets/icon/filter.svg',
                      //       width: 20,
                      //       height: 20,
                      //     ))
                    ],
                  ),
                ),
                width: double.infinity,
                height: 80.h,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50.0.h),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffefefef),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.r),
                                topLeft: Radius.circular(20.r))),
                        width: MediaQuery.of(context).size.width.toDouble(),
                        height: 110.h,
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 15.h, left: 2.w, right: 2.w),
                            child: ListView.builder(
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) {
                                  return const Icon_Status();
                                })),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: Row(
                        children: [
                          Text(
                            'Annonces',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
                      height: 150.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://st2.depositphotos.com/1007034/6589/i/950/depositphotos_65894943-stock-photo-luxury-villa-bunker.jpg"),
                            fit: BoxFit.fill,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r))),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.w, left: 20.w),
                      height: 100.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r))),
                      child: Column(children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Villa de 400 m²',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              Text(
                                '5020000 Dhs',
                                style: TextStyle(
                                    fontSize: 14.sp, color: Color(0xffC0A280)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: Colors.grey,
                                size: 12.sp,
                              ),
                              Text(
                                "villa de 400m² en plien Osis",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.sp),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              // margin: EdgeInsets.all(25),
                              child: Row(children: [
                                SvgPicture.asset(
                                  'assets/icon/annonces/bed-sharp.svg',
                                  width: 20.w,
                                  height: 20.h,
                                  matchTextDirection: true,
                                  color: Color(0xff8a8a8a),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Text(
                                  "3 Beds",
                                  style: TextStyle(color: Color(0xff8a8a8a)),
                                )
                              ]),
                            ),
                            Container(
                              // margin: EdgeInsets.all(25),
                              child: Row(children: [
                                SvgPicture.asset(
                                  'assets/icon/annonces/bathroom.svg',
                                  width: 20.w,
                                  height: 20.h,
                                  matchTextDirection: true,
                                  color: Color(0xff8a8a8a),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Text(
                                  "4 Boths",
                                  style: TextStyle(color: Color(0xff8a8a8a)),
                                )
                              ]),
                            ),
                            Container(
                              //  margin: EdgeInsets.all(25),
                              child: Row(children: [
                                SvgPicture.asset(
                                  'assets/icon/m.svg',
                                  width: 20.w,
                                  height: 20.h,
                                  matchTextDirection: true,
                                  color: Color(0xff8a8a8a),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Text(
                                  "400 m²",
                                  style: TextStyle(color: Color(0xff8a8a8a)),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: Row(
                        children: [
                          Text(
                            "Autre Annonces",
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.only(left: 12.w, right: 12.w),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.r),
                                      bottomLeft: Radius.circular(8.r),
                                      topRight: Radius.circular(8.r),
                                      bottomRight: Radius.circular(8.r))),
                              width: double.infinity,
                              height: 110.h,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(imge[i]),
                                              fit: BoxFit.fill),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8.r),
                                              bottomLeft: Radius.circular(8.r),
                                              topRight: Radius.circular(8.r),
                                              bottomRight:
                                                  Radius.circular(8.r))),
                                      width: 100.w,
                                      height: 100.w,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.0.h),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.58,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Mison de 100 m²",
                                                style:
                                                    TextStyle(fontSize: 12.sp),
                                              ),
                                              Text(
                                                "420000 dhs",
                                                style: TextStyle(
                                                    color: Color(0xffC0A280),
                                                    fontSize: 12.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.58,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.location_on_rounded,
                                              color: Colors.grey,
                                              size: 12.sp,
                                            ),
                                            Text(
                                              "villa de 400m² en plien Osis",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.sp),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.favorite_outlined,
                                                  color: Color(0xffC0A280),
                                                ),
                                                Text(
                                                  '4.4',
                                                  style: TextStyle(
                                                      color: Color(0xffC0A280),
                                                      fontSize: 9.sp),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.58,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              // margin: EdgeInsets.all(25),
                                              child: Row(children: [
                                                SvgPicture.asset(
                                                  'assets/icon/annonces/bed-sharp.svg',
                                                  width: 16.w,
                                                  height: 16.h,
                                                  matchTextDirection: true,
                                                  color: Color(0xff8a8a8a),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Text(
                                                  "3 Beds",
                                                  style: TextStyle(
                                                      fontSize: 11.sp,
                                                      color: Color(0xff8a8a8a)),
                                                )
                                              ]),
                                            ),
                                            Container(
                                              // margin: EdgeInsets.all(25),
                                              child: Row(children: [
                                                SvgPicture.asset(
                                                  'assets/icon/annonces/bathroom.svg',
                                                  width: 16.w,
                                                  height: 16.h,
                                                  matchTextDirection: true,
                                                  color: Color(0xff8a8a8a),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Text(
                                                  "4 Boths",
                                                  style: TextStyle(
                                                      fontSize: 11.sp,
                                                      color: Color(0xff8a8a8a)),
                                                )
                                              ]),
                                            ),
                                            Container(
                                              //  margin: EdgeInsets.all(25),
                                              child: Row(children: [
                                                SvgPicture.asset(
                                                  'assets/icon/m.svg',
                                                  width: 16.w,
                                                  height: 16.h,
                                                  matchTextDirection: true,
                                                  color: Color(0xff8a8a8a),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Text(
                                                  "400 m²",
                                                  style: TextStyle(
                                                      fontSize: 11.sp,
                                                      color: Color(0xff8a8a8a)),
                                                )
                                              ]),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
