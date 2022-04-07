import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roya_immobilie/View/order/contact_info.dart';
import 'package:roya_immobilie/screenSize/screenSized.dart';
import 'package:http/http.dart'as http;
import '../../../Model/data_list.dart';
import '../../../Model/joke.dart';
import '../../../Model/repositery.dart';
import '../../../cashd_image/image.dart';
import '../../../varia_ble/variable.dart';
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



  reloud() async{
    allAnnonceLogin = [];
    PosteNonValide =[];
    Poste = [];
    PosteValide=[];
    var response_1 = await http.get(
        Uri.parse('https://dashboard.royaimmo.ma/api/annonces'),
        headers: {
          //HttpHeaders.authorizationHeader:token_1.toString(),
          'Authorization': 'Bearer $token_global'
        });
    print(response_1.body);

    if (response_1.statusCode == 200) {

      final responseJsoon = json.decode(response_1.body);
      final responseJson = responseJsoon["data"];
      setState(() {
        for (Map annoncelogin in responseJson) {
          allAnnonceLogin.add(DataList.fromJson(annoncelogin.cast()));

        }

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

      });

    }
  }








  @override
  void initState() {

    setState(() {
      Poste=[];
      PosteNonValide=[];
      PosteValide=[];
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
    initState;
    var Screenwidth = MediaQuery.of(context).size.width;
    var Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffB6B2C8),
      // appBar: AppBar(title: Center(child: icon_apps),
      //   leading:  BackButton(
      //     onPressed: (){
      //       Poste=[];
      //       PosteNonValide=[];
      //       PosteValide=[];
      //     },
      //     color: Colors.white,
      //
      //
      //
      // ),),

      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: ScreenSized.CardSized(Screenwidth, Screenheight),
                child: Card(
                  elevation: 1,
                  shape:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white, width: 1)
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(30),
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,

                                  colors: [Color(0xff5E5480),Color(0xff5E5480)]
                              )
                          ),


                        ),
                      ),

                       Padding(
                        padding:  EdgeInsets.only(top: ScreenSized.ProfileImage(Screenwidth, Screenheight).h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50.0,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://i.pravatar.cc/",
                                ),
                                radius: 45.0,
                              ),
                            ),




                          ],
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsets.only(top: ScreenSized.PaddingUserName(Screenwidth, Screenheight).h),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            username ,
                            style: const TextStyle(
                              fontSize: 25.0,
                              fontStyle: FontStyle.italic,

                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 5,),

                      Padding(
                        padding:  EdgeInsets.only(top:ScreenSized.PaddingPost(Screenwidth, Screenheight).h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: ()=>setState(() {
                                v=0;
                                Poste=[];
                                PosteNonValide=[];
                                PosteValide=[];
                                Poste=allAnnonceLogin;
                                colorPost = Colors.blue;
                                colorPosteValide = Colors.black;
                                colorPosteNonValide = Colors.black;
                                                            }),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    allAnnonceLogin.length.toString(),
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                  const SizedBox(
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
                              child: Column(

                                children: <Widget>[


                                  Text(
                                    PosteValide.length.toString(),
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                  const SizedBox(
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
                              child: Column(

                                children: <Widget>[


                                  Text(
                                    PosteNonValide.length.toString(),
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                  const SizedBox(
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


                          ],
                        ),
                      ),




                    ],
                  ),


                ),
              ),
            ),

             Padding(
              padding:  EdgeInsets.only(top: 360.h),
              child: SingleChildScrollView(
                child: Column(

                  children: [
                    IconButton(onPressed: (){
                      reloud();
                    }, icon:  Icon(Icons.refresh),),

                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount  : allAnnonceLogin.length,
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
                                        child: cachedImage("https://dashboard.royaimmo.ma/images/annonces/${Poste[index].cover}",),
                                        height: 120.h,
                                        width: 150.w,
                                        decoration:  const BoxDecoration(

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
                                                  icon: const Icon( Icons.more_vert)))),
                                          Positioned(
                                            bottom: -10,
                                            right: -2,
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: IconButton(
                                                onPressed: ()async {


                                                  await  jokeRepository.deleteitem(id: Poste[index].id.toString());
                                                  setState(() {
                                                   if(v==0) {
                                                     allAnnonceLogin.remove(
                                                         Poste[index]);
                                                   }
                                                   else if (v==1) {
                                                     allAnnonceLogin.remove(
                                                         PosteValide[index]);
                                                   }else{
                                                     allAnnonceLogin.remove(
                                                         PosteNonValide[index]);
                                                   }
                                                     PosteNonValide=[];
                                                     Poste = [];
                                                     PosteValide = [];
                                                     Poste = allAnnonceLogin ;
                                                     for(int i =0 ; i<Poste.length ; i++){
                                                       if(Poste[i].validated==1){
                                                         PosteValide.add(Poste[i]);
                                                       }else{
                                                         PosteNonValide.add(Poste[i]);
                                                       }
                                                     }
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
      ),
    );
  }
}