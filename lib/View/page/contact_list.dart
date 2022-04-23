import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(itemBuilder: (context,i){
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
                                  left: 10.w,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                  Container(
                                      width : 200.w ,
                                      child: Text("Object" )),
                                  Container(
                                      width : 200.w ,
                                      child: Text("Dec,12,2019" ))
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
                                width: MediaQuery.of(context).size.width,
                                child: Text("0650421088")),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text("oopokni@gmail.com")),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  color: Colors.white,
                                  child: Text("kkkkkk kkkk kkkkk kkkkkk kkkkkk kkkk kkkkk kkkkkk kkkkkk kkkkkk kkkkkk kkkkk kkkk kkkkk kkkkkk kkkkkk kkkkkk kkkkkk kkkkk kkkkkk kkkkkk kkkkkk kkkkkk kkkkk")),

                            ),
                          ],
                        ),
                      ),
                      initialExpanded: true,
                    )
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
