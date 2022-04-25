import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Model/joke.dart';
import '../../../Model/repositery.dart';
import '../../../variable/variable.dart';
import '../../routing_login.dart';
import '../Profile/detaille_profile.dart';
import 'details.dart';

class ListView_in_Detalis extends StatelessWidget {
   var data;
   int ?index;
    ListView_in_Detalis({required this.data,this.index});

  @override
  Widget build(BuildContext context) {
    late List<String>images = [];
    late List<String>abilityicon = [];
    getdate(int index)async{
      String x ="" ;
      int i=0;
      abilityicon=[];
      images = [];
      var l = await jokeRepository.GetDetiller(sug: data[index].slug);
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
        print(abi[i]["icon"].toString());
      }
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Details(
        iconability: abilityicon,
        images:images, data: data,showList: true,)));
    }
    return ScreenUtilInit(
      builder: () =>
          MaterialButton(
            onPressed: () {
              getdate(index!);
              },
            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            child: Stack(
              children: [
                Container(
                  child:  Text(
                   data.transaction.toString().tr,
                    style: TextStyle(color:Colors.white, fontSize: 15),
                  ),
                  padding: const EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 10.h, left: 10.w,right: 10.w),
                  //width: 50.h,
                  // height: 20,
                  decoration:  BoxDecoration(
                      color: data.transaction.toString()=="Sale"?Color(0xff9787cc):Colors.greenAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )
              ],
            ),
            margin: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
            height: 100.h,
            width: 150.w,
            decoration: BoxDecoration(
                image:  DecorationImage(
                  image: NetworkImage("https://dashboard.royaimmo.ma/images/annonces/${data.cover}"),
                  fit: BoxFit.fill,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r))),
        ),
        Container(
            margin: EdgeInsets.only(right: 20.w, left: 20.w),
            height: 25.h,
            width: 150.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  Text(
                    data.propertyType+' de '+data.area.toString(),
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(data.price.toString()+' Dhs', style: TextStyle(fontSize: 10))
                ]),
        )
      ]),
          ),
    );
  }
}
