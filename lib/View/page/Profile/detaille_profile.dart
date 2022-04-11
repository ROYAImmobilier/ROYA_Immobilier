import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DetailleProfile extends StatefulWidget {
  late String image;
  var data;

  DetailleProfile({required this.image, required this.data});

  @override
  _DetailleProfileState createState() => _DetailleProfileState();
}

class _DetailleProfileState extends State<DetailleProfile> {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: ()  {
        return Scaffold(
          backgroundColor: Color(0xffe3e3e3),
          appBar: AppBar(),
          body: Column(
            children: [

              Container(
                margin:
                EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
                height: 150.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://dashboard.royaimmo.ma/images/annonces/${widget.data.cover}"),
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
                  widget.data.title,
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
                        width: 20.w,
                        height: 20.h,
                        matchTextDirection: true,
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
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Row(children: [
                      SvgPicture.asset(
                        'assets/icon/annonces/bathroom.svg',
                        width: 20.w,
                        height: 20.h,
                        matchTextDirection: true,
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
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Row(children: [
                      SvgPicture.asset(
                        'assets/icon/m.svg',
                        width: 20.w,
                        height: 20.h,
                        matchTextDirection: true,
                        color: Color(0xff8a8a8a),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "${widget.data.area} m²",
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
        );
      }
    );
  }
}
