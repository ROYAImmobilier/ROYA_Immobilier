import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roya_immobilie/Model/ModelAnnonce.dart';
import 'package:roya_immobilie/View/page/Home/widget/mobilestackwidget.dart';
import 'package:roya_immobilie/View/page/Home/widget/smallScreen.dart';
import 'package:roya_immobilie/View/page/Home/widget/tabletstackwidget.dart';
import 'package:roya_immobilie/View/page/Home/widget/testplatform.dart';

class CategoryItems extends StatelessWidget{
  late String icon ;
  late String title ;
  late int leng;
  late List<ModelAnnonce>data;
  CategoryItems ({
    required this.icon,
    required this.title,
    required this.data , required this.leng});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:  const Color(0xffefefef),
      appBar: AppBar(
        backgroundColor:  const Color(0xffefefef),
        title: Row(
          children: [
            SvgPicture.asset(icon ,width: 40,height: 40,),
             const SizedBox(width: 40,),
            Text(title , style: const TextStyle(color: Colors.black45),),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: ResponsiveLayout_(tabliteBody: TbletGridView(leng: leng, data: data,),
          mobileBody: MobileGridView(leng: leng, data: data,), smallBody: SmallScreen(leng: leng, data: data),),
      ),//test(image: data[index].cover, data: data[index]) ,)
      );
  }
}
