import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:roya_immobilie/home.dart';
import 'package:roya_immobilie/notification_page.dart';

import 'chat_page.dart';

class RoutingScreen extends StatefulWidget {
  static final id = "RoutingScreen";

  @override
  _RoutingScreenState createState() => _RoutingScreenState();

  const RoutingScreen();
}

class _RoutingScreenState extends State<RoutingScreen> {
  int bottomSelectedIndex = 0;
  var pageController;

  void OnPageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void OnbottomTapped(int index) {
    if ((bottomSelectedIndex - index.abs() == 1)) {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      pageController.jumpToPage(index);
    }
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final pageView = PageView(
        controller: pageController,
        children: [Home_page(), ChatPage(), NotificationPage()],
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: OnPageChanged);

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
        isExtended: true,
        backgroundColor: Color.fromARGB(255, 130, 108, 219),
        // mini: true,
        child: Icon(Icons.camera_enhance_outlined),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home_filled, color: Colors.grey[600], size: 20),
              label: 'Annonces'),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.favorite_border_outlined,
                color: Colors.grey[600], size: 20),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.camera, color: Colors.white, size: 20),
            label: 'Annoncer',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon:
                Icon(Icons.message_rounded, color: Colors.grey[600], size: 20),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.notifications, color: Colors.grey[600], size: 20),
            label: 'Notification',
          ),
        ],
        onTap: OnbottomTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: bottomSelectedIndex,
      ),
      body: pageView,
    );
  }
}
