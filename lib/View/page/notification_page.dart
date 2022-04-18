import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/order/order_distination.dart';

import '../../Model/cityrepo.dart';
import '../../varia_ble/variable.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    gedRegion();
    Get.to(Add_Annonce());
    super.initState();
  }

  gedRegion () async{
    if (!verify_region_city) {
      await ServicesRgion.getUsers().then(
            (regions) {
          setState(() {
            region = regions!;
            ListCity();
          });

        },
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularProgressIndicator(),
    );
  }
}
