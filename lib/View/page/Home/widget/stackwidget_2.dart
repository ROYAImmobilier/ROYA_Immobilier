import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Model/joke.dart';
import 'package:roya_immobilie/View/page/Home/category_items.dart';
import 'package:roya_immobilie/View/page/Home/widget/tabletstackwidget.dart';
import 'package:roya_immobilie/View/page/Home/widget/testplatform.dart';
import '../../../../Controller/AnonceController.dart';
import '../../../../data.dart';
import '../../../routing_screen.dart';
import '../../page_details/details.dart';
import '../../page_details/icon_status.dart';
import '../../searchfilter.dart';
import 'listeanonnce_2.dart';
import 'mobilestackwidget.dart';

final colors = Color(0xefefef);

class StackWidget_2 extends StatefulWidget {
  var data;
  int leng;
  StackWidget_2({required this.data, required this.leng});

  @override
  State<StackWidget_2> createState() => _StackWidget_2State();
}

class _StackWidget_2State extends State<StackWidget_2> {

  List<Joke> select=[] ;
  bool grid = true;
  @override
  Widget build(BuildContext context) {
    var ScreenSized=MediaQuery.of(context).size.width;
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
                                  itemCount: dataCategory.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context,i) {
                                    return   GestureDetector(
                                        onTap: () {
                                          select = [];
                                          for(int k=0 ;k<allAnnonce.length;k++){
                                            if(allAnnonce[k].propertyType.contains(dataCategory[i].name)){
                                              select.add(allAnnonce[k]);
                                            }
                                          }
                                          Get.to(CategoryItems(
                                              icon : dataCategory[i].icon,
                                              title: dataCategory[i].name,
                                              data:select, leng: select.length));
                                        },
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    radius: 30,
                                                    child: SvgPicture.asset(
                                                        dataCategory[i].icon,
                                                        width: 20.w,
                                                        height: 20.h,
                                                        color: Color(0xffC0A280)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.w,
                                                ),
                                                Text(
                                                  dataCategory[i].name,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Color(0xff8a8a8a),
                                                  ),
                                                ),

                                              ],

                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                          ],
                                        ),
                                      );
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                           // width: double.infinity,
                            child: ListView(
                              children:[ grid
                                  ? ResponsiveLayout_(desktopBody: TbletGridView(leng: widget.leng, data: widget.data,),
                               mobileBody: MobileGridView(leng: widget.leng, data: widget.data,),)
                                  : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: widget.leng,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        onTap: () => Get.to(Details(
                                          image: widget.data[index]
                                              .cover !=
                                              null
                                              ? widget
                                              .data[index].cover
                                              : 'https://c8.alamy.com/compfr/j7kk5a/cabinet-en-bois-aux-fenetres-de-l-appartement-avec-vue-sur-le-london-platanes-j7kk5a.jpg',
                                          data: widget.data[index],
                                        )),
                                        child: Liste_Annonce_2(
                                            data: widget.data[index],
                                            image: widget.data[index]
                                                .cover !=
                                                null
                                                ? widget.data[index].cover
                                                : 'https://c8.alamy.com/compfr/j7kk5a/cabinet-en-bois-aux-fenetres-de-l-appartement-avec-vue-sur-le-london-platanes-j7kk5a.jpg'));
                                      }),
                             // SizedBox(height:ScreenSized>800? 1400:550,)
                            ]),
                          ),
                         //
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
