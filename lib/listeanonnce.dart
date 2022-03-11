import 'dart:ui';

import 'package:flutter/material.dart';

class Liste_Annonce extends StatelessWidget {
  const Liste_Annonce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/bac.jpg'),
              fit: BoxFit.fill,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          width: 150,
          height: 100,
        ),
        Container(
          width: 150,
          height: 75,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 5, left: 10),
                      child: const Text(
                        "250000 dh",
                        style:
                            TextStyle(fontSize: 17, color: Color(0xffb58350)),
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 5, right: 10),
                      child: const Icon(Icons.favorite_border))
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  "Ville casablanca et grand",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 11),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.location_on_rounded,
                      size: 12,
                    ),
                    Text(" data "),
                    Icon(
                      Icons.home,
                      size: 11,
                    ),
                    Text(" data "),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
