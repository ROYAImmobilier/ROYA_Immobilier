import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/page/Home/widget/test.dart';
import '../../page_details/details.dart';

class TbletGridView extends StatefulWidget {
  TbletGridView({required this.data, required this.leng});
  var data;
  int leng;
  @override
  State<TbletGridView> createState() => _TbletGridViewState();
}

class _TbletGridViewState extends State<TbletGridView> {
  late List<String>images = [];
  late List<String>abilityicon = [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.leng,
        gridDelegate:
        SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 305,
            mainAxisExtent:280.h
            ,
            childAspectRatio: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
              onTap: () => Get.to(Details(

                data: widget.data[index],

              )),
                      child: test(
                      data: widget.data[index],
                      image: widget.data[index]
                          .cover !=null? widget.data[index].cover: 'https://c8.alamy.com/compfr/j7kk5a/cabinet-en-bois-aux-fenetres-de-l-appartement-avec-vue-sur-le-london-platanes-j7kk5a.jpg')
                  );
        }
    );
  }
}

