import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roya_immobilie/View/page/Home/widget/drawerpage.dart';
import 'package:roya_immobilie/View/page/page_details/details.dart';
import 'package:roya_immobilie/View/page/page_details/icon_status.dart';
import 'package:roya_immobilie/View/routing_screen.dart';

import '../../Controller/AnonceController.dart';
import '../../Model/anonce_model_favote.dart';
import '../../Model/joke.dart';
import '../../data.dart';
import 'Home/category_items.dart';


class HomeC extends StatelessWidget {
  List<Joke> select=[] ;
  @override
  Widget build(BuildContext context) {
    int r = Random().nextInt(allAnnonce.length) ;
    return ScreenUtilInit(
      builder: () => Scaffold(
        drawer: DrawerPage(),
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
          child: Container(
            child:
              Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(

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
                                //
                                //
                                // IconButton(
                                //     onPressed: () {},//=> Get.to(SearchFiltter()),
                                //     icon: SvgPicture.asset(
                                //       'assets/icon/filter.svg',
                                //       width: 20,
                                //       height: 20,
                                //     ))
                                //
                                //
                              ],
                            ),
                          ),
                          width: double.infinity,
                          height: 80.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xffefefef),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 252, 252, 252),
                                    blurRadius: 60,
                                    spreadRadius: 16.0
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.r),
                                  topLeft: Radius.circular(20.r))),
                          width: MediaQuery.of(context).size.width.toDouble(),
                          height: 110.h,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: 15.h, left: 2.w, right: 2.w),
                              child:  ListView.builder(
                                  itemCount: dataCategory.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context,i) {
                                    return   GestureDetector(
                                      onTap: () {
                                        select = [];
                                        for(int k=0 ;k<allAnnonce.length;k++){
                                          if(allAnnonce[k].propertyType.contains(dataCategory[i].name)){
                                            select.add(allAnnonce[k]);
                                          }
                                        }
                                        Get.to(CategoryItems(
                                            icon : dataCategory[i].icon,
                                            title: dataCategory[i].name,
                                            data:select, leng: select.length));
                                      },
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 30,
                                                  child: SvgPicture.asset(
                                                      dataCategory[i].icon,
                                                      width: 20.w,
                                                      height: 20.h,
                                                      color: Color(0xffC0A280)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.w,
                                              ),
                                              Text(
                                                dataCategory[i].name,
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Color(0xff8a8a8a),
                                                ),
                                              ),

                                            ],

                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                        ],
                                      ),
                                    );
                                  }),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 220),
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(children: [
                          GestureDetector(
                            onTap: ()=>Get.to(Details(image: allAnnonce[r].cover, data:  allAnnonce[r])),
                            child: Column(children: [
                              Container(
                                margin:
                                EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
                                height: 150.h,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://dashboard.royaimmo.ma/images/annonces/"+allAnnonce[r].cover
                                      ),
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
                                    child: Wrap(

                                      children: [
                                        Text(
                                          allAnnonce[r].title,
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                        SizedBox(width: 20,),
                                        Text(
                                          '${allAnnonce[r].price} Dhs',
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
                                          allAnnonce[r].address,
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
                                          Text(
                                            "${allAnnonce[r].bedrooms} Beds",
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
                                          Text(
                                            "${allAnnonce[r].bathrooms} Boths",
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
                                          Text(
                                            "${allAnnonce[r].area} m²",
                                            style: TextStyle(color: Color(0xff8a8a8a)),
                                          )
                                        ]),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            ],),
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
                              itemCount: allAnnonce.length,
                              itemBuilder: (context, i) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: ()=>Get.to(Details(image: allAnnonce[i].cover, data: allAnnonce[i])),
                                      child: Padding(
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
                                                          image: NetworkImage("https://dashboard.royaimmo.ma/images/annonces/"+allAnnonce[i].cover),
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
                                                      child: Wrap(

                                                        children: [
                                                          Text(
                                                            allAnnonce[i].title,
                                                            maxLines: 1,

                                                            style:
                                                            TextStyle(fontSize: 12.sp),
                                                          ),
                                                          SizedBox(width: 15,),
                                                          Text(
                                                            "${allAnnonce[i].price} dhs",
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
                                                          allAnnonce[i].address,
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 12.sp),
                                                        ),
                                                        Row(
                                                          children: [
                                                            GetBuilder<AnnonceController>(
                                                              init: AnnonceController(),
                                                              builder: (controller) => IconButton(
                                                                onPressed: () {
                                                                  controller.addProducts(FavCategoryItem(
                                                                    id: allAnnonce[i].id,
                                                                    region: allAnnonce[i].region,
                                                                    city: allAnnonce[i].city,
                                                                    title: allAnnonce[i].title,
                                                                    cover: allAnnonce[i].cover,
                                                                    apartment: allAnnonce[i].apartment,
                                                                    bedrooms:allAnnonce[i].bedrooms,
                                                                    bathrooms: allAnnonce[i].bathrooms,
                                                                    kitchens: allAnnonce[i].kitchens,
                                                                    address: allAnnonce[i].address,
                                                                    description: allAnnonce[i].description,
                                                                    phone1: allAnnonce[i].phone1,
                                                                    advertiser: allAnnonce[i].advertiser,
                                                                    area: allAnnonce[i].area.toString(),
                                                                    quartier: allAnnonce[i].quartier,
                                                                  ));
                                                                  controller.getAllProducts();
                                                                },
                                                                icon: controller.FavIcon(allAnnonce[i]) == true
                                                                    ? Icon(
                                                                  Icons.favorite,
                                                                  color: Colors.red,
                                                                )
                                                                    : Icon(Icons.favorite_border,
                                                                    color: Colors.red),
                                                              ),
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
                                                              "${allAnnonce[i].bedrooms} Beds",
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
                                                              "${allAnnonce[i].bathrooms} Boths",
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
                                                              "${allAnnonce[i].area} m²",
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
                                      ),
                                    ),

                                    SizedBox(height: 10,)
                                  ],
                                );
                              },
                            ),
                          ),
                        ],),
                      ),
                    ),
                  )
                ],
              )

          ),
        ),
      ),
    );
  }
}
