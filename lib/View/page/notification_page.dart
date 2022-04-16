import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/order/order_distination.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    Get.to(Add_Annonce());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularProgressIndicator(),
    );
  }
}
