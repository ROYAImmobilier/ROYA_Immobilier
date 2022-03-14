import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roya_immobilie/page_details/listview_in_detalis.dart';

import '../View/page/Home/widget/listeanonnce.dart';
import '../View/page/Home/widget/listeanonnce_2.dart';
import '../View/page/Home/widget/stackwidget_2.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => Scaffold(
              appBar: AppBar(
                title: const Text("Details"),
              ),
              body: ListView(children: [
                Container(
                  color: Color(0xffe3e3e3),
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
                        height: 150.h,
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
                        height: 95.h,
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
                                child: CircleAvatar(
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
                                      child: Text("Manager")),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 3.h, left: 10.w),
                                    child: Text(
                                      "Membre depuis 2 Mois",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
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
                                  color: Color(0xff5d5386),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icon/cc-chat.svg',
                                        width: 25.w,
                                        height: 25.h,
                                        matchTextDirection: true,
                                        color: Color(0xffbfa280),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "SEND MESSAGE",
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
                                      SvgPicture.asset(
                                          'assets/icon/phone-fill.svg',
                                          width: 25.w,
                                          height: 25.h,
                                          matchTextDirection: true),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "SHOW NUMBER",
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
                        height: 50.h,
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
                          "Appartement à vendre à Agadir",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(25),
                            child: Row(children: [
                              SvgPicture.asset(
                                'assets/icon/annonces/bed-sharp.svg',
                                width: 25.w,
                                height: 25.h,
                                matchTextDirection: true,
                                color: Color(0xff8a8a8a),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "3 Beds",
                                style: TextStyle(color: Color(0xff8a8a8a)),
                              )
                            ]),
                          ),
                          Container(
                            margin: EdgeInsets.all(25),
                            child: Row(children: [
                              SvgPicture.asset(
                                'assets/icon/annonces/bathroom.svg',
                                width: 25.w,
                                height: 25.h,
                                matchTextDirection: true,
                                color: Color(0xff8a8a8a),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "4 Boths",
                                style: TextStyle(color: Color(0xff8a8a8a)),
                              )
                            ]),
                          ),
                          Container(
                            margin: EdgeInsets.all(25),
                            child: Row(children: [
                              SvgPicture.asset(
                                'assets/icon/m.svg',
                                width: 25.w,
                                height: 25.h,
                                matchTextDirection: true,
                                color: Color(0xff8a8a8a),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "400 m²",
                                style: TextStyle(color: Color(0xff8a8a8a)),
                              )
                            ]),
                          ),
                        ],
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
                                  width: 2.w, color: Color(0xff8a8a8a)),
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(right: 20.w, left: 20.w),
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text("Adresse")),
                            const Text(
                              "Hay Salam Agadir",
                              textAlign: TextAlign.center,
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
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20.w, left: 20.w),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Description',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20.w, left: 20.w),
                        alignment: Alignment.topLeft,
                        child: Text(
                            'Sublime villa pour l\'habitation en location pour la longue durée villa bien ensoleillé dans un quartier calme et propre à Casablanca située a Californie d\'une superficie habitab…'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20.w, left: 20.w),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Autre Annonces',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 200.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return ListView_in_Detalis();
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ]),
            ));
  }
}
