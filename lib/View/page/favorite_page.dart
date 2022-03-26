import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Controller/AnonceController.dart';
import 'package:roya_immobilie/View/page/page_details/details.dart';
import 'package:roya_immobilie/View/page/serche_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AnnonceController());
    return Scaffold(
        backgroundColor: Color(0xffefefef),
        appBar: AppBar(
          title: const Center(
              child: Icon(
            Icons.star,
            color: Colors.black,
          )),
          actions: [
            GestureDetector(
              onTap: (() => Get.to(Sercher())),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icon/search.svg',
                  width: 20,
                  height: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                //menu.svg
                icon: SvgPicture.asset('assets/icon/menu.svg',
                    width: 25, height: 25, matchTextDirection: true),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: GetBuilder<AnnonceController>(
          // init: AnnonceController(),
          builder: (controller) => controller.cartProductsModel.length != 0
              ? ListView.builder(
                  itemCount: controller.cartProductsModel.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(Details(
                            image: controller.cartProductsModel[i].cover,
                            data: controller.cartProductsModel[i]));
                      },
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: Image.network(

                              "https://dashboard.royaimmo.ma/images/annonces/${controller.cartProductsModel[i].cover}",

                            width: 60,
                            height: 80,
                          ),
                          title: Text(controller.cartProductsModel[i].title),
                          subtitle: Text(
                              controller.cartProductsModel[i].region +
                                  '-' +
                                  controller.cartProductsModel[i].city),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              controller
                                  .removebook(controller.cartProductsModel[i]);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Column(
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
                ),
        ));
  }
}
