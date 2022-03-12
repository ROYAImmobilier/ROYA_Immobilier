import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Liste_Annonce_2 extends StatelessWidget {
  const Liste_Annonce_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size.width;
    print(sizeScreen);
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        splitScreenMode: true,
        builder: () {
          return Container(
            margin: EdgeInsets.only(top: 20.h, left: 20.w),
            width: 150.w,
            height: 120.h,
            child: Row(
              children: [
                Container(
                  width: 140.w,
                  height: 120.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/bac.jpg'),
                        fit: BoxFit.fill,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                ),
                Container(
                  width: 180.w,
                  height: 120.h,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5.h, right: 5.w),
                        alignment: Alignment.topRight,
                        child: const Icon(
                          Icons.more_vert,
                          size: 15,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5.h, left: 5.w),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "250000 dh",
                            style: TextStyle(
                              fontSize: 20,
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_rounded,
                                size: 12,
                              ),
                              const Text(" data "),
                              const Icon(
                                Icons.home,
                                size: 11,
                              ),
                              const Text(" data "),
                              SizedBox(
                                width: sizeScreen > 320 ? 70.w : 50.w,
                              ),
                              Container(
                                //margin: EdgeInsets.symmetric(horizontal: 15.w),
                                alignment: Alignment.topRight,
                                child: const Icon(
                                  Icons.favorite_border,
                                  size: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
