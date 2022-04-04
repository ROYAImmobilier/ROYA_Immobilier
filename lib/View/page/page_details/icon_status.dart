import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../screenSize/screenSized.dart';

class Icon_Status extends StatelessWidget {
  const Icon_Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Screenwidth = MediaQuery.of(context).size.width;
    var Screenheight = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
        builder: () => Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: ScreenSized.Avatar(
                            Screenwidth, Screenheight),
                        child: SvgPicture.asset(
                            'assets/icon/annonces/building.svg',
                            width: 20.w,
                            height: 20.h,
                            color: Color(0xffC0A280)),
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Text(
                      'Apartement',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff8a8a8a),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius:ScreenSized.Avatar(
                            Screenwidth, Screenheight),
                        child: SvgPicture.asset(
                            'assets/icon/annonces/House.svg',
                            width: 20.w,
                            height: 20.h,
                            color: Color(0xffC0A280)),
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Text(
                      'Maison',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff8a8a8a),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // padding: EdgeInsets.only(top: 10.h, left: 10.w),
                      //alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: ScreenSized.Avatar(
    Screenwidth, Screenheight),
                        child: SvgPicture.asset(
                            'assets/icon/annonces/Bureau.svg',
                            width: 20.w,
                            height: 20.h,
                            color: Color(0xffC0A280)),
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Center(
                      child: Text(
                        'Bureau',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff8a8a8a),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // padding: EdgeInsets.only(top: 10.h, left: 10.w),
                      //alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: ScreenSized.Avatar(
    Screenwidth, Screenheight),
                        child: SvgPicture.asset(
                            'assets/icon/annonces/Bureau.svg',
                            width: 20.w,
                            height: 20.h,
                            color: Color(0xffC0A280)),
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Center(
                      child: Text(
                        'Terrain',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff8a8a8a),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // padding: EdgeInsets.only(top: 10.h, left: 10.w),
                      //alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: ScreenSized.Avatar(
    Screenwidth, Screenheight),
                        child: SvgPicture.asset('assets/icon/annonces/Tray.svg',
                            width: 20.w,
                            height: 20.h,
                            color: Color(0xffC0A280)),
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Center(
                      child: Text(
                        'Plateau',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff8a8a8a),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // padding: EdgeInsets.only(top: 10.h, left: 10.w),
                      //alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius:ScreenSized.Avatar(
    Screenwidth, Screenheight),
                        child: SvgPicture.asset('assets/icon/annonces/Tray.svg',
                            width: 20.w,
                            height: 20.h,
                            color: Color(0xffC0A280)),
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Center(
                      child: Text(
                        'Villa',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff8a8a8a),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                )
              ],
            ));
  }
}
