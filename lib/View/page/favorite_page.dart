import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Controller/AnonceController.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<AnnonceController>(
            init: AnnonceController(),
            builder: (controller) => Text(controller.favoriteBook.toString()))

        /*Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icon/favorite2.svg',
            ),
          ),
          Text(
            'favorite is Empty',
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),*/
        );
  }
}
