import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Liste_Annonce extends StatelessWidget {
  late String image;
  Liste_Annonce({required this.image});
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
                  image: NetworkImage(image),
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
                            "250000 dh",
                            style: TextStyle(
                                fontSize: 14.sp, color: Color(0xffb58350)),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 5.h, right: 10.w),
                          child: Icon(
                            Icons.favorite_border,
                            size: 20.sp,
                          ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    child: Text(
                      "Ville casablanca et grand",
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
