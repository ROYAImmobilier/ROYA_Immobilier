
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Colors/colors.dart';
import 'package:roya_immobilie/Controller/AnonceController.dart';
import 'package:roya_immobilie/Model/anonce_model_favote.dart';
import 'package:roya_immobilie/cashd_image/image.dart';


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

    return ScreenUtilInit(
        splitScreenMode: true,
        builder: () {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Stack(children: [
                Container(
                  child: cachedImage("https://dashboard.royaimmo.ma/images/annonces/"+widget.image,),
                  height: 120.h,
                  width: 150.w,
                  decoration:  const BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 150.w),
                  height: 120.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),

                  ),
                  child: Stack(children: [
                    Container(
                      padding: EdgeInsets.only(top: 10.h,left: 10.w),
                      child:Text(
                                          widget.data.price.toString() + ' dh',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            color: const Color(
                                              0xffb58350,
                                            ),
                                          ),
                                        )
                    ),Padding(
                      padding: EdgeInsets.only(top: 40.h,left: 10.w),
                      child: Text(
                                        widget.data.title,
                                        maxLines: 1,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 14.r,
                                        ),
                                      ),
                    ),
                    // Positioned(
                    //     top: -5.h,
                    //     right: 0,
                    //     child: Align(alignment:Alignment.topRight,child: IconButton(onPressed: (){},
                    //         icon: const Icon( Icons.more_vert)))),
                    Positioned(
                      bottom: 0,
                        right: 0,
                        child: GetBuilder<AnnonceController>(
                          init: AnnonceController(),
                          builder: (controller) => Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                controller.addProducts(FavCategoryItem(
                                  id: widget.data.id,
                                  slug: widget.data.slug,
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
                                  createdAt: widget.data.createdAt.toString(), abilities: [],
                                ));
                                controller.getAllProducts();
                              },
                              icon: controller.FavIcon(widget.data) == true
                                  ?  Icon(
                                Icons.star,
                                color: goldColor,
                              )
                                  :  Icon(Icons.star_border,
                                  color: goldColor),
                            ),
                          ),
                        ),),

                    Container(
                      margin: EdgeInsets.only(top: 75.h,left: 10.w),
                      child: Wrap(
                        children: [
                          Row(
                            children: [
                               Icon(
                                Icons.location_on_rounded,
                                size: 14.r,
                              ), Text( widget.data.region,style: TextStyle(fontSize: 12.r),),
                            ],
                          ),

                           SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.home,
                                size: 14.r,
                              ), Text(widget.data.city,style: TextStyle(fontSize: 14.r),),
                            ],
                          ),

                        ],
                      ),
                    )
                  ],),
                ),

              ],

              ),
            ) ,


          );
        });
  }
}
