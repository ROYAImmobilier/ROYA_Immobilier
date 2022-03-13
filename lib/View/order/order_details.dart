import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_info.dart';

class Add_Annonce_2 extends StatefulWidget {
  @override
  State<Add_Annonce_2> createState() => _Add_AnnonceState();
}

class _Add_AnnonceState extends State<Add_Annonce_2> {
  int quntity1 = 0;
  int quntity2 = 0;
  int kichens = 0;

  var dropdownValue = "dh";
  var dropdownAge = '29';
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
                        hintText: '120',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3),
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(alignment: Alignment.topLeft, child: Text('Price')),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: TextFormField(
                        //controller: ,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            //fillColor: Colors.white,
                            // labelText: "",
                            hintText: '25000',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3),
                                borderRadius: BorderRadius.circular(5))),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.3,
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
                        value: dropdownValue,
                        items: <String>['dh', '\$', 'ouro', 'dinar']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text("  $value"),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                    alignment: Alignment.topLeft, child: const Text('Age')),
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
                    value: dropdownAge,

                    items: <String>['29', '28', '19', '14']
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
                    alignment: Alignment.topLeft, child: Text('Flooring')),
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
                    items: <String>['dh', '\$', 'ouro', 'dinar']
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
                Wrap(
                  children: [
                    Column(
                      children: [
                        Text("Bedroms:"),
                        Container(
                          width: 140,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(child: Icon(Icons.add)),
                                onTap: () {
                                  setState(() {
                                    quntity2++;
                                  });
                                },
                              ),
                              Text(quntity1.toString()),
                              Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: GestureDetector(
                                  child: Container(
                                    child: Icon(Icons.minimize),
                                  ),
                                  onTap: () {
                                    if (quntity2 >= 0) {
                                      quntity2--;
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text("Bedroms:"),
                        Container(
                          width: 140,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(child: Icon(Icons.add)),
                                onTap: () {
                                  setState(() {
                                    quntity1++;
                                  });
                                },
                              ),
                              Text(quntity1.toString()),
                              Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: GestureDetector(
                                  child: Container(
                                    child: Icon(Icons.minimize),
                                  ),
                                  onTap: () {
                                    if (quntity2 >= 0) {
                                      quntity2--;
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text("Kitchens:"),
                        Container(
                          width: 140,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(child: Icon(Icons.add)),
                                onTap: () {
                                  setState(() {
                                    kichens++;
                                  });
                                },
                              ),
                              Text(kichens.toString()),
                              Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: GestureDetector(
                                  child: Container(
                                    child: Icon(Icons.minimize),
                                  ),
                                  onTap: () {},
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  color: Color.fromARGB(255, 213, 215, 219),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Color.fromARGB(255, 175, 178, 206),
                      child: Text('Main Abilites'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  color: Color.fromARGB(255, 213, 215, 219),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Color.fromARGB(255, 175, 178, 206),
                      child: Text('Main Abilites'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  color: Color.fromARGB(255, 213, 215, 219),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Color.fromARGB(255, 175, 178, 206),
                      child: Text('Main Abilites'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xffbfa280),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding: EdgeInsets.only(
                              top: 10, left: 25, bottom: 10, right: 25),
                          child: const Text(
                            "Suivant",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ContactInfo();
                          }));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xffbfa280),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
              ],
            ),
          ),
        ]));
  }
}
