import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'listeanonnce_2.dart';

final colors = Color(0xefefef);

class StackWidget_2 extends StatelessWidget {
  const StackWidget_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Stack(
        children: [
          //const SizedBox(width: 50),
          Container(
            // margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(0xffefefef),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r))),
            child: Padding(
              padding: EdgeInsets.only(left: 13.w, bottom: 30.h),
              child: Row(
                children: [
                  Icon(Icons.clean_hands_outlined),
                  Text(
                    " Immobulier Neuf",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            width: double.infinity.w,
            height: 70.h,
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.0.h),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffb58350),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r))),
              width: MediaQuery.of(context).size.width.toDouble(),
              height: 170.h,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 2.w, right: 2.w, top: 5, bottom: 20),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          color: const Color(0xffb58350),
                          child: Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: ExactAssetImage('assets/images/bac.jpg'),
                                fit: BoxFit.fill,
                              ),
                              border: Border.all(
                                color: const Color(0xff857c88),
                                width: 3.w,
                              ),
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r)),
                            ),
                            width: 150.w,
                            height: 100.h,
                          ),
                        ),
                      ));
                    }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 190.0.h),
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffefefef),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20))),
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return const Liste_Annonce_2();
                    })),
          ),
        ],
      ),
    );
  }
}
