import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Liste_Annonce_2 extends StatelessWidget {
  late String image;
  Liste_Annonce_2({required this.image});

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size.width;
    print(sizeScreen);
    return ScreenUtilInit(
        splitScreenMode: true,
        builder: () {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              margin: EdgeInsets.only(top: 20.h, left: 20.w),
              width: 150.w,
              height: 120.h,
              child: Row(
                children: [
                  Container(
                    width: 140.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r))),
                  ),
                  Container(
                    width: 180.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r))),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5.h, right: 5.w),
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.more_vert,
                            size: 15.sp,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5.h, left: 5.w),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "250000 dh",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Color(
                                  0xffb58350,
                                ),
                              ),
                            )),
                        Container(
                          alignment: Alignment.topLeft,
                          // width: 350.w,
                          margin: EdgeInsets.only(top: 3.h, left: 5.w),
                          child: Text(
                            "Ville casablanca et grand  ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.w),
                          padding: EdgeInsets.only(top: 20.h),
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                size: 12.sp,
                              ),
                              Text("data"),
                              Icon(
                                Icons.home,
                                size: 11.sp,
                              ),
                              const Text(" data "),
                              SizedBox(
                                width: sizeScreen > 320 ? 70.w : 50.w,
                              ),
                              Container(
                                //margin: EdgeInsets.symmetric(horizontal: 15.w),
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
