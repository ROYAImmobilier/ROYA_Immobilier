import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roya_immobilie/View/page/Home/widget/test.dart';

import '../../page_details/details.dart';
import 'listeanonnce.dart';
class MobileGridView extends StatelessWidget {
  MobileGridView({required this.data, required this.leng});

  var data;
  int leng;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    print(MediaQuery
        .of(context)
        .size
        .height *
        0.35);
    return Stack(
      children:[ GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: leng,
          gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 205,
              mainAxisExtent:275.h
              ,
              childAspectRatio: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemBuilder: (BuildContext ctx, index) {
            return index==leng?
            SizedBox(height: 200,):
              GestureDetector(
                onTap: () =>
                    Get.to(Details(
                      image: data[index]
                          .cover !=
                          null
                          ? data[index].cover
                          : 'https://c8.alamy.com/compfr/j7kk5a/cabinet-en-bois-aux-fenetres-de-l-appartement-avec-vue-sur-le-london-platanes-j7kk5a.jpg',
                      data: data[index],
                    )),
                child: test(
                    data: data[index],
                    image: data[index]
                        .cover !=
                        null
                        ? data[index].cover
                        : 'https://c8.alamy.com/compfr/j7kk5a/cabinet-en-bois-aux-fenetres-de-l-appartement-avec-vue-sur-le-london-platanes-j7kk5a.jpg')
            );
          }
      ),
   ] );
  }
}

