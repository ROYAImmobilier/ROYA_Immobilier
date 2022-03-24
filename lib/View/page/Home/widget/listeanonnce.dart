import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:roya_immobilie/Controller/AnonceController.dart';
import 'package:roya_immobilie/Model/anonce_model_favote.dart';

class Liste_Annonce extends StatefulWidget {
  late String image;
  var data;
  Liste_Annonce({required this.image, required this.data});

  @override
  State<Liste_Annonce> createState() => _Liste_AnnonceState();
}

class _Liste_AnnonceState extends State<Liste_Annonce> {
  bool fav = true;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Directionality(
        textDirection: TextDirection.ltr,
        child:Container(
          padding: EdgeInsets.all(5),
          child: Stack(
            children: [
              Container(
                height: 100,
                width: 150,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://dashboard.royaimmo.ma/images/annonces/"+widget.image),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 95),
                height: 100,
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
                      child: Text(widget.data.price.toString()),
                    ),

                    Positioned(
                      //padding: EdgeInsets.only(bottom: 10,right: 5),
                     // margin: EdgeInsets.only(bottom: 35,left: 15),
                     top: -10,
                      right: 0,
                      child: GetBuilder<AnnonceController>(
                        init: AnnonceController(),
          builder: (controller) => Align(
            alignment: Alignment.topRight,
            child: IconButton(
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
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 35,left: 5),
                      child: Text( widget.data.title,maxLines: 1,),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 65,left: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            size: 12,
                          ),
                          Text(
                            widget.data.region,
                            style: TextStyle(fontSize: 11),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.home,
                            size: 11,
                          ),
                          Text(
                            widget.data.city,
                            style: TextStyle(fontSize: 11),
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
