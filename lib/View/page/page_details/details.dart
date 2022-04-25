import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roya_immobilie/View/page/page_details/listview_in_detalis.dart';
import 'package:roya_immobilie/View/routing_screen.dart';
import 'package:roya_immobilie/screenSize/screenSized.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../Model/joke.dart';
import '../../../data.dart';
import '../../../variable/variable.dart';
import '../Home/home.dart';
import '../Home/widget/drawerpage.dart';
import '../contact_send.dart';

class Details extends StatefulWidget {
  List<String> images;
  int activeindex = 0;
  var data;
  bool _shownumber=false;
  Future<void>? _launched;
  bool _hasCallSupport = false;
  bool ?showList;

  Details({required this.images, required this.data,this.showList=false});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Joke> select = [];
  bool grid = true;


  //fonction prendre le date String et return la difirent
  String datename (dateString){
    DateTime dateTime = DateTime.parse(dateString);
    Duration diff = DateTime.now().difference(dateTime);
    if (diff.inDays >= 1) {
      return 'Membre depuis ${diff.inDays} day(s) ';
    } else if (diff.inHours >= 1) {
      return 'Membre depuis ${diff.inHours} hour(s) ';
    } else if (diff.inMinutes >= 1) {
      return 'Membre depuis ${diff.inMinutes} minute(s) ';
    } else if (diff.inSeconds >= 1) {
      return 'Membre depuis ${diff.inSeconds} second(s) ';
    } else {
      return 'just now';
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        widget._hasCallSupport = result;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
   print(locale[1]["name"]);
    var Screenwidth = MediaQuery.of(context).size.width;
    var Screenheight = MediaQuery.of(context).size.height;

    return ScreenUtilInit(
        builder: () => Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: Center(
                    child: SvgPicture.asset(
                      'assets/icon/logo-roya.svg',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () =>fromContact==false? Get.back():Get.to(RoutingScreen()),
                    icon: Icon(Icons.arrow_back_ios_sharp),
                    color: Colors.blue,
                  )),
              body: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icon/annonces/hand.svg',
                              width: 25.w,
                              height: 25.h,
                              matchTextDirection: true),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Découvrez nos catégories",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xffe3e3e3),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            topLeft: Radius.circular(20.r))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffe3e3e3),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.r),
                                  topLeft: Radius.circular(10.r))),
                          width: MediaQuery.of(context).size.width.toDouble(),
                          height:
                              (MediaQuery.of(context).size.height * 0.15).h,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 15.h, left: 2.w, right: 2.w),
                            child: ListView.builder(
                                itemCount: dataCategory.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        indexselectCategory = i ;
                                        Get.offAll(RoutingScreen());
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 5.w, left: 5.w),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: ScreenSized.Avatar(
                                                        Screenwidth,
                                                        Screenheight)
                                                    .h,
                                                child: SvgPicture.asset(
                                                    dataCategory[i].icon,
                                                    width: 20.w,
                                                    height: 20.h,
                                                    color: Color(0xffC0A280)),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text(
                                                dataCategory[i].name.tr,
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
                                    ),
                                  );
                                }),
                          ),
                        ),
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

                            bottom: 5,
                          ),

                        ]),
                        Container(
                          margin: EdgeInsets.only(right: 20.w, left: 20.w),
                          height: ScreenSized.Detalistheight(
                                  Screenwidth, Screenheight)
                              .h,
                          decoration: BoxDecoration(
                              color: Color(0xffc7c2d8),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.r),
                                  bottomRight: Radius.circular(10.r))),
                          child: Column(children: [
                            // Align(child: BuldeIndector(),alignment: Alignment.bottomCenter,),
                            Row(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(top: 10.h, left: 10.w),
                                  alignment: Alignment.topLeft,
                                  child:  CircleAvatar(
                                    backgroundColor: Color(0xffbfa280),
                                    radius: 20,
                                    child: Text(widget.data.advertiser[0].toString() +widget.data.advertiser[0].toString() ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        // alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(
                                            top: 15.h, left: 10.w),
                                        child: Text(
                                            "${widget.data.advertiser}")),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 3.h, left: 10.w),
                                      child:  Text(
                                        widget.data.createdAt,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  color: const Color(0xff5d5386),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icon/cc-chat.svg',
                                        width: 20.w,
                                        height: 20.h,
                                        matchTextDirection: true,
                                        color: const Color(0xffbfa280),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        "SEND MESSAGE".tr,
                                        style: TextStyle(fontSize:locale[1]["name"]!="France"? 13.sm:8),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    print(widget.data.id);
                                    slug_image=widget.images;
                                   // print("images "+widget.images);
                                    Get.to(ContactSend(annonce_id: widget.data.id,));
                                  },
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  color: const Color(0xff5d5386),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icon/phone-fill.svg',
                                          width: 20.w,
                                          height: 20.h,
                                          matchTextDirection: true),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                       widget._shownumber==false? "SHOW NUMBER".tr:widget.data.phone1,
                                        style: TextStyle(fontSize:locale[1]["name"]!="France"? 13.sm:8),
                                      ),
                                    ],
                                  ),
                                  onPressed: ()async {
                                    setState(() {
                                      widget._shownumber=!widget._shownumber;
                                     // widget._launched=   _makePhoneCall(widget.data.phone1);

                                    });
                                   // String telephoneNumber = '+2347012345678';
                                    String telephoneUrl = "tel:${widget.data.phone1.toString()}";
                                    if( widget._shownumber==true)
                                      if (await canLaunchUrlString(telephoneUrl)) {
                                    await launchUrlString(telephoneUrl);
                                    } else {
                                    throw "Error occured trying to call that number.";
                                    }
                                  },
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
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: Color(0xffc7c2d8),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              )),
                          child: Text(
                            widget.data.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.sm),
                            maxLines: 2,
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
                                  "${widget.data.bedrooms} "+ "Beds".tr,
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
                                  "${widget.data.bathrooms} "+ "Baths".tr,
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
                                  style: const TextStyle(
                                      color: Color(0xff8a8a8a)),
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
                                    width: 2.w,
                                    color: const Color(0xff8a8a8a)),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(right: 20.w, left: 20.w,),
                          child: Stack(
                            // mainAxisAlignment: ,
                            children: [
                              Container(
                                //  alignment: Alignment.topLeft,
                                  child:  Text("Adresse".tr)),
                              Container(
                                alignment: Alignment.center,
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
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20.w, left: 20.w),
                         // alignment: Alignment.,
                          child: Text(
                            'Description'.tr,
                            style: TextStyle(fontSize: 25.sp),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20.w, left: 20.w),
                          alignment: Alignment.topLeft,
                          child: Text(widget.data.description),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        widget.showList==false?   Container(
                          margin: EdgeInsets.only(right: 20.w, left: 20.w),
                         // alignment: Alignment.topLeft,
                          child: Text(
                            'Autre Annonces'.tr,
                            style: TextStyle(fontSize: 25.sp),
                          ),
                        ):Container(),
                        widget.showList==false? SizedBox(
                          height: 150.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    // onTap: ()=>  Get.to(Details(image: allAnnonce[index].cover, data: allAnnonce[index]),
                                    //     transition:Transition.zoom ,
                                    //     duration: Duration(microseconds: 150)),
                                    child: ListView_in_Detalis(
                                        data: allAnnonce[index],index: index,));
                              }),
                        ):Container(),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ]),
              ]),
            ));
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
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
