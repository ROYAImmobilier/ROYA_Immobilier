import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'listeanonnce.dart';


final colors = Color(0xefefef);

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //const SizedBox(width: 50),
        Container(
          // margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Color(0xffefefef),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(left: 13, bottom: 30),
            child: Row(
              children: const [
                Icon(Icons.clean_hands_outlined),
                Text(
                  " Immobulier Neuf",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
          width: double.infinity,
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xffb58350),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            width: MediaQuery.of(context).size.width.toDouble(),
            height: 170,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Row(
                children: [
                  Expanded(
                      child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    color: const Color(0xffb58350),
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: ExactAssetImage('assets/images/bac.jpg'),
                          fit: BoxFit.fill,
                        ),
                        border: Border.all(
                          color: const Color(0xff857c88),
                          width: 3,
                        ),
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: 150,
                      height: 100,
                    ),
                  )),
                  Expanded(
                      child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    color: const Color(0xffb58350),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff857c88),
                          width: 3,
                        ),
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: 150,
                      height: 100,
                    ),
                  )),
                  Expanded(
                      child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    color: const Color(0xffb58350),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff857c88),
                          width: 3,
                        ),
                        // color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: 150,
                      height: 100,
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 190.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xffefefef),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            width: double.infinity,
            height: double.infinity,
            child: GridView.builder(
                itemCount: 5,
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 202,
                    mainAxisExtent: MediaQuery.of(context).size.width * 0.46,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2),
                itemBuilder: (BuildContext ctx, index) {
                  return const Liste_Annonce();
                }),
          ),
        ),
      ],
    );
  }
}
