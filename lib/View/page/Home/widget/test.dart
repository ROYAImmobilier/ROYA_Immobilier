
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:roya_immobilie/Controller/AnonceController.dart';
import 'package:roya_immobilie/Model/anonce_model_favote.dart';
import 'package:roya_immobilie/screenSize/screenSized.dart';

import '../../../../Colors/colors.dart';
import '../../../../cashd_image/image.dart';

class test extends StatelessWidget {
  late String image;
  late var data;
  test({required this.image, required this.data});

  @override
  Widget build(BuildContext context) {
    var Screenwidth=MediaQuery.of(context).size.width;
    var Screenheight=MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      builder: () => Directionality(
        textDirection: TextDirection.ltr,
        child:Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(14),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              side: BorderSide(color: Colors.white)),
          child: Stack(
            children: [
              Container(
                height: 180.h,
                width: double.infinity,
                child: cachedImage(
                  "https://dashboard.royaimmo.ma/images/annonces/${image}",
                ),),
              Container(
                margin: EdgeInsets.only(top: 180.h),
                height: 100.h,
                width: 180.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5.h,left: 5.w),
                      child: Text(
                        data.price.toString() + ' dh',
                        style: TextStyle(
                          fontSize: 15.sm,
                          color: Color(
                            0xffb58350,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      //padding: EdgeInsets.only(bottom: 10,right: 5),
                      // margin: EdgeInsets.only(bottom: 35,left: 15),
                      top: -ScreenSized.PaddingFavoris(Screenwidth, Screenheight).h,
                      right: -ScreenSized.PaddingFavoris(Screenwidth, Screenheight).w,
                      child: GetBuilder<AnnonceController>(
                        init: AnnonceController(),
                        builder: (controller) => Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              controller.addProducts(FavCategoryItem(
                                id:data.id,
                                region:data.region,
                                city:data.city,
                                title:data.title,
                                cover:data.cover,
                                apartment:data.apartment,
                                bedrooms:data.bedrooms,
                                bathrooms:data.bathrooms,
                                kitchens:data.kitchens,
                                address:data.address,
                                description:data.description,
                                phone1:data.phone1,
                                advertiser:data.advertiser,
                                area:data.area.toString(),
                                quartier:data.quartier,
                                createdAt: data.createdAt, abilities: [],
                              ));
                              controller.getAllProducts();
                            },
                            icon: controller.FavIcon(data) == true
                                ?  Icon(
                              Icons.star,
                              color: goldColor,
                            )
                                :  Icon(Icons.star_border,
                                color: goldColor),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30.h,left: 5.w),
                      child: Text( data.title,maxLines: 1,style: TextStyle(fontSize: 14.sm),),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 53.h,left: 5.w),
                      child: Wrap(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                size: 14.h,
                              ),
                              Expanded(
                                child: Text(
                                  data.region,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 14.sm),
                                ),
                              ),
                            ],
                          ),


                          Row(
                            children: [
                              Icon(
                                Icons.home,
                                size: 14.h,
                              ),
                              Expanded(
                                child: Text(
                                  data.city,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 14.sm),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ) ,
      ),
    );
  }
}
