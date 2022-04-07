// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// class Profile extends StatelessWidget {
//   const Profile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text('Shopping list', style: Get.theme.textTheme.bodyText1),
//             ],
//           )),
//       body: SingleChildScrollView(
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(top: 16.0, left: 32, right: 32),
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: <Widget>[
//                     Center(
//                         child: Helper.displayCircleImage(
//                             'https://qrcode.tec-it.com/API/QRCode?data=G%c3%a9n%c3%a9rateur+de+codes+QR+de+TEC-IT',
//                             130,
//                             false)),
//                     Positioned(
//                       left: 80,
//                       right: 0,
//                       child: FloatingActionButton(
//                           backgroundColor: Get.theme.accentColor,
//                           child: Icon(
//                             Icons.camera_alt,
//                             color: Colors.white,
//                           ),
//                           mini: true,
//                           onPressed: () {}),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 16.0, right: 32, left: 32),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Text(
//                     ' user name',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 16.0),
//                 child: Column(
//                   children: [
//                     ListTile(
//                       dense: true,
//                       onTap: () {},
//                       title: Text(
//                         'My Listings',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       leading: Image.asset(
//                         'assets/images/listings_logo.png',
//                         height: 24,
//                         width: 24,
//                         color: Get.theme.accentColor,
//                       ),
//                     ),
//                     ListTile(
//                       dense: true,
//                       onTap: () {},
//                       title: Text(
//                         'My Favorites',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       leading: Icon(
//                         Icons.favorite,
//                         color: Colors.red,
//                       ),
//                     ),
//                     ListTile(
//                       dense: true,
//                       onTap: () {},
//                       title: Text(
//                         'Account Details',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       leading: Icon(
//                         Icons.person,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     ListTile(
//                       dense: true,
//                       onTap: () {},
//                       title: Text(
//                         'Settings',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       leading: Icon(
//                         Icons.settings,
//                         color: Colors.black45,
//                       ),
//                     ),
//                     ListTile(
//                       dense: true,
//                       onTap: () {},
//                       title: Text(
//                         'Contact Us',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       leading: Icon(
//                         Icons.call,
//                         color: Colors.green,
//                       ),
//                     ),
//                     ListTile(
//                       dense: true,
//                       onTap: () async {},
//                       title: Text(
//                         'Delete Account',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       leading: Icon(
//                         CupertinoIcons.delete,
//                         color: Colors.red,
//                       ),
//                     ),
//                     ListTile(
//                       dense: true,
//                       onTap: () {},
//                       title: Text(
//                         'Admin Dashboard',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       leading: Icon(
//                         Icons.dashboard,
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding:
//                 const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(minWidth: double.infinity),
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.transparent,
//                       padding: EdgeInsets.only(top: 12, bottom: 12),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                           side: BorderSide(color: Colors.grey.shade200)),
//                     ),
//                     child: Text(
//                       'Logout',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     onPressed: () async {},
//                   ),
//                 ),
//               ),
//             ]),
//       ),
//     );
//
//   }
// }
