import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/page/Profile/detaille_profile.dart';

import '../../../Model/joke.dart';
import '../../../cashd_image/image.dart';
import '../auth/Login/components/body.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List <Joke> Poste = [];
  List <Joke> PosteValide = [];
  List <Joke> PosteNonValide = [];

  Color colorPost = Colors.blue ;
  Color colorPosteValide = Colors.black ;
  Color colorPosteNonValide = Colors.black ;


  @override
  void initState() {
   setState(() {
     Poste = allAnnonceLogin ;
     for(int i =0 ; i<allAnnonceLogin.length ; i++){
       if(allAnnonceLogin[i].validated==1){
         PosteValide.add(allAnnonceLogin[i]);
       }else{
         PosteNonValide.add(allAnnonceLogin[i]);
       }
     }
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB6B2C8),
      body: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(30),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff5E5486), Color(0xff5E5480)]
                  )
              ),
              child: Container(
                width: double.infinity,
                height: 300.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                        ),
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        username,
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color:  Color(0xffB6B2C8),
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              GestureDetector(
                                onTap: ()=>setState(() {
                                  Poste=allAnnonceLogin;
                                  colorPost = Colors.blue;
                                  colorPosteValide = Colors.black;
                                  colorPosteNonValide = Colors.black;
;                                }),
                                child: Container(

                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Posts",
                                        style: TextStyle(
                                          color:colorPost,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        allAnnonceLogin.length.toString(),
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.pinkAccent,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Poste=[];
                                    Poste=PosteValide;
                                    colorPost = Colors.black;
                                    colorPosteValide = Colors.blue;
                                    colorPosteNonValide = Colors.black;
                                  });
                                },
                                child: Expanded(
                                  child: Column(

                                    children: <Widget>[
                                      Text(
                                        "Post Valide",
                                        style: TextStyle(
                                          color: colorPosteValide,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        PosteValide.length.toString(),
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.pinkAccent,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Poste=[];
                                    Poste=PosteNonValide;
                                    colorPost = Colors.black;
                                    colorPosteValide = Colors.black;
                                    colorPosteNonValide = Colors.blue;

                                  });
                                },
                                child: Expanded(
                                  child: Column(

                                    children: <Widget>[
                                      Text(
                                        "Post nvalide",
                                        style: TextStyle(
                                          color: colorPosteNonValide,
                                          fontSize: 18.0,

                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        PosteNonValide.length.toString(),
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.pinkAccent,
                                        ),
                                      ),



                                    ],
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
          Padding(
            padding:  EdgeInsets.only(top: 300),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount  : Poste.length,
                      itemBuilder: (context , index)=>

                          GestureDetector(
                            onTap:()=>Get.to( DetailleProfile(image: allAnnonceLogin[index].cover, data: allAnnonceLogin[index])),
                            child: ScreenUtilInit(
                                splitScreenMode: true,
                                builder: () {
                                  return Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: Stack(children: [
                                        Container(
                                          child: cachedImage("https://dashboard.royaimmo.ma/images/annonces/"+Poste[index].cover,),
                                          height: 120.h,
                                          width: 150.w,
                                          decoration:  BoxDecoration(
                                            // image: DecorationImage(
                                            //                 image:
                                            //                 fit: BoxFit.fill,
                                            //               ),
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10)),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 150.w),
                                          height: 120.h,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight: Radius.circular(10)),

                                          ),
                                          child: Stack(children: [
                                            Container(
                                                padding: EdgeInsets.only(top: 10.h,left: 10.w),
                                                child:Text(
                                                  Poste[index].price.toString() + ' dh',
                                                  style: TextStyle(
                                                    fontSize: 18.sp,
                                                    color: Color(
                                                      0xffb58350,
                                                    ),
                                                  ),
                                                )
                                            ),Container(
                                              padding: EdgeInsets.only(top: 35.h,left: 10.w),
                                              child: Text(
                                                Poste[index].title,
                                                maxLines: 1,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                top: -5.h,
                                                right: 0,
                                                child: Align(alignment:Alignment.topRight,child: IconButton(onPressed: (){},
                                                    icon: Icon( Icons.more_vert)))),
                                            Positioned(
                                              bottom: -10,
                                              right: -2,
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: IconButton(
                                                  onPressed: () {

                                                  },
                                                  icon: Icon(Icons.delete,
                                                      color: Colors.black54),
                                                ),
                                              ),),

                                            Container(
                                              margin: EdgeInsets.only(top: 85.h,left: 10.w),
                                              child: Wrap(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.location_on_rounded,
                                                        size: 14,
                                                      ), Text( Poste[index].region,style: TextStyle(fontSize: 14),),
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.home,
                                                        size: 14,
                                                      ), Text(Poste[index].city,style: TextStyle(fontSize: 14),),
                                                    ],
                                                  ),

                                                ],
                                              ),
                                            )
                                          ],),
                                        ),

                                      ],

                                      ),
                                    ) ,


                                  );
                                }),
                          ),


                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
