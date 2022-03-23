import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:roya_immobilie/Controller/AnonceController.dart';
import 'package:roya_immobilie/Model/anonce_model_favote.dart';

import '../../../../cashd_image/image.dart';

class test extends StatelessWidget {
  late String image;
  late var data;
  test({required this.image, required this.data});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      builder: () => GestureDetector(
        onTap: () {

        },
        child: Card(
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
          child: Column(
            children: [
              Container(
                height: 200.h,
                width: double.infinity,
                child: cachedImage(
                  "https://dashboard.royaimmo.ma/images/annonces/"+image,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: NetworkImage(controller
                //         .AllBooks[i].img),
                //     fit: BoxFit.fill,
                //   ),
                //   borderRadius: BorderRadius.only(
                //       topLeft:
                //           Radius.circular(10),
                //       topRight:
                //           Radius.circular(10)),
                //   color: Colors.white,
                // ),
              ),),

              Container(
               // margin: EdgeInsets.only(top: 95),
                height: 85,
                width: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5,left: 5),
                      child: Text(data.price.toString()),
                    ),

                    Positioned(
                      //padding: EdgeInsets.only(bottom: 10,right: 5),
                      // margin: EdgeInsets.only(bottom: 35,left: 15),
                     // top: -10,
                      right: 0,
                      child: GetBuilder<AnnonceController>(
                        init: AnnonceController(),
                        builder: (controller) => Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              controller.addProducts(FavCategoryItem(
                                id: data.id,
                                region: data.region,
                                city: data.city,
                                title: data.title,
                                cover: data.cover,
                                apartment: data.apartment,
                                bedrooms: data.bedrooms,
                                bathrooms: data.bathrooms,
                                kitchens: data.kitchens,
                                address:data.address,
                                description: data.description,
                                phone1: data.phone1,
                                advertiser: data.advertiser,
                                area: data.area.toString(),
                                quartier: data.quartier,
                              ));
                              controller.getAllProducts();
                            },
                            icon: controller.FavIcon(data) == true
                                ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                                : Icon(Icons.favorite_border,
                                color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 35,left: 5),
                      child: Text( data.title,maxLines: 1,),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 65,left: 5),
                      child: Wrap(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                size: 12,
                              ),
                              Expanded(
                                child: Text(
                                  data.region,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 11),
                                ),
                              ),
                            ],
                          ),


                          Row(
                            children: [
                              Icon(
                                Icons.home,
                                size: 11,
                              ),
                              Expanded(
                                child: Text(
                                  data.city,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 11),
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
        ),
      ),
    );


  }
}