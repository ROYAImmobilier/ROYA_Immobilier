import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/variable/variable.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Model/cityrepo.dart';
import '../../../Model/repositery.dart';
import '../../../screenSize/screenSized.dart';
import '../../order/order_distination.dart';
var l;
class DetailleProfile extends StatefulWidget {
  List<String>? images;
  var data;
  List<dynamic>iconability ;
  List<String> innerAbility = [];
  List<String> MainAbilities = [];
  List<String> AdditionalAbilities = [];
  int activeindex=0;
  int index;



  DetailleProfile({ this.images,  this.data,required this.iconability,required this.index});

  @override
  _DetailleProfileState createState() => _DetailleProfileState();
}

class _DetailleProfileState extends State<DetailleProfile> {

@override
  void initState() {
  getdate(widget.index);

    super.initState();
  }
getdate(int index) async {
  setState(() {
    progressdetille =true ;
  });
  //  print(token_global);
  // print(data[0].slug);
  print(index);
  // await Annonce_As_Login.getAnonnce();
  //print(Poste[index].title);
  print("slug "+slug_data[0].slug.toString());
  // print("id "+.toString());


 l = await jokeRepository.GetDetillerLogin(sug: index);
  var k = l['media'];
  var abi = l["abilities"];

  if (k.toString().isNotEmpty)
    for (int i = 0; i < k.length; i++) {
      widget.images?.add(k[i]['file_name']);

    }
  //

  widget.iconability=abi;
  abilitycompre();
  //  print(abi.toString());

  // print(abilityicon);

  // Get.to(DetailleProfile(
  //   images: images,
  //   data: Poste[index],
  // ),);
  setState(() {
    progressdetille =false ;
  });

}
  @override
  Widget build(BuildContext context) {
   // print(widget.iconability);
    var Screenwidth = MediaQuery.of(context).size.width;
    var Screenheight = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
        builder: ()  {
        return Scaffold(
          backgroundColor: Color(0xffe3e3e3),
          appBar: AppBar(
              title:  Center(
                child: SvgPicture.asset('assets/icon/logo-roya.svg',
                  width: 40,
                  height: 40,),),

              backgroundColor:Colors.white,
              leading:IconButton(
                onPressed:()=>Navigator.pop(context,true) ,icon: Icon
                (Icons.arrow_back_ios_sharp) , color: Colors.blue,)

          ),
          body:l!=null? SingleChildScrollView(
            child: Column(
              children: [

                Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 20.h, right: 20.w, left: 20.w),
                        height:
                        (MediaQuery.of(context).size.height * 0.30).h,
                        decoration: BoxDecoration(
                          // image: DecorationImage(
                          //   image: NetworkImage("https://dashboard.royaimmo.ma/images/annonces/"+widget.images[0]),
                          //   fit: BoxFit.fill,
                          // ),
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(10.r))),
                        child: CarouselSlider(
                            options: CarouselOptions(
                              //  height:    450.h ,
                              height:
                              (MediaQuery.of(context).size.height),
                              scrollDirection: Axis.horizontal,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              reverse: false,
                              autoPlay: false,
                              pageSnapping: true,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              onPageChanged: (value, res) {
                                setState(() {
                                  widget.activeindex = value;
                                });
                              },
                            ),
                            items: widget.images
                                ?.map((String slider) => Builder(
                              builder: (BuildContext context) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft:
                                      Radius.circular(10.r),
                                      topRight:
                                      Radius.circular(10.r)),
                                  child: Stack(
                                    children: [
                                      Container(
                                        // margin: EdgeInsets.only(top: 50),
                                        height: (MediaQuery.of(
                                            context)
                                            .size
                                            .height *
                                            0.5)
                                            .h,
                                        // decoration: const BoxDecoration(
                                        // //   borderRadius: BorderRadius.all(
                                        // //       Radius.circular(4.5)),
                                        // ),
                                        child: ClipRRect(
                                          // borderRadius: const BorderRadius.all(
                                          //     Radius.circular(10)),
                                          child:
                                          CachedNetworkImage(
                                            width: MediaQuery.of(
                                                context)
                                                .size
                                                .width,
                                            fit: BoxFit.fill,
                                            imageUrl:
                                            "https://dashboard.royaimmo.ma/images/annonces/" +
                                                slider,
                                            placeholder: (context,
                                                url) =>
                                                Icon(Icons.image),
                                            errorWidget: (context,
                                                url, error) =>
                                            const Icon(
                                                Icons.error),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ))
                                .toList()),
                      ),
                      Positioned(
                        child: BuldeIndector(),
                        // top: 0,
                        // right: 0,
                        // left: MediaQuery.of(context).size.width.toDouble()/2,
                        bottom: 5,
                      ),

                    ]),
                // Container(
                //   margin:
                //   EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
                //   height: 250.h,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: NetworkImage("https://dashboard.royaimmo.ma/images/annonces/${widget.data.cover}"),
                //         fit: BoxFit.fill,
                //       ),
                //       color: Colors.white,
                //       borderRadius: BorderRadius.only(
                //           topLeft: Radius.circular(10.r),
                //           topRight: Radius.circular(10.r))),
                // ),
                Container(
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                  height: ScreenSized.ProfileDetalse(Screenwidth,Screenheight),
                  decoration: BoxDecoration(
                      color: Color(0xffc7c2d8),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r))),
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10.h, left: 10.w),
                          alignment: Alignment.topLeft,
                          child: const CircleAvatar(
                            backgroundColor: Color(0xffbfa280),
                            radius: 20,
                            child: Text('AA'),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(
                                    top: 15.h, left: 10.w),
                                child: Text(l["advertiser"])),
                            Container(
                              padding:
                              EdgeInsets.only(top: 3.h, left: 10.w),
                              child:  Text(
                               l["created_at"].toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                     // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //  alignment: Alignment.center,
                          // width: 150,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: const Color(0xff5d5386),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Icon(Icons.update),
                                SizedBox(
                                  width: 2.w,
                                ),
                                 Text(
                                  "Update".tr,
                                ),
                              ],
                            ),
                            onPressed: ()async {
                              if (!verify_region_city)
                                await ServicesRgion.getUsers().then(
                                    (regions) {
                                  setState(() {
                                    region = regions!;
                                    ListCity();
                                  });
                                },
                              );
                              //amar
                              getData_put =
                                  await jokeRepository.getdata(
                                  id: widget.data
                                      .id
                                      .toString());
                             // verify = true;
                              print(getData_put);
                              if (getData_put==null) {
                                Get.snackbar("Error", "Server");
                                // Get.to(Add_Annonce());
                                // reloud();
                              } else if (!getData_put.isEmpty) {
                                Get.defaultDialog(
                                    title: "Modification",
                                    textCancel: "Cancel".tr,
                                    textConfirm: "yes".tr,
                                    middleText:
                                    "Are you wante to modifier ?"
                                        .tr,
                                    onCancel: () {},
                                    onConfirm: () {
                                      verify_update = true;
                          Get.to(Add_Annonce());
                                    });
                              }

                              //  Get.to(Add_Annonce());
                              // setState(() {
                              //   reloud();
                              //
                              // });
                              //delete

                            },
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          //  margin: EdgeInsets.only(right: 55.w),
                          // width: 150,
                          // alignment: Alignment.center,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color(0xff5d5386),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.delete),
                                SizedBox(
                                  width: 2.w,
                                ),
                                 Text(
                                  "Delete".tr,
                                ),
                              ],
                            ),
                            onPressed: () {
                              Get.defaultDialog(
                                  title: "Supprimer",
                                  textCancel: "Cancel".tr,
                                  textConfirm: "yes".tr,
                                  middleText:
                                  "Are you want to delete ?".tr,
                                  barrierDismissible:false,
                                  onCancel: () {


                                  },
                                  onConfirm: () async {
                                    await jokeRepository.deleteitem(
                                        id: widget.data.id.toString());
                                    Get.snackbar("Sucsses", "Voter Annonce et supprimer" );
                                    //  Future.delayed( Duration(milliseconds: 500), () {
                                    //   // deleayed code here
                                    //       Get.back();
                                    // });

                                    Navigator.pop(context,true);
                                    Navigator.pop(context,true);
                                   // Navigator.pop(context,true);


                                  });
                            },
                          ),
                        )
                      ],
                    )
                  ]),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                 // height: 50.h,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                          Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Color(0xffc7c2d8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      )),
                  child: Text(
                   l["title"],
                    style: TextStyle(fontSize: 24,),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        SvgPicture.asset(
                          'assets/icon/annonces/bed-sharp.svg',
                          width: 20.w,
                          height: 20.h,
                          //   matchTextDirection: true,
                          color: Color(0xff8a8a8a),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "${l[
                          "bedrooms"
                        ]} Beds",
                          style: TextStyle(color: Color(0xff8a8a8a)),
                        )
                      ]),
                      Row(children: [
                        SvgPicture.asset(
                          'assets/icon/annonces/bathroom.svg',
                          width: 20.w,
                          height: 20.h,
                          // matchTextDirection: true,
                          color: Color(0xff8a8a8a),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "${l["bathrooms"]} Boths",
                          style: TextStyle(color: Color(0xff8a8a8a)),
                        )
                      ]),
                      Row(children: [
                        SvgPicture.asset(
                          'assets/icon/m.svg',
                          width: 20.w,
                          height: 20.h,
                          //  matchTextDirection: true,
                          color: const Color(0xff8a8a8a),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          l["area"].toString()+ "m²",
                          style: const TextStyle(color: Color(0xff8a8a8a)),
                        )
                      ]),
                    ],
                  ),
                ),
                Container(
                  //height: ,
                    margin: EdgeInsets.only(
                        right: 20.w, left: 20.w, bottom: 15.h),
                    // child: Divider(
                    //   color: Colors.black,
                    // ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 2.w, color: const Color(0xff8a8a8a)),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                  child: Stack(
                    // mainAxisAlignment: ,
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text("Adresse")),
                      SizedBox(width: 15,),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                         l["address"] +
                              ' => ' +
                             l["quartier"],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      //height: ,
                        margin: EdgeInsets.only(
                            right: 20.w, left: 20.w, top: 15.h),
                        // child: Divider(
                        //   color: Colors.black,
                        // ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 2.w, color: Color(0xff8a8a8a)),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15,top:5,bottom: 5,right: 15),
                      child: Text("Main Abilites".tr,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 20.w, left: 20.w, bottom: 5),
                      child: Container(
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            //   physics: const NeverScrollableScrollPhysics(),
                            itemCount:widget.MainAbilities.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext ctx, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset("lib/abilities/${widget.MainAbilities[index].toString()}" , width: 25,height: 25,color: Colors.blue,),
                              );
                            }),
                      ),
                    ),  Padding(
                      padding: const EdgeInsets.only(left: 15,bottom: 5,right: 15),
                      child: Text("Innir Abilites".tr),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 20.w, left: 20.w, bottom: 5),
                      child: Container(
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            //  physics: const NeverScrollableScrollPhysics(),
                            itemCount:widget.innerAbility.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext ctx, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset("lib/abilities/${widget.innerAbility[index].toString()}" ,  width: 25,height: 25,color: Colors.blue),
                              );
                            }),
                      ),
                    ),  Padding(
                      padding: const EdgeInsets.only(left: 15,bottom: 5,right: 15),
                      child: Text("Addition Abilites".tr),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 20.w, left: 20.w, bottom: 5),
                      child: Container(
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            //   physics: const NeverScrollableScrollPhysics(),
                            itemCount:widget.AdditionalAbilities.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext ctx, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset("lib/abilities/${widget.AdditionalAbilities[index].toString()}" ,  width: 25,height: 25,color: Colors.blue),
                              );
                            }),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      //height: ,
                        margin: EdgeInsets.only(
                            right: 20.w, left: 20.w, bottom: 15.h),
                        // child: Divider(
                        //   color: Colors.black,
                        // ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 2.w,
                                color: const Color(0xff8a8a8a)),
                          ),
                        )),
                  ],
                ),


                Container(
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Description',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.w, left: 20.w),
                  alignment: Alignment.topLeft,
                  child: Text(l["description"]),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ):
          Center(
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(   backgroundColor: Colors.grey,
                    strokeWidth: 8,
                 ),SizedBox(height: 5,),
                  Text("please wait"),
                ],
              ),
          ),
        );
      }
    );
  }
  Widget BuldeIndector() => AnimatedSmoothIndicator(
    count: l["media"].length,
    activeIndex: widget.activeindex,
    effect:  WormEffect(
      dotHeight: 16,
      dotWidth: 16,
      type: WormType.thin,
      // strokeWidth: 5,
    ),

  );
abilitycompre() {

  for(int j=0;j<widget.iconability.length;j++){
    for(int i=0;i<ListAbility.length;i++){
      if (ListAbility[i].id.toString()==widget.iconability[j].toString() && ListAbility[i].type=="main" ){

        widget.MainAbilities.add(ListAbility[i].icon.split("/")[2]);

      }
      else if(ListAbility[i].id.toString()==widget.iconability[j].toString() && ListAbility[i].type=="additional" ){

        widget.AdditionalAbilities.add(ListAbility[i].icon.split("/")[2]);

      }
      else if (ListAbility[i].id.toString()==widget.iconability[j].toString() && ListAbility[i].type=="inner" ){

        widget.innerAbility.add(ListAbility[i].icon.split("/")[2]);

      }
    } }

}
}
