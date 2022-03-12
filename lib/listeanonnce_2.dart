import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Liste_Annonce_2 extends StatelessWidget {
  const Liste_Annonce_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size.width;
    // print(sizeScreen);
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        splitScreenMode: true,
        builder: () {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/bac.jpg'),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                margin: EdgeInsets.only(top: 14.w, left: 15.w),
                width: 150.w,
                height: 120.h,
              ),
              Container(
                  margin: EdgeInsets.only(top: 14.w, left: 0),
                  //  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  width: 180.w,
                  height: 120.h,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Container(
                      //     height: 15,
                      //     margin: const EdgeInsets.only(
                      //         right: 0, top: 0, left: 155, bottom: 20),
                      //     child: const Icon(Icons.more_vert)),
                      Container(
                          margin: EdgeInsets.only(
                              right: 85.w, top: 15.w, bottom: 0, left: 6.w),
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
                        // width: 350.w,
                        margin: EdgeInsets.only(
                            top: 1.w, right: 85.w, bottom: 15.h, left: 6.w),
                        child: Text(
                          "Ville casablanca et grand dfsdf ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 0.h, left: 12.w),
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
                              Container(
                                child: const Icon(
                                  Icons.favorite_border,
                                  size: 14,
                                ),
                                margin: EdgeInsets.only(left: 45.w),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          );
        });
  }
}
