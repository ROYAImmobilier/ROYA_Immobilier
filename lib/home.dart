import 'package:flutter/material.dart';
import 'package:roya_immobilie/stackwidget_2.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
            child: Icon(
          Icons.star,
          color: Colors.black,
        )),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
        leading: const Icon(
          Icons.menu_outlined,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const StackWidget_2(),
    );
  }
}
