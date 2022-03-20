import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/controller.dart';

import '../../varia_ble/variable.dart';

class SearchFiltter extends StatefulWidget {
  const SearchFiltter({Key? key}) : super(key: key);

  @override
  State<SearchFiltter> createState() => _SearchFiltterState();
}

class _SearchFiltterState extends State<SearchFiltter> {
  @override
  Widget build(BuildContext context) {

     String? _categorie;
    var _keyVent = GlobalKey<FormState>();
    var _keylocation = GlobalKey<FormState>();
    var _keyDemande = GlobalKey<FormState>();
    String _propritr_filter = 'ventr';

  late  String  searchvlue ;
   late String? searchVille ;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
            alignment: Alignment.center,
            child: const Text(
              'Filtrer',
              style: TextStyle(color: Colors.black),
            )),
        actions: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10),
            child: const Text(
              'EFFACER',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xffefefef),
      body: ScreenUtilInit(
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
                  Column(
                    children: [
                      TextFormField(
                        onChanged: ((value){
                          setState(() {
                            searchvlue = value;
                            print(searchvlue);
                          });


                        }),
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
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: TextFormField(
                          onChanged: ((value){
                           setState(() {
                             searchVille = value;
                           });
                          }),
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
                              Form(
                                key:_keyVent ,
                                child: Radio(
                                  value:'Vente',
                                  groupValue: _propritr_filter ,
                                  onChanged: (value) {
                                    setState(() {
                                      _propritr_filter='Vente';
                                      print(_propritr_filter);

                                    });
                                  },
                                ),
                              ),
                              Text('Vente'.tr),
                            ],
                          ),



                          Row(
                            children: [
                              Form(
                                key: _keylocation,
                                child: Radio(
                                  value: 'À location',
                                  groupValue: _propritr_filter,
                                  onChanged: (value) {
                                    setState(() {
                                      _propritr_filter='À location';
                                       print(_propritr_filter);
                                    });
                                  },
                                ),
                              ),
                              Text('À location'.tr),
                            ],
                          ),
                          Row(
                            children: [
                              Form(
                                key: _keyDemande,
                                child: Radio(
                                  value: 'Demande',
                                  groupValue: _propritr_filter,
                                  onChanged: (value) {
                                    setState(() {

                                      _propritr_filter='Demande';
                                      print(_propritr_filter);
                                    });
                                  },
                                ),
                              ),
                              Text('Demande'.tr),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffb58350),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                        onPressed: () {
                          print(searchvlue.toString() +"+"+_categorie.toString() + " "+searchVille.toString() + " "+_propritr_filter.toString());
                       //  controller.getFilter(searchvlue , _categorie , searchVille,_propritr_filter );
                        },
                        child: Text(
                          'RECHERCHER (56242)'.tr,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
