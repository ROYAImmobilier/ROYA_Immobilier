import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roya_immobilie/View/page/Home/widget/test.dart';
import 'package:roya_immobilie/Model/repositery.dart';
import '../../page_details/details.dart';
import 'listeanonnce.dart';
class MobileGridView extends StatefulWidget {
  MobileGridView({required this.data, required this.leng});

  var data;
  int leng;

  @override
  State<MobileGridView> createState() => _MobileGridViewState();
}

class _MobileGridViewState extends State<MobileGridView> {
  late List<String>images = [];
  getdate(int index)async{
    images = [];
    var k = await jokeRepository.GetDetiller(sug: widget.data[index].slug);
    print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
    print(k[0]['file_name']);
    print(k.length.toString());
    for(int i =0 ; i<k.length;i++){
      images.add(k[i]['file_name']);
      print(k[i]['file_name']);
    }
    Get.to(Details(
      images: images,
      data: widget.data[index],
    ),);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(MediaQuery
        .of(context)
        .size
        .height *
        0.35);
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
                  onTap: () =>getdate(index),
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

