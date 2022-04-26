import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:roya_immobilie/Model/repositery.dart';
import 'package:roya_immobilie/View/page/Home/widget/test.dart';

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
  getdate(int index)async{
    images = [];
    abilityicon=[];
    var l = await jokeRepository.GetDetiller(sug: widget.data[index].slug);
    var k = l['media'] ;
    var abi = l["abilities"];
    print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
    //print(k[0]['file_name']);
  //  print(k.length.toString());
    if(k.toString().isNotEmpty)
    for(int i =0 ; i<k.length;i++){
      images.add(k[i]['file_name']);
      print(k[i]['file_name']);
    }

    for(int i =0 ; i<abi.length ; i++){
      abilityicon.add(abi[i]["icon"]);
     // print(abi[i]["icon"].toString());
    }
    print(abilityicon);

    Get.to(Details(
      images: images,
      data: widget.data[index],
      iconability:abilityicon,
    ),);
  }
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

