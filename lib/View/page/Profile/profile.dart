import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roya_immobilie/View/order/contact_info.dart';

import '../../../Model/data_list.dart';
import '../../../Model/joke.dart';
import '../../../Model/repositery.dart';
import '../../../cashd_image/image.dart';
import '../auth/Login/components/body.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 late int v =0 ;
  List <DataList> Poste = [];
  List <DataList> PosteValide = [];
  List <DataList> PosteNonValide = [];

  Color colorPost = Colors.black ;
  Color colorPosteValide = Colors.black ;
  Color colorPosteNonValide = Colors.black ;


  @override
  void initState() {
    setState(() {
      Poste = allAnnonceLogin ;
      for(int i =0 ; i<Poste.length ; i++){
        if(Poste[i].validated==1){
          PosteValide.add(Poste[i]);
        }else{
          PosteNonValide.add(Poste[i]);
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

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 350.h,
              child: Card(
                elevation: 1,
                shape:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 1)
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                          child: Container(
                            height: 120.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(30),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,

                                    colors: [Color(0xff5E5480),Color(0xff5E5480)]
                                )
                            ),


                          ),
                        ),

                         Padding(
                          padding:  EdgeInsets.only(top: 70.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 55.0,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "https://i.pravatar.cc/",
                                  ),
                                  radius: 50.0,
                                ),
                              ),




                            ],
                          ),
                        ),


                      ],
                    ),
                    SizedBox(height: 5,),
                    Text(
                      username ,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontStyle: FontStyle.italic,

                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      username+"@gmail.com" ,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black45,
                      ),
                    ),
                 SizedBox(height: 15,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: ()=>setState(() {
                              v=0;
                              Poste=allAnnonceLogin;
                              colorPost = Colors.blue;
                              colorPosteValide = Colors.black;
                              colorPosteNonValide = Colors.black;
                              ;                                }),
                            child: Container(

                              child: Column(
                                children: <Widget>[


                                  Text(
                                    allAnnonceLogin.length.toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Posts",
                                    style: TextStyle(
                                      color:colorPost,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
                                v=1;
                              });
                            },
                            child: Expanded(
                              child: Column(

                                children: <Widget>[


                                  Text(
                                    PosteValide.length.toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Valide",
                                    style: TextStyle(
                                      color: colorPosteValide,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
                                v=2;

                              });
                            },
                            child: Expanded(
                              child: Column(

                                children: <Widget>[


                                  Text(
                                    PosteNonValide.length.toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Non valide",
                                    style: TextStyle(
                                      color: colorPosteNonValide,
                                      fontSize: 18.0,

                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),




                  ],
                ),


              ),
            ),
          ),

           Padding(
            padding:  EdgeInsets.only(top: 350.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount  : Poste.length,
                    itemBuilder: (context , index)=>
                        ScreenUtilInit(
                            splitScreenMode: true,
                            builder: () {
                              return Directionality(
                                textDirection: TextDirection.ltr,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Stack(children: [
                                    Container(
                                      child: cachedImage("https://dashboard.royaimmo.ma/images/annonces/"+"Poste[index].cover",),
                                      height: 120.h,
                                      width: 150.w,
                                      decoration:  const BoxDecoration(
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
                                              onPressed: ()async {

                                                  print(Poste[index].id.toString());
                                                await  jokeRepository.deleteitem(id: Poste[index].id.toString());
                                                setState(() {
                              Poste.remove( Poste[index]);
                             // PosteNonValide.remove(Poste[index]);
                            //  PosteValide.remove(Poste[index]);

                            // if(v==0){
                            //   if(Poste[index].validated==1){
                            //   Poste.remove( Poste[index]);
                            //   PosteValide.remove( Poste[index]);
                            //   }else{
                            //   Poste.remove( Poste[index]);
                            //   PosteNonValide.remove( Poste[index]);
                            //   }
                            //   }else if(v==1){
                            //                          Poste.remove( Poste[index]);
                            //                          PosteValide.remove( Poste[index]);
                            //                        }else{
                            //                          Poste.remove( Poste[index]);
                            //                          PosteNonValide.remove( Poste[index]);
                            //                        }
                                                 // initState();
                                                });


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
                                                children:  [
                                                  Icon(
                                                    Icons.location_on_rounded,
                                                    size: 14,
                                                  ), Text( Poste[index].region,style: TextStyle(fontSize: 14),),
                                                ],
                                              ),

                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Row(
                                                children:  [
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}