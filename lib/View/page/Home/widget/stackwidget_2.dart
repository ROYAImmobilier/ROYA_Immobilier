import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'drawerpage.dart';
import 'listeanonnce.dart';
import 'listeanonnce_2.dart';

final colors = Color(0xefefef);

class StackWidget_2 extends StatefulWidget {
  const StackWidget_2({Key? key}) : super(key: key);

  @override
  State<StackWidget_2> createState() => _StackWidget_2State();
}

class _StackWidget_2State extends State<StackWidget_2> {
  List<String> imge = [
    'https://st2.depositphotos.com/1007034/9755/i/950/depositphotos_97554836-stock-photo-luxurious-villa-with-pool.jpg'
        'https://st2.depositphotos.com/1007034/6589/i/950/depositphotos_65894943-stock-photo-luxury-villa-bunker.jpg',
    'https://img3.goodfon.com/wallpaper/nbig/5/f4/ssha-newport-beach-dom-villa.jpg',
    'https://i.pinimg.com/originals/0e/3a/5f/0e3a5f409b2bf6e1fa5bcb52a59a17c5.jpg',
    'https://s1.1zoom.me/big0/202/414713-svetik.jpg',
    'https://ws.pap.fr/cdnV1/57d80de0eccc22495148005e/57d80de0eccc22495148005e-1516023084-1024x546.jpg',
    'https://www.villanovo.fr/photos/5136/marrakech-villa-melka-4202355915da86556526203.02934761.1920.jpg',
    'https://www.marbella-hills-homes.com/cms/wp-content/uploads/2018/05/mh2998_1_villa-and-pool.jpg'
  ];
  bool grid = true;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Stack(
        children: [
          //const SizedBox(width: 50),
          Container(
            //margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(0xffefefef),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r))),
            child: Padding(
              padding: EdgeInsets.only(left: 13.w, bottom: 30.h, right: 13.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icon/annonces/hand.svg',
                          width: 25, height: 25, matchTextDirection: true),
                      Text(
                        " Immobulier Neuf",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        grid = !grid;
                      });
                    },
                    icon: grid
                        ? SvgPicture.asset('assets/icon/content vertical.svg')
                        : SvgPicture.asset(
                            'assets/icon/content_horizontal.svg'),
                  )
                ],
              ),
            ),
            width: double.infinity,
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
                  padding: EdgeInsets.only(
                      bottom: 30.0.h, top: 10.h, left: 2.w, right: 2.w),
                  child: ListView.builder(
                      itemCount: imge.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return Expanded(
                            child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          color: const Color(0xffb58350),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(imge[i]),
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
                        ));
                      })),
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
                // height: double.infinity,
                child: grid
                    ? GridView.builder(
                        itemCount: imge.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                            top: 15.h, bottom: 15.h, left: 15.w, right: 15.w),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 202.h,
                            mainAxisExtent:
                                (MediaQuery.of(context).size.width * 0.56).h,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 2.h,
                            mainAxisSpacing: 2.w),
                        itemBuilder: (BuildContext ctx, index) {
                          return Liste_Annonce(image: imge[index]);
                        })
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: imge.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return index == imge.length
                              ? SizedBox(
                                  height: 25.h,
                                )
                              : Liste_Annonce_2(image: imge[index]);
                        })),
          ),
        ],
      ),
    );
  }
}
