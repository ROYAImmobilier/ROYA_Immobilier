
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              color: Color.fromRGBO(166, 201, 219, 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  SizedBox(height: 24.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    color: Color.fromRGBO(246, 250, 252, 1),
                    height: 60.h,
                    child: Column(
                      children: [
                        Text(
                          "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(77, 77, 77, 1)),
                        ),
                        Text(
                          "Sorry !  ".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(77, 77, 77, 1)),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    color: Color.fromRGBO(246, 250, 252, 1),
                    height: 93.h,
                    child: Text(
                      "this feature is not yet available in this version of the application ".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(77, 77, 77, 1)),
                    ),
                  ),
                  Container(
                    height: 100.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icon/logo-roya.svg",
                          width: 46.0.h,
                          height:46.0.h,
                          // color: Color(0xFFB3B3B3),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "This feature will be".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color.fromRGBO(0, 157, 205, 1)),
                            ),
                            Text(
                              "available".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 157, 205, 1)),
                            ),
                            Text(
                              "soon in the application".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Color.fromRGBO(0, 157, 205, 1)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
