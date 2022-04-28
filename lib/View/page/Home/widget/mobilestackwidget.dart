import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:roya_immobilie/Model/repositery.dart';
import 'package:roya_immobilie/View/page/Home/widget/test.dart';

import '../../../../variable/variable.dart';
import '../../page_details/details.dart';
class MobileGridView extends StatefulWidget {
  MobileGridView({required this.data, required this.leng});

  var data;
  int leng;

  @override
  State<MobileGridView> createState() => _MobileGridViewState();
}

class _MobileGridViewState extends State<MobileGridView> {
  late List<String>images = [];
  late List<String>abilityicon = [];




  @override
  void initState() {
   setState(() {

   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      builder: () => Stack(
        children:[ GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.leng,
            gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 205,
                mainAxisExtent:275.h
                ,
                childAspectRatio: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemBuilder: (BuildContext ctx, index) {
              return index==widget.leng?
              const SizedBox(height: 200,):
                GestureDetector(
                  onTap: () {
                   print(widget.data[index].id);
                    Get.to(Details(
                      index:widget.data[index].slug ,
                              images: images,
                              data: widget.data[index],
                              iconability:abilityicon,
                            ));

                  },
                  child: test(
                      data: widget.data[index],
                      image: widget.data[index]
                          .cover !=
                          null
                          ? widget.data[index].cover
                          : 'https://c8.alamy.com/compfr/j7kk5a/cabinet-en-bois-aux-fenetres-de-l-appartement-avec-vue-sur-le-london-platanes-j7kk5a.jpg')
              );
            }
        ),
   ] ),
    );
  }
}

