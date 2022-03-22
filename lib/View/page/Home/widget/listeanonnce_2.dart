import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Controller/AnonceController.dart';
import 'package:roya_immobilie/Model/anonce_model_favote.dart';

class Liste_Annonce_2 extends StatefulWidget {
  late String image;
  late var data;
  Liste_Annonce_2({required this.image, required this.data});

  @override
  State<Liste_Annonce_2> createState() => _Liste_Annonce_2State();
}

class _Liste_Annonce_2State extends State<Liste_Annonce_2> {
  bool fav = true;
  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size.width;
    print(sizeScreen);
    return ScreenUtilInit(
        splitScreenMode: true,
        builder: () {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              margin: EdgeInsets.only(top: 5.h, left: 5.w),
              width: double.infinity,
              height: 120.h,
              child: Row(
                children: [
                  Container(
                    width: 140.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://dashboard.royaimmo.ma/images/annonces/"+widget.image),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r))),
                  ),
                  Container(
                    width: 200.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r))),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5.h, right: 5.w),
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.more_vert,
                            size: 15.sp,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5.h, left: 5.w),
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.data.price.toString() + ' dh',
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
                          margin: EdgeInsets.only(top: 3.h, left: 5.w,bottom: 25),
                          child: Text(
                            widget.data.title,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.w),
                          padding: EdgeInsets.only(top: 10.h),
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                size: 12.sp,
                              ),
                              Text( widget.data.region,style: TextStyle(fontSize: 9),),
                              SizedBox(
                                width: 5.w,
                              ),
                              Icon(
                                Icons.home,
                                size: 11.sp,
                              ),
                               Text( widget.data.city,style: TextStyle(fontSize: 9),),
                              SizedBox(
                                width: sizeScreen > 320 ? 60.w : 40.w,
                              ),
                              Container(
                                //margin: EdgeInsets.symmetric(horizontal: 15.w),
                                alignment: Alignment.topRight,
                                child: GetBuilder<AnnonceController>(
                                  init: AnnonceController(),
                                  builder: (controller) => IconButton(
                                    onPressed: () {
                                      controller.addProducts(FavCategoryItem(
                                        id: widget.data.id,
                                        region: widget.data.region,
                                        city: widget.data.city,
                                        title: widget.data.title,
                                        cover: widget.data.cover,
                                        apartment: widget.data.apartment,
                                        bedrooms: widget.data.bedrooms,
                                        bathrooms: widget.data.bathrooms,
                                        kitchens: widget.data.kitchens,
                                        address: widget.data.address,
                                        description: widget.data.description,
                                        phone1: widget.data.phone1,
                                        advertiser: widget.data.advertiser,
                                        area: widget.data.area.toString(),
                                        quartier: widget.data.quartier,
                                      ));
                                      controller.getAllProducts();
                                    },
                                    icon: controller.FavIcon(widget.data) == true
                                        ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                        : Icon(Icons.favorite_border,
                                        color: Colors.red),
                                  ),
                                ),

                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
