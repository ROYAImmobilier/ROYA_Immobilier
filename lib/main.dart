import 'package:flutter/material.dart';
import 'package:roya_immobilie/View/routing_screen.dart';

import 'View/order/order_distination.dart';
import 'View/routing_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Add_Annonce(),
    );
  }
}
