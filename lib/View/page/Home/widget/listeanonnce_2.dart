import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Liste_Annonce_2 extends StatefulWidget {
  late String image;
  late var data;
  Liste_Annonce_2({required this.image, required this.data});

  @override
  State<Liste_Annonce_2> createState() => _Liste_Annonce_2State();
}

class _Liste_Annonce_2State extends State<Liste_Annonce_2> {
  bool fav = true;
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
              padding: EdgeInsets.only(left: 5.w),
              margin: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
              width: double.infinity,
              height: 120.h,
              child: Row(
                children: [
                  Container(
                    width: 140.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r))),
                  ),
                  Container(
                    width: 200.w,
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
                            margin: EdgeInsets.only(
                                top: 5.h, left: 5.w, right: 5.w),
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.data['price'].toString() + ' dh',
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
                            widget.data['title'],
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              size: 12.sp,
                            ),
                            Text(widget.data['region']),
                            SizedBox(
                              width: 2.w,
                            ),
                            Icon(
                              Icons.home,
                              size: 11.sp,
                            ),
                            Text(widget.data['city']),
                            Stack(children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Container(
                                    // margin: EdgeInsets.only(right: 15.w),
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          fav = !fav;
                                        });
                                      },
                                      icon: fav
                                          ? Icon(
                                              Icons.favorite_border,
                                              size: 15.sp,
                                            )
                                          : Icon(
                                              Icons.favorite_outlined,
                                              color: Colors.red,
                                              size: 15.sp,
                                            ),
                                    )),
                              ),
                            ]),
                          ],
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
