import 'package:flutter/material.dart';

import '../../../../cashd_image/image.dart';

class test extends StatelessWidget {
  late String image;
  late var data;
  test({required this.image, required this.data});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {

      },
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(14),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            side: BorderSide(color: Colors.white)),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: cachedImage(
                  "https://dashboard.royaimmo.ma/images/annonces/"+image,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: NetworkImage(controller
              //         .AllBooks[i].img),
              //     fit: BoxFit.fill,
              //   ),
              //   borderRadius: BorderRadius.only(
              //       topLeft:
              //           Radius.circular(10),
              //       topRight:
              //           Radius.circular(10)),
              //   color: Colors.white,
              // ),
            ),),
            SingleChildScrollView(
              child: Column(children: <Widget>[
                // ,

                Text(
                  'aaaa',
                  style: TextStyle(
                      color: Colors.green),
                  maxLines: 1,
                ),
                Text(
                  (''),
                  style: TextStyle(
                      color: Colors.white),
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [

                    Row(
                      children: [
                        IconButton(

                          onPressed: () {},
                          icon:  Icon(
                            Icons.favorite,
                            color: Colors.red,


                        ),),
                        Text(
                          '',
                          style: TextStyle(
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );


  }
}
