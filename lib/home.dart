import 'package:flutter/material.dart';
import 'package:roya_immobilie/drawerpage.dart';
import 'package:roya_immobilie/stackwidget.dart';
import 'package:roya_immobilie/stackwidget_2.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerPage(),
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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        /*const Icon(
          Icons.menu_outlined,
          color: Colors.black,
        ),*/
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const StackWidget(),
    );
  }
}
