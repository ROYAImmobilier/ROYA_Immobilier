import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListView_in_Detalis extends StatelessWidget {
  const ListView_in_Detalis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () =>
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          child: Stack(
            children: [
              Container(
                child: const Text(
                  'À vendre',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                padding: const EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 10.h, left: 10.w),
                //width: 50.h,
                // height: 20,
                decoration: const BoxDecoration(
                    color: Color(0xff9787cc),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              )
            ],
          ),
          margin: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
          height: 100.h,
          width: 150.w,
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: ExactAssetImage('assets/images/bac.jpg'),
                fit: BoxFit.fill,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r))),
        ),
        Container(
          margin: EdgeInsets.only(right: 20.w, left: 20.w),
          height: 25.h,
          width: 150.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  'Villa de 400 m²',
                  style: TextStyle(fontSize: 10),
                ),
                Text('502 0000 Dhs', style: TextStyle(fontSize: 10))
              ]),
        )
      ]),
    );
  }
}
