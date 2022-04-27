import 'dart:convert';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:roya_immobilie/View/page/Home/widget/drawerpage.dart';
import 'package:roya_immobilie/View/page/auth/Login/login_screen.dart';
import 'package:roya_immobilie/View/page/serche_page.dart';

import '../../Model/Contact.dart';
import '../../cashd_image/image.dart';
import '../../screenSize/screenSized.dart';
import '../../variable/variable.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  late int index;
  int ?x;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    print(5);
    if(contact.isEmpty && isLogin){
      setState(() {
        getContacts();
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var Screenwidth = MediaQuery
        .of(context)
        .size
        .width;
    var Screenheight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        drawer: DrawerPage(),
        appBar: AppBar(

          title: Center(
            child: SvgPicture.asset('assets/icon/logo-roya.svg',
              width: 40,
              height: 40,),),
          actions: [

            GestureDetector(
              onTap: (() => Get.to(Sercher())),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icon/search.svg',
                  width: ScreenSized
                      .IconFiltter(
                      Screenwidth, Screenheight)
                  ,
                  height: ScreenSized
                      .IconFiltter(
                      Screenwidth, Screenheight)
                  ,
                  color: Colors.black,
                ),
              ),
            ),

          ],
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                //menu.svg
                icon: SvgPicture.asset('assets/icon/menu.svg',
                    width: ScreenSized
                        .IconFiltter(
                        Screenwidth, Screenheight)
                    ,
                    height: ScreenSized
                        .IconFiltter(
                        Screenwidth, Screenheight)

                    , matchTextDirection: true),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip:
                MaterialLocalizations
                    .of(context)
                    .openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body:isLogin==true? Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            padding: EdgeInsets.only(bottom: 25),
            child: ListView.builder(
                itemCount: contact.length,
                itemBuilder: (context, i) {

                  widget.index=contact[i].annonceId!.toInt();
                  for(int i=0;i<slug_data.length;i++){
                    if(slug_data[i].id==widget.index){
                      widget.x=i;
                    }
                  }

                  //print(slug_data[widget.index].cover.toString());
                  // print(_annonce?.cover.toString());
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffF8F8F8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 3,
                                  offset: Offset(0, 3)),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            children: [
                        ExpandableNotifier(
                        child: ExpandablePanel(
                        theme: const ExpandableThemeData(

                        hasIcon: true,
                            headerAlignment:
                            ExpandablePanelHeaderAlignment.center,
                            tapBodyToExpand: true,
                            tapBodyToCollapse: true,
                        ),


                        header: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            Container(
                            decoration: const BoxDecoration(
                            color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    offset: Offset(2, 1)),
                              ],
                            ),
                            margin: EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.message)
                            )),
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  width: 200,
                                  child: Text(contact[i].subject
                                      .toString())),
                              Container(
                                  width: 200,
                                  child: Text(contact[i].createdAt
                                      .toString().substring(0, 10)))
                            ],
                          ),
                        ),


                  ],
                  ),
                  ),

                  collapsed: Container(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(contact[i].message.toString() , maxLines: 1,),
                  ),),

                  expanded: Column(
                  children: [
                  Container(
                  padding: EdgeInsets.only(left: 5),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,

                  child: Row(
                  children: [
                  Icon(Icons.phone,color: Colors.grey),
                  SizedBox(width: 10,),
                  Text(contact[i].phone.toString()),
                  ],
                  )),

                  SizedBox(height: 10,),

                  Container(
                  padding: EdgeInsets.only(left: 5),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,

                  child: Row(
                  children: [
                  Icon(Icons.email ,color: Colors.grey),
                  SizedBox(width: 10,),
                  Text(contact[i].email.toString() , style: TextStyle(color: Colors.blue),),
                  ],
                  )),
                  SizedBox(height: 10,),

                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                  //  color: Colors.white,

                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Container(
                  child: Text(
                  contact[i].message.toString() , style: TextStyle(fontSize: 16,color: Colors.grey),),
                  )),



                  ),
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                  padding: EdgeInsets.all(5),
                  child: Stack(children: [
                  Container(
                  child: cachedImage(
                  "https://dashboard.royaimmo.ma/images/annonces/${slug_data[widget.x!].cover}",),
                  height: 100,
                  width: 150,
                  decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //                 image:
                  //                 fit: BoxFit.fill,
                  //               ),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(
                  10)),
                  ),
                  ),
                  Container(
                  margin: EdgeInsets.only(left: 150),
                  height: 100,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(
                  10)),

                  ),
                  child: Stack(children: [
                  Padding(
                  padding: EdgeInsets.only(
                  top: 15, left: 10),
                  child: Text(
                  "${slug_data[widget.x!].title}",
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                  fontSize: 14,
                  ),
                  ),
                  ),


                  Container(
                  margin: EdgeInsets.only(
                  top: 60, left: 10),
                  child: Wrap(
                  children: [
                  Row(
                  children: [
                  Icon(
                  Icons
                      .location_on_rounded,
                  size: 14,
                  ),
                  Text("${slug_data[widget.x!].region}",
                  style: TextStyle(
                  fontSize: 12),),
                  ],
                  ),

                  SizedBox(
                  height: 20,
                  ),
                  Row(
                  children: [
                  Icon(
                  Icons.home,
                  size: 14,
                  ),
                  Text("${slug_data[widget.x!].city}",
                  style: TextStyle(
                  fontSize: 14),),
                  ],
                  ),

                  ],
                  ),
                  )
                  ],),
                  ),

                  ],

                  ),
                  )),


                  ],
                  ),
                  ),

                  initialExpanded: false,

                  ),

                  ],
                  ),
                  ));
                }),
          ),
        ):SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Center(
                child: SvgPicture.asset('assets/images/login.svg',
                  width: 150,
                  height: 300,
                  //color: Colors.white,
                ),

              ) ,
              SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  Get.to(LoginScreen());
                },
                child: Container(width: double.infinity,
                margin: EdgeInsets.all(15),
                height: 45,
                decoration: BoxDecoration(color: Colors.blue,
                  borderRadius: BorderRadius.circular(15)
                ),
                  child: Center(child: Text("Login",)),
                ),
              )
            ],
          ),
        )
    );
  }


  Future getContacts() async {
    print(token_global);
    try {
      var response = await http.get(
          Uri.parse('https://dashboard.royaimmo.ma/api/contacts'),
          headers: {
            //HttpHeaders.authorizationHeader:token_1.toString(),
            'Authorization': 'Bearer $token_global'
          }
      );
      // print(response.body);


//print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseJsoon = json.decode(response.body);
        final responseJson = responseJsoon["data"];
        print(responseJson);
        setState(() {
          for (Map annoncelogin in responseJson) {
            contact.add(Contacts.fromJson(annoncelogin.cast()));
          }
        });


      }
      // print(contact[0].email);

    } catch (e) {
      print('error ' + e.toString());
    }
  }

}