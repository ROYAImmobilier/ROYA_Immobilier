import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roya_immobilie/Model/ModelAnnonce.dart';

import 'package:roya_immobilie/View/page/page_details/details.dart';



class Sercher extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<Sercher> {
  TextEditingController controller = new TextEditingController();

  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    final response = await http.get(Uri.parse(url));
    final responseJsoon = json.decode(response.body);
    final responseJson = responseJsoon["data"];
    setState(() {
      for (Map user in responseJson) {
        _userDetails.add(ModelAnnonce.fromJson(user.cast()));
      }
    });
  }

  List<String>images=[];
  List<String>abilityicon=[];


  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(),
      appBar: AppBar(
        title:  Center(
            child: SvgPicture.asset('assets/icon/logo-roya.svg',
              width: 40,
              height: 40,)),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              //menu.svg
              icon: SvgPicture.asset('assets/icon/menu.svg',
                  width: 25, height: 25, matchTextDirection: true),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Container(
        color: Color(0xffefefef),
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      onChanged: onSearchTextChanged,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        controller.clear();
                        onSearchTextChanged('');
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _searchResult.length != 0 || controller.text.isNotEmpty
                  ? ListView.builder(
                      itemCount: _searchResult.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap:()=> Get.to(Details(
                            data: _searchResult[i],

                          )),
                          child: ScreenUtilInit(
                              splitScreenMode: true,
                              builder: () {
                                return Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(top: 5.h, left: 5.w),
                                    width: double.infinity,
                                    height: 120.h,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 140.w,
                                          height: 120.h,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://dashboard.royaimmo.ma/images/annonces/"+ _searchResult[i].cover),
                                                fit: BoxFit.fill,
                                              ),
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.r),
                                                  bottomLeft:
                                                      Radius.circular(10.r))),
                                        ),
                                        Container(
                                          width: 200.w,
                                          height: 130.h,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(10.r),
                                                  bottomRight:
                                                      Radius.circular(10.r))),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 5.w),
                                                alignment: Alignment.topRight,
                                                child: Icon(
                                                  Icons.more_vert,
                                                  size: 15.sp,
                                                ),
                                              ),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5.w),
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    _searchResult[i]
                                                            .price
                                                            .toString() +
                                                        ' dh',
                                                    style: TextStyle(
                                                      fontSize: 18.sp,
                                                      color: Color(
                                                        0xffb58350,
                                                      ),
                                                    ),
                                                  )),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                // width: 350.w,
                                                margin: EdgeInsets.only(
                                                    top: 3.h, left: 5.w),
                                                child: Text(
                                                  _searchResult[i].title,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                              ),
                                              Wrap(

                                                children: [
                                                  Container(
                                                    child: Row(children: [
                                                      SvgPicture.asset(
                                                        'assets/icon/annonces/bed-sharp.svg',
                                                        width: 10.w,
                                                        height: 10.h,
                                                        matchTextDirection:
                                                            true,
                                                        color:
                                                            Color(0xff8a8a8a),
                                                      ),
                                                      Text(
                                                        "${_searchResult[i].bedrooms} Beds",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff8a8a8a)),
                                                      )
                                                    ]),
                                                  ),
                                                  Container(
                                                    child: Row(children: [
                                                      SvgPicture.asset(
                                                        'assets/icon/annonces/bathroom.svg',
                                                        width: 10.w,
                                                        height: 10.h,
                                                        matchTextDirection:
                                                            true,
                                                        color:
                                                            Color(0xff8a8a8a),
                                                      ),
                                                      Text(
                                                        "${_searchResult[i].bathrooms} Boths",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff8a8a8a)),
                                                      )
                                                    ]),
                                                  ),
                                                  Container(
                                                    child: Row(children: [
                                                      SvgPicture.asset(
                                                        'assets/icon/m.svg',
                                                        width: 10.w,
                                                        height: 10.h,
                                                        matchTextDirection:
                                                            true,
                                                        color:
                                                            Color(0xff8a8a8a),
                                                      ),
                                                      Text(
                                                        "${_searchResult[i].area} m²",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff8a8a8a)),
                                                      )
                                                    ]),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      },
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {

      if (userDetail.title.toString().toLowerCase().contains(text.toLowerCase())
        ||
           userDetail.address.toString().toLowerCase().contains(text.toLowerCase())
        ||
          userDetail.region.toString().toLowerCase().contains(text.toLowerCase())
          ||
          userDetail.city.toString().toLowerCase().contains(text.toLowerCase())
      )
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

List<ModelAnnonce> _searchResult = [];

List<ModelAnnonce> _userDetails = [];

final String url = "https://dashboard.royaimmo.ma/api/site/annonces/?limit=500";
