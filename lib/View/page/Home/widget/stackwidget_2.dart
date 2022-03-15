import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../page_details/details.dart';
import '../../page_details/icon_status.dart';
import '../../searchfilter.dart';
import 'drawerpage.dart';
import 'listeanonnce.dart';
import 'listeanonnce_2.dart';

final colors = Color(0xefefef);

class StackWidget_2 extends StatefulWidget {
  var data;
  int leng;
  StackWidget_2({required this.data, required this.leng});

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
  List<String> imgecate = [
    "https://cdn-icons-png.flaticon.com/512/201/201465.png",
    "https://cdn4.vectorstock.com/i/1000x1000/29/78/cute-villa-black-icon-concept-villa-vector-20952978.jpg",
    "https://cdn.iconscout.com/icon/free/png-256/villa-73-1138931.png",
    "https://w7.pngwing.com/pngs/808/39/png-transparent-house-elite-villas-javea-computer-icons-building-house-angle-building-apartment.png",
    "https://img2.arabpng.com/20180608/fhu/kisspng-computer-icons-building-office-buildings-5b1a218460c0c6.4853580515284391723963.jpg",
  ];
  bool grid = true;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => SingleChildScrollView(
        child: Stack(
          children: [
            //const SizedBox(width: 50),
            Container(
              padding: EdgeInsets.only(bottom: 35.h),
              //margin: EdgeInsets.only(bottom: 60.h),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r))),
              child: Padding(
                padding: EdgeInsets.all(8),
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
                    Row(
                      children: [
                        IconButton(
                            onPressed: () => Get.to(SearchFiltter()),
                            icon: SvgPicture.asset(
                              'assets/icon/filter.svg',
                              width: 20,
                              height: 20,
                            )),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              grid = !grid;
                            });
                          },
                          icon: grid
                              ? SvgPicture.asset(
                                  'assets/icon/content vertical.svg',
                                  width: 20,
                                  color: Colors.black54,
                                  height: 20,
                                )
                              : SvgPicture.asset(
                                  'assets/icon/content_horizontal.svg',
                                  width: 20,
                                  color: Colors.black54,
                                  height: 20,
                                ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              width: double.infinity,
              height: 80.h,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.0.h),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffefefef),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            topLeft: Radius.circular(20.r))),
                    width: MediaQuery.of(context).size.width.toDouble(),
                    height: 110.h,
                    child: Padding(
                        padding:
                            EdgeInsets.only(top: 15.h, left: 2.w, right: 2.w),
                        child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              return const Icon_Status();
                              //   Row(
                              //   children: [
                              //     Column(
                              //       children: [
                              //         Container(
                              //           height: 60.h,
                              //           width: 60.h,
                              //           decoration: BoxDecoration(
                              //               image: DecorationImage(
                              //                 image: NetworkImage(imgecate[i]),
                              //               ),
                              //               color: Colors.white,
                              //               shape: BoxShape.circle,
                              //               border: Border.all(
                              //                   width: 1.w,
                              //                   color: Colors.white)),
                              //         ),
                              //         SizedBox(
                              //           height: 10.w,
                              //         ),
                              //         Text(
                              //           'Partomant',
                              //           style: TextStyle(
                              //               fontSize: 12.sp,
                              //               color: Color(0xffC0A280)),
                              //         )
                              //       ],
                              //     ),
                              //     SizedBox(
                              //       width: 10.w,
                              //     )
                              //   ],
                              // );

                              /* Expanded(
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
                          ));*/
                            })),
                  ),
                ),
                Container(
                    color: Color(0xffefefef),

                    // height: double.infinity,
                    child: grid
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.leng - 1,
                            /* padding: EdgeInsets.only(
                                top: 15.h,
                                bottom: 15.h,
                                left: 15.w,
                                right: 15.w),*/
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 202.h,
                                    mainAxisExtent:
                                        (MediaQuery.of(context).size.width *
                                                0.56)
                                            .h,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 2.h,
                                    mainAxisSpacing: 2.w),
                            itemBuilder: (BuildContext ctx, index) {
                              return GestureDetector(
                                  onTap: () => Get.to(Details(
                                      image: widget.data[index]['cover'])),
                                  child: Liste_Annonce(
                                    image: widget.data[index]['cover'],
                                    data: widget.data[index],
                                  ));
                            })
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: imge.length + 1,
                            itemBuilder: (BuildContext context, int index) {
                              return index == imge.length
                                  ? SizedBox(
                                      height: 25.h,
                                    )
                                  : GestureDetector(
                                      onTap: () =>
                                          Get.to(Details(image: imge[index])),
                                      child:
                                          Liste_Annonce_2(image: imge[index]));
                            })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
