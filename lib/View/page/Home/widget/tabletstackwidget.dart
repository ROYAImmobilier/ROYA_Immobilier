import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roya_immobilie/View/page/Home/widget/test.dart';

import '../../page_details/details.dart';
class TbletGridView extends StatelessWidget {
  TbletGridView({required this.data, required this.leng});

  var data;
  int leng;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: leng,
        gridDelegate:
        SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 305,
            mainAxisExtent:
            (MediaQuery
                .of(context)
                .size
                .width *
                0.52)
            ,
            childAspectRatio: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
              onTap: () =>
                  Get.to(Details(
                    image: data[index]
                        .cover !=
                        null
                        ? data[index].cover
                        : 'https://c8.alamy.com/compfr/j7kk5a/cabinet-en-bois-aux-fenetres-de-l-appartement-avec-vue-sur-le-london-platanes-j7kk5a.jpg',
                    data: data[index],
                  ),),
                      child: test(
                      data: data[index],
                      image: data[index]
                          .cover !=
                          null
                          ? data[index].cover
                          : 'https://c8.alamy.com/compfr/j7kk5a/cabinet-en-bois-aux-fenetres-de-l-appartement-avec-vue-sur-le-london-platanes-j7kk5a.jpg')
                  );
        }
    );
  }
}

