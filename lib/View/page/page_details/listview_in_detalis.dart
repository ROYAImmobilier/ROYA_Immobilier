import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'details.dart';

class ListView_in_Detalis extends StatelessWidget {
   var data;
   int ?index;
    ListView_in_Detalis({required this.data,this.index});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      builder: () =>
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Details(
                      data: data,showList: true,)));
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
