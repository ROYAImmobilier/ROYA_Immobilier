import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              body: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
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
                    margin: const EdgeInsets.only(right: 20, left: 20),
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
                            padding: EdgeInsets.only(top: 10, left: 10),
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              backgroundColor: Color(0xffbfa280),
                              radius: 20,
                              child: Text('AA'),
                            ),
                          ),
                          Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  // alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(top: 15, left: 10),
                                  child: Text("Manager")),
                              Container(
                                padding: EdgeInsets.only(top: 3, left: 10),
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
                              minWidth: 40,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Color(0xff5d5386),
                              child: Row(
                                children: [
                                  Icon(Icons.keyboard),
                                  Text(
                                    "SEND MESSAGE",
                                  ),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            //  margin: EdgeInsets.only(right: 55.w),
                            // width: 150,
                            // alignment: Alignment.center,
                            child: MaterialButton(
                              minWidth: 40,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Color(0xff5d5386),
                              child: Row(
                                children: [
                                  Icon(Icons.keyboard),
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
                ],
              ),
            ));
  }
}
