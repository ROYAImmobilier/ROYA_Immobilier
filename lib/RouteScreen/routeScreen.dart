import 'package:get/get.dart';

import '../View/routing_screen.dart';

class RouteScreen {
  static String home = "/";

  static String getHomepage() => home;

  static List<GetPage> route = [
    GetPage(name: home, page: () =>  RoutingScreen()),
  ];
}
