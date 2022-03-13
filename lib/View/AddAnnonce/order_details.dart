import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status_change/status_change.dart';

class Add_Annonce_2 extends StatefulWidget {
  const Add_Annonce_2({Key? key}) : super(key: key);

  @override
  State<Add_Annonce_2> createState() => _Add_AnnonceState();
}

class _Add_AnnonceState extends State<Add_Annonce_2> {
  var dropdownValue = "One";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            ' Stepper ',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
            height: 30,
            color: const Color(0xffefefef),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(15),
            // margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Area (m²) :',
                      style: TextStyle(),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextFormField(
                    //controller: ,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        //fillColor: Colors.white,
                        // labelText: "",
                        hintText: 'select property',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3),
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(alignment: Alignment.topLeft, child: Text('Stauts')),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                    value: dropdownValue,
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text("  $value"),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text('Location',
                        style:
                            TextStyle(color: Color(0xffbfa280), fontSize: 20))),
                const SizedBox(
                  height: 25,
                ),
                Container(alignment: Alignment.topLeft, child: Text('Adresse')),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextFormField(
                    //controller: ,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        //fillColor: Colors.white,
                        // labelText: "",
                        hintText: 'Adresse',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3),
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(alignment: Alignment.topLeft, child: Text('Region')),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                    value: dropdownValue,
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text("  $value"),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(alignment: Alignment.topLeft, child: Text('City')),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                    value: dropdownValue,
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text("  $value"),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    alignment: Alignment.topLeft, child: Text('Quartier')),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextFormField(
                    //controller: ,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        //fillColor: Colors.white,
                        // labelText: "",
                        hintText: 'Adresse',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3),
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xffbfa280),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      padding: EdgeInsets.only(
                          top: 10, left: 25, bottom: 10, right: 25),
                      child: const Text(
                        "Suivant",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
