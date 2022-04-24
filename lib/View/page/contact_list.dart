import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Controller/getContasts.dart';
import '../../Model/joke.dart';
import '../../cashd_image/image.dart';
import '../../variable/variable.dart';
class ContactList extends StatelessWidget {
   ContactList({Key? key}) : super(key: key);
   Joke? _annonce;

  @override
  Widget build(BuildContext context) {
    if(contact.isEmpty && isLogin){
      GetContcts.getContacts();
    }

    if(isLogin)
      contact=[];
    return Scaffold(
      body:isLogin==false? Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(bottom: 25),
          child: ListView.builder(
              itemCount: contact.length,
              itemBuilder: (context,i){
                getAnonce(contact[i].annonceId!.toInt());
                print(_annonce?.cover.toString());
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
                                hasIcon: false,
                                headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                              width : 200 ,
                                              child: Text(contact[i].subject.toString())),
                                          Container(
                                              width : 200 ,
                                              child:Text(contact[i].createdAt.toString().substring(0,10)))
                                        ],
                                      ),
                                    ),
                                    Spacer(),


                                  ],
                                ),
                              ),
                              collapsed: Container(),
                              expanded: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(left: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(contact[i].phone.toString())),
                                  Container(
                                      padding: EdgeInsets.only(left: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(contact[i].email.toString())),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      //  color: Colors.white,
                                        child: Text(contact[i].message.toString())),

                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        child: Stack(children: [
                                          Container(
                                            child: cachedImage("https://dashboard.royaimmo.ma/images/annonces/${_annonce?.cover}",),
                                            height: 100,
                                            width: 150,
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
                                            margin: EdgeInsets.only(left: 150),
                                            height: 100,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight: Radius.circular(10)),

                                            ),
                                            child: Stack(children: [
                                              Padding(
                                                padding: EdgeInsets.only(top: 15,left: 10),
                                                child: Text(
                                                  "${_annonce?.title}",
                                                  maxLines: 2,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),



                                              Container(
                                                margin: EdgeInsets.only(top: 60,left: 10),
                                                child: Wrap(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.location_on_rounded,
                                                          size: 14,
                                                        ), Text("${_annonce?.region}",style: TextStyle(fontSize: 12),),
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
                                                        ), Text("${_annonce?.city}",style: TextStyle(fontSize: 14),),
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
                            initialExpanded: true,
                          ),

                        ],
                      ),
                    ));
              }),
        ),
      ):Column(
        children: [
          Container(color: Colors.red,height: 600,),
          SvgPicture.asset('assets/images/login.svg',
  //color: Colors.white,
 ) ,
        ],
      )
    );
  }
  getAnonce(int id){
    for(int i=0;i<slug_data.length;i++){
      if(id==slug_data[i].id){
        _annonce= slug_data[i];
       // print(" fgsd"+_annonce!.title);
        return;
      }
    }
  }
}
