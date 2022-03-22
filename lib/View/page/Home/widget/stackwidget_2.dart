import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_grid.dart';
import 'package:roya_immobilie/View/page/Home/widget/test.dart';
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
  bool grid = true;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => SingleChildScrollView(
        child: Container(
          color: Color(0xffefefef),
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
                              onPressed: () => Get.to(SearchFiltter(data: widget.data,)),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50.0.h),
                    child: Container(
                      height: MediaQuery.of(context).size.height.toDouble(),
                      decoration: BoxDecoration(
                          color: Color(0xffefefef),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.r),
                              topLeft: Radius.circular(20.r))),
                      width: MediaQuery.of(context).size.width.toDouble(),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
                            child: SizedBox(
                              height: 85.h,
                              child: ListView.builder(
                                  itemCount: 6,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) {
                                    return const Icon_Status();


                                  }),
                            ),
                          ),
                          Container(
                              color: const Color(0xffefefef),
height: MediaQuery.of(context).size.height.h,
                              // height: double.infinity,
                              margin: EdgeInsets.all(15),
                              child: ListView(
                                children:[ grid
                                    ? GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: widget.leng,
                                    gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 205.h,
                                        mainAxisExtent:
                                        (MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.60)
                                            .h,
                                        childAspectRatio: 2,
                                        crossAxisSpacing:5.h,
                                        mainAxisSpacing: 5.w),
                                    itemBuilder: (BuildContext ctx, index) {
                                      return GestureDetector(
                                          onTap: () => Get.to(Details(
                                              image: widget.data[index].cover !=
                                                  null
                                                  ? 'https://dashboard.royaimmo.ma/images/annonces/${
                                                          widget
                                                              .data[index].cover
                                                        }'
                                                      : 'https://c8.alamy.com/compfr/j7kk5a/cabinet-en-bois-aux-fenetres-de-l-appartement-avec-vue-sur-le-london-platanes-j7kk5a.jpg',
                                              data: widget.data[index])),
                                          child: test(
                                            image: widget.data[index].cover !=
                                                null
                                                ? widget.data[index].cover
                                                : 'https://c8.alamy.com/compfr/j7kk5a/cabinet-en-bois-aux-fenetres-de-l-appartement-avec-vue-sur-le-london-platanes-j7kk5a.jpg',
                                            data: widget.data[index],
                                          ));
                                    })
                                    : ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: widget.leng,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return index == widget.leng
                                          ? SizedBox(
                                        height: 25.h,
                                      )
                                          : GestureDetector(
                                          onTap: () => Get.to(Details(
                                            image: widget.data[index]
                                                .cover !=
                                                null
                                                ? widget
                                                .data[index].cover
                                                : 'https://c8.alamy.com/compfr/j7kk5a/cabinet-en-bois-aux-fenetres-de-l-appartement-avec-vue-sur-le-london-platanes-j7kk5a.jpg',
                                            data: widget.data[index],
                                          )),
                                          child: test(
                                              data: widget.data[index],
                                              image: widget.data[index]
                                                  .cover !=
                                                  null
                                                  ? widget.data[index].cover
                                                  : 'https://c8.alamy.com/compfr/j7kk5a/cabinet-en-bois-aux-fenetres-de-l-appartement-avec-vue-sur-le-london-platanes-j7kk5a.jpg'));
                                        }),
                              ])),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
