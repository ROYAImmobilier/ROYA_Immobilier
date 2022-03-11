import 'dart:ui';

import 'package:flutter/material.dart';

class Liste_Annonce_2 extends StatelessWidget {
  const Liste_Annonce_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size.width;
    // print(sizeScreen);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/bac.jpg'),
              fit: BoxFit.fill,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          ),
          margin: const EdgeInsets.only(top: 20, left: 15),
          width: MediaQuery.of(context).size.width * 0.4,
          height: 120,
        ),
        Container(
            margin: const EdgeInsets.only(top: 20, left: 0),
            width: MediaQuery.of(context).size.width * 0.5,
            height: 120,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(right: 85, top: 15),
                      child: const Text(
                        "250000 dh",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(
                            0xffb58350,
                          ),
                        ),
                      )),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 4, right: 55),
                    child: const Text(
                      "Ville casablanca et grand",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 0, left: 12),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          size: 12,
                        ),
                        const Text(" data "),
                        const Icon(
                          Icons.home,
                          size: 11,
                        ),
                        const Text(" data "),
                        Container(
                          child: const Icon(
                            Icons.favorite_border,
                            size: 14,
                          ),
                          margin: sizeScreen > 350
                              ? const EdgeInsets.only(left: 65)
                              : const EdgeInsets.only(left: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
