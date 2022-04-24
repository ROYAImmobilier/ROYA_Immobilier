import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Model/joke.dart';
import 'package:roya_immobilie/View/page/Home/widget/smallScreen.dart';
import 'package:roya_immobilie/View/page/Home/widget/tabletstackwidget.dart';
import 'package:roya_immobilie/View/page/Home/widget/testplatform.dart';
import '../../../../Model/category.dart';
import '../../../../data.dart';
import '../../../../screenSize/screenSized.dart';
import '../../../routing_screen.dart';
import '../../page_details/details.dart';
import '../../page_details/details_serche.dart';
import '../../searchfilter.dart';
import '../home.dart';
import 'listeanonnce_2.dart';
import 'mobilestackwidget.dart';


final colors = Color(0xefefef);
class StackWidget_2 extends StatefulWidget {
  List<Joke> data;
  int leng;
  StackWidget_2({required this.data, required this.leng});

  @override
  State<StackWidget_2> createState() => _StackWidget_2State();
}

class _StackWidget_2State extends State<StackWidget_2> {
  List<Joke> select = [];
  int j = indexselectCategory ;
  bool grid = true;
  @override
  void initState() {
    for (int k = 0;
    k < allAnnonce.length;
    k++) {
      if (dataCategory[indexselectCategory].name == "All") {
        setState(() {
          select.add(allAnnonce[k]);

        });

      } else if (allAnnonce[k]
          .propertyType
          .contains(dataCategory[indexselectCategory].name)) {
        select.add(allAnnonce[k]);
      }
    }
    setState(() {
      widget.data = select;
      widget.leng = select.length;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var Screenwidth = MediaQuery.of(context).size.width;
    var Screenheight = MediaQuery.of(context).size.height;
    //var ScreenSized=MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder: () => Container(
        height: double.infinity,
        color: const Color(0xffefefef),
        child: Stack(
          children: [
            //const SizedBox(width: 50),

            Container(
              padding: EdgeInsets.only(bottom: 35.h),
              //margin: EdgeInsets.only(bottom: 60.h),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r))),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // SvgPicture.asset('assets/icon/annonces/hand.svg',
                        //     width: 25.w,
                        //     height: 25.h,
                        //     matchTextDirection: true),
                        // Text(
                        //   " Immobulier Neuf",
                        //   style: TextStyle(fontSize: 14.sp),
                        // ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () => Get.to(SearchFiltter(
                              data: widget.data,
                            )),
                            child: SvgPicture.asset(
                              'assets/icon/filter.svg',
                              width: ScreenSized.IconFiltter(
                                  Screenwidth, Screenheight).w
                              ,
                              height: ScreenSized.IconFiltter(
                                  Screenwidth, Screenheight).h
                              ,
                            )),
                        SizedBox(
                          width: 5.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              grid = !grid;
                            });
                          },
                          child: grid
                              ? SvgPicture.asset(
                            'assets/icon/content vertical.svg',
                            width: ScreenSized.IconFiltter(
                                Screenwidth, Screenheight)
                                .w,
                            height: ScreenSized.IconFiltter(
                                Screenwidth, Screenheight)
                                .h,
                            color: Colors.black54,
                          )
                              : SvgPicture.asset(
                            'assets/icon/content_horizontal.svg',
                            width: ScreenSized.IconFiltter(
                                Screenwidth, Screenheight)
                                .w,
                            height: ScreenSized.IconFiltter(
                                Screenwidth, Screenheight)
                                .h,
                            color: Colors.black54,
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



            Positioned(
              top:50.h,
              right: 0,
              left: 0,
              bottom: 0,
              // padding: EdgeInsets.only(top: 50.h),
              child: Container(
                //height: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xffefefef),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r))),
                // width: MediaQuery.of(context).size.width.toDouble(),
                child: Padding(
                  padding:  EdgeInsets.only(top:100.0.h),
                  child: SingleChildScrollView(
                    child: Column(
                        children:[ grid
                            ? ResponsiveLayout_(
                            tabliteBody: TbletGridView(
                              leng: widget.leng,
                              data: widget.data,
                            ),
                            mobileBody: MobileGridView(
                              leng: widget.leng,
                              data: widget.data,
                            ),
                            smallBody: SmallScreen(
                              leng: widget.leng,
                              data: widget.data,
                            ))
                            : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.leng,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () => Get.to(d(
                                    image: widget.data[index].cover,
                                    //?? 'https://c8.alamy.com/compfr/j7kk5a/cabinet-en-bois-aux-fenetres-de-l-appartement-avec-vue-sur-le-london-platanes-j7kk5a.jpg',
                                    data: widget.data[index],
                                  )),
                                  child: Liste_Annonce_2(
                                      data: widget.data[index],
                                      image: widget.data[index].cover ));}),
                          SizedBox(height: 20.h,)]
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:   EdgeInsets.only(top:55.h),
              child: SizedBox(
                height: 85.h,
                child: ListView.builder(
                    itemCount: dataCategory.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            j=i;
                            indexselectCategory=i;
                          });
                          select = [];
                          for (int k = 0;
                          k < allAnnonce.length;
                          k++) {
                            if (dataCategory[indexselectCategory].name == "All") {
                              setState(() {
                                select.add(allAnnonce[k]);
                              });

                            } else if (allAnnonce[k]
                                .propertyType
                                .contains(dataCategory[indexselectCategory].name)) {
                              select.add(allAnnonce[k]);
                            }
                          }
                          setState(() {
                            widget.data = select;
                            widget.leng = select.length;
                          });
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(right: 5,left: 5),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:i==j? const Color.fromARGB(255, 130, 108, 219) : Colors.white,
                                    radius: ScreenSized.Avatar(
                                        Screenwidth,
                                        Screenheight),
                                    child: SvgPicture.asset(
                                        dataCategory[i].icon,
                                        width: 20,
                                        height: 20,
                                        color: const Color(0xffC0A280)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    dataCategory[i].name.tr,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: const Color(0xff8a8a8a),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
