import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Liste_Annonce extends StatefulWidget {
  late String image;
  var data;
  Liste_Annonce({required this.image, required this.data});

  @override
  State<Liste_Annonce> createState() => _Liste_AnnonceState();
}

class _Liste_AnnonceState extends State<Liste_Annonce> {
  bool fav = true;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.fill,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r)),
              ),
              width: 150.w,
              height: 100.h,
            ),
            Container(
              width: 150.w,
              height: 75.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 5.h, left: 10.w),
                          child: Text(
                            widget.data['price'].toString(),
                            style: TextStyle(
                                fontSize: 14.sp, color: Color(0xffb58350)),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 0.h, right: 10.w),
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
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0.h),
                    child: Text(
                      widget.data['title'],
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 11.sp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h, left: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 12.sp,
                        ),
                        Text(
                          "data",
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.home,
                          size: 11.sp,
                        ),
                        Text(
                          " data ",
                          style: TextStyle(fontSize: 11.sp),
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
    );
  }
}
