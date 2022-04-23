import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/variable/variable.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../screenSize/screenSized.dart';

class DetailleProfile extends StatefulWidget {
  List<String> images;
  var data;

  int activeindex=0;

  DetailleProfile({required this.images, required this.data});

  @override
  _DetailleProfileState createState() => _DetailleProfileState();
}

class _DetailleProfileState extends State<DetailleProfile> {


  @override
  Widget build(BuildContext context) {
    var Screenwidth = MediaQuery.of(context).size.width;
    var Screenheight = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
        builder: ()  {
        return Scaffold(
          backgroundColor: Color(0xffe3e3e3),
          appBar: AppBar(
              title:  Center(
                child: SvgPicture.asset('assets/icon/logo-roya.svg',
                  width: 40,
                  height: 40,),),

              backgroundColor:Colors.white,
              leading:IconButton(
                onPressed:()=>Get.back() ,icon: Icon
                (Icons.arrow_back_ios_sharp) , color: Colors.blue,)

          ),
          body: SingleChildScrollView(
            child: Column(
              children: [

                Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 20.h, right: 20.w, left: 20.w),
                        height:
                        (MediaQuery.of(context).size.height * 0.30).h,
                        decoration: BoxDecoration(
                          // image: DecorationImage(
                          //   image: NetworkImage("https://dashboard.royaimmo.ma/images/annonces/"+widget.images[0]),
                          //   fit: BoxFit.fill,
                          // ),
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(10.r))),
                        child: CarouselSlider(
                            options: CarouselOptions(
                              //  height:    450.h ,
                              height:
                              (MediaQuery.of(context).size.height),
                              scrollDirection: Axis.horizontal,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              reverse: false,
                              autoPlay: false,
                              pageSnapping: true,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              onPageChanged: (value, res) {
                                setState(() {
                                  widget.activeindex = value;
                                });
                              },
                            ),
                            items: widget.images
                                .map((String slider) => Builder(
                              builder: (BuildContext context) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft:
                                      Radius.circular(10.r),
                                      topRight:
                                      Radius.circular(10.r)),
                                  child: Stack(
                                    children: [
                                      Container(
                                        // margin: EdgeInsets.only(top: 50),
                                        height: (MediaQuery.of(
                                            context)
                                            .size
                                            .height *
                                            0.5)
                                            .h,
                                        // decoration: const BoxDecoration(
                                        // //   borderRadius: BorderRadius.all(
                                        // //       Radius.circular(4.5)),
                                        // ),
                                        child: ClipRRect(
                                          // borderRadius: const BorderRadius.all(
                                          //     Radius.circular(10)),
                                          child:
                                          CachedNetworkImage(
                                            width: MediaQuery.of(
                                                context)
                                                .size
                                                .width,
                                            fit: BoxFit.fill,
                                            imageUrl:
                                            "https://dashboard.royaimmo.ma/images/annonces/" +
                                                slider,
                                            placeholder: (context,
                                                url) =>
                                                Icon(Icons.image),
                                            errorWidget: (context,
                                                url, error) =>
                                            const Icon(
                                                Icons.error),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ))
                                .toList()),
                      ),
                      Positioned(
                        child: BuldeIndector(),
                        // top: 0,
                        // right: 0,
                        // left: MediaQuery.of(context).size.width.toDouble()/2,
                        bottom: 5,
                      ),

                    ]),
                // Container(
                //   margin:
                //   EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
                //   height: 250.h,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: NetworkImage("https://dashboard.royaimmo.ma/images/annonces/${widget.data.cover}"),
                //         fit: BoxFit.fill,
                //       ),
                //       color: Colors.white,
                //       borderRadius: BorderRadius.only(
                //           topLeft: Radius.circular(10.r),
                //           topRight: Radius.circular(10.r))),
                // ),
                Container(
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                  height: ScreenSized.ProfileDetalse(Screenwidth,Screenheight),
                  decoration: BoxDecoration(
                      color: Color(0xffc7c2d8),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r))),
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10.h, left: 10.w),
                          alignment: Alignment.topLeft,
                          child: const CircleAvatar(
                            backgroundColor: Color(0xffbfa280),
                            radius: 20,
                            child: Text('AA'),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(
                                    top: 15.h, left: 10.w),
                                child: Text("${widget.data.advertiser}")),
                            Container(
                              padding:
                              EdgeInsets.only(top: 3.h, left: 10.w),
                              child: const Text(
                                "Membre depuis 2 Mois",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //  alignment: Alignment.center,
                          // width: 150,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: const Color(0xff5d5386),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Icon(Icons.update),
                                SizedBox(
                                  width: 2.w,
                                ),
                                const Text(
                                  "Update",
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          //  margin: EdgeInsets.only(right: 55.w),
                          // width: 150,
                          // alignment: Alignment.center,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color(0xff5d5386),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.delete),
                                SizedBox(
                                  width: 2.w,
                                ),
                                const Text(
                                  "Delete",
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    )
                  ]),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                 // height: 50.h,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                          Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Color(0xffc7c2d8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      )),
                  child: Text(
                    widget.data.title,
                    style: TextStyle(fontSize: 24,),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        SvgPicture.asset(
                          'assets/icon/annonces/bed-sharp.svg',
                          width: 20.w,
                          height: 20.h,
                          //   matchTextDirection: true,
                          color: Color(0xff8a8a8a),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "${widget.data.bedrooms} Beds",
                          style: TextStyle(color: Color(0xff8a8a8a)),
                        )
                      ]),
                      Row(children: [
                        SvgPicture.asset(
                          'assets/icon/annonces/bathroom.svg',
                          width: 20.w,
                          height: 20.h,
                          // matchTextDirection: true,
                          color: Color(0xff8a8a8a),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "${widget.data.bathrooms} Boths",
                          style: TextStyle(color: Color(0xff8a8a8a)),
                        )
                      ]),
                      Row(children: [
                        SvgPicture.asset(
                          'assets/icon/m.svg',
                          width: 20.w,
                          height: 20.h,
                          //  matchTextDirection: true,
                          color: const Color(0xff8a8a8a),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "${widget.data.area} m²",
                          style: const TextStyle(color: Color(0xff8a8a8a)),
                        )
                      ]),
                    ],
                  ),
                ),
                Container(
                  //height: ,
                    margin: EdgeInsets.only(
                        right: 20.w, left: 20.w, bottom: 15.h),
                    // child: Divider(
                    //   color: Colors.black,
                    // ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 2.w, color: const Color(0xff8a8a8a)),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                  child: Stack(
                    // mainAxisAlignment: ,
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text("Adresse")),
                      SizedBox(width: 15,),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          widget.data.address +
                              ' => ' +
                              widget.data.quartier,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  //height: ,
                    margin: EdgeInsets.only(
                        right: 20.w, left: 20.w, top: 15.h),
                    // child: Divider(
                    //   color: Colors.black,
                    // ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 2.w, color: Color(0xff8a8a8a)),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Description',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                  alignment: Alignment.topLeft,
                  child: Text(widget.data.description),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
  Widget BuldeIndector() => AnimatedSmoothIndicator(
    count: widget.images.length,
    activeIndex: widget.activeindex,
    effect:  WormEffect(
      dotHeight: 16,
      dotWidth: 16,
      type: WormType.thin,
      // strokeWidth: 5,
    ),

  );
}
