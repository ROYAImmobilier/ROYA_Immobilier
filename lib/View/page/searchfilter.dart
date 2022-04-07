import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Model/joke.dart';
import 'package:roya_immobilie/View/page/Home/widget/listeanonnce.dart';
import 'package:roya_immobilie/View/page/page_details/details.dart';
import 'package:roya_immobilie/controller.dart';

import '../../varia_ble/variable.dart';
import 'Home/home.dart';

class SearchFiltter extends StatefulWidget {
  var data ;
  SearchFiltter({ required this.data});

  @override
  State<SearchFiltter> createState() => _SearchFiltterState();
}

class _SearchFiltterState extends State<SearchFiltter> {
  String? _categorie;
  var _keyVent = GlobalKey<FormState>();
  String _propritr_filter = 'Vente';
  var _search=TextEditingController();
  var _ville_search=TextEditingController();
  String ? searchvlue ;
  String? searchVille ;
  List<Joke> filtrResulta = [];
  bool show = false ;
  @override
  Widget build(BuildContext context) {



    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading:Center(
              child: const Text(
                'Filtrer',
                style: TextStyle(color: Colors.black),
              ),
            ),
            actions: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: (){
                    _search.clear();

                    _ville_search.clear();
                    setState(() {
                      _propritr_filter='Vente';
                      _categorie=null;
                    });

                  },
                  child: const Text(
                    'EFFACER',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xffefefef),
          body: Form(
            key: _keyVent,
            child: ScreenUtilInit(
              designSize: const Size(360, 690),
              splitScreenMode: true,
              builder: () {
                return Container(
                  height: double.infinity,
                  margin: const EdgeInsets.all(25),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                   show==false ?   Column(
                          children: [
                            TextFormField(
                              controller: _search,
                              validator: (val){
                                if(val!.isEmpty){
                                  return "Que rechercher vous ?";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      top: 8.h, bottom: 8.h, right: 8.w, left: 8.w),
                                  //fillColor: Colors.white,
                                  // labelText: "",
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Que rechercher vous ?',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3.w),
                                      borderRadius: BorderRadius.circular(5))),
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text('Catégorie'.tr)),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 35.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: DropdownButton<String>(
                                icon: const Icon(Icons.keyboard_arrow_down_sharp),
                                elevation: 16,
                                isExpanded: true,

                                // style: const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  // color: Colors.deepPurpleAccent,
                                ),
                                  hint: Text('Category'),
                                value: _categorie,
                               // value: dropdownValue,
                                items: categorie
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(

                                    value: value,
                                    child: Text("  $value"),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                 setState(() {
                                   _categorie = newValue ;
                                 });
                                },

                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text('Ville'.tr)),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                 // color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              child: TextFormField(
                                controller: _ville_search,
                                validator: (val){
                                  if (val!.isEmpty){
                                    return 'entre ville';
                                  }return null;
                                },

                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        top: 8.h, bottom: 8.h, right: 8.w, left: 8.w),
                                    //fillColor: Colors.white,
                                    // labelText: "",
                                    fillColor: Colors.white,
                                    filled: true,
                                    // labelText: "",
                                    hintText: 'Entrez le nom de la ville ?'.tr,
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(width: 3),
                                        borderRadius: BorderRadius.circular(5))),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text('Type d\'annonce'.tr)),
                            const SizedBox(
                              height: 2,
                            ),
                            Wrap(
                              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                               //
                                Row(
                                  children: [
                                    Radio(
                                      value:'Vente',
                                      groupValue: _propritr_filter ,
                                      onChanged: (value) {
                                        setState(() {
                                          _propritr_filter='Vente';
                                         // print(_propritr_filter);

                                        });
                                      },
                                    ),
                                    Text('Vente'.tr),
                                  ],
                                ),



                                Row(
                                  children: [
                                    Radio(
                                      value: 'À location',
                                      groupValue: _propritr_filter,
                                      onChanged: (value) {
                                        setState(() {
                                          _propritr_filter='À location';
                                         //  print(_propritr_filter);
                                        });
                                      },
                                    ),
                                    Text('À location'.tr),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 'Demande',
                                      groupValue: _propritr_filter,
                                      onChanged: (_) {
                                        setState(() {

                                          _propritr_filter='Demande';
                                        //  print(_propritr_filter);
                                        });
                                      },
                                    ),
                                    Text('Demande'.tr),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ) :Container(),
                        Container(
                          decoration:  const BoxDecoration(
                              color: Color(0xffb58350),
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          alignment: Alignment.bottomCenter,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                               TextButton(
                                    onPressed: () {
                                 setState(() {
                                   show=!show;
                                 });
                                    if(_keyVent.currentState!.validate() &&_categorie!.isNotEmpty) {
                                      setState(() {

                                            searchvlue = _search.text;
                                            searchVille = _ville_search.text;
                                           // _propritr_filter='Vent';
                                            for(int i=0;i<widget.data.length;i++) {
                                              if((widget.data[i].city.contains(searchVille!) ||
                                                  widget.data[i].propertyType.contains(_categorie!)) ||
                                                  (widget.data[i].propertyType.contains(_propritr_filter) ||
                                                  widget.data[i].title.contains(searchvlue))
                                              ){
                                                filtrResulta.add(widget.data[i]);
                                              }
                                            }



                                          });
                  }
                                        },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'RECHERCHER (56242)'.tr,
                                        style: TextStyle(color: Colors.white),

                                      ),
                                    ),
                                  ),
                              show == true? IconButton(onPressed: (){
                                setState(() {
                                  show=false;
                                });
                              }, icon: Icon(Icons.arrow_circle_down) ):Container(),

                            ],
                          ),


                        ),

                        show==true ?   Stack(
                          children: [

                            Container(
                              color: Color(0xffefefef),
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child:

                              filtrResulta.length==0?
                              //
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8,right: 8),
                                    child: SvgPicture.asset(
                                      'assets/icon/seaeching_vide.svg',
                                      width: 400.h,
                                    ),
                                  ),
                                  const Text(
                                    'Search results are empty ',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              )
                                  :
                              ListView.builder(
                                  itemCount: filtrResulta.length,
                                  itemBuilder: (context , i) {
                                    return Card(
                                      child: GestureDetector(
                                        onTap: (){
                                          Get.to(Details(image: filtrResulta[i].cover, data: filtrResulta[i]));
                                        },
                                        child: ListTile(
                                          leading: Container(
                                            width: 40.w,
                                            height:60.h ,
                                            decoration:  BoxDecoration(
                                              image:  DecorationImage(
                                                image: NetworkImage(
                                                  filtrResulta[i].cover,
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                              color: Colors.white,
                                            ),

                                          ),
                                          title: Text(filtrResulta[i].title),
                                          subtitle: Column(
                                            children: [
                                              Text(
                                                  filtrResulta[i].region +
                                                      '-' +
                                                      filtrResulta[i].city),
                                              Wrap(

                                                children: [
                                                  Container(
                                                    child: Row(children: [
                                                      SvgPicture.asset(
                                                        'assets/icon/annonces/bed-sharp.svg',
                                                        width: 10.w,
                                                        height: 10.h,
                                                        matchTextDirection:
                                                        true,
                                                        color:
                                                        Color(0xff8a8a8a),
                                                      ),
                                                      Text(
                                                        "${filtrResulta[i].bedrooms} Beds",
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xff8a8a8a)),
                                                      )
                                                    ]),
                                                  ),
                                                  Row(children: [
                                                    SvgPicture.asset(
                                                      'assets/icon/annonces/bathroom.svg',
                                                      width: 10.w,
                                                      height: 10.h,
                                                      matchTextDirection:
                                                      true,
                                                      color:
                                                      const Color(0xff8a8a8a),
                                                    ),
                                                    Text(
                                                      "${filtrResulta[i].bathrooms} Boths",
                                                      style: const TextStyle(
                                                          color: Color(
                                                              0xff8a8a8a)),
                                                    )
                                                  ]),
                                                  Row(children: [
                                                    SvgPicture.asset(
                                                      'assets/icon/m.svg',
                                                      width: 10.w,
                                                      height: 10.h,
                                                      matchTextDirection:
                                                      true,
                                                      color:
                                                      Color(0xff8a8a8a),
                                                    ),
                                                    Text(
                                                      "${filtrResulta[i].area} m²",
                                                      style: const TextStyle(
                                                          color: Color(
                                                              0xff8a8a8a)),
                                                    )
                                                  ]),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),

                          ],
                        ):Container()
                      ],
                    ),
                  ),
                );
              },
            ),
          ),


    );



  }

  }

