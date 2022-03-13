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
            width: double.infinity,
            height: 70,
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
                padding: EdgeInsets.only(bottom: 15.0.h),
                child: Row(
                  children: [
                    Expanded(
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
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                        width: 150.w,
                        height: 100.h,
                      ),
                    )),
                    Expanded(
                        child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      color: const Color(0xffb58350),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff857c88),
                            width: 3.w,
                          ),
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        width: 150.w,
                        height: 100.h,
                      ),
                    )),
                    Expanded(
                        child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      color: const Color(0xffb58350),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff857c88),
                            width: 3.w,
                          ),
                          // color: Colors.blue,
                          borderRadius:
                              BorderRadius.all(const Radius.circular(20)),
                        ),
                        width: 150.w,
                        height: 100.h,
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 190.0.h),
            child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xffefefef),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
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
