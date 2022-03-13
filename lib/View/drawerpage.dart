import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffB6B2C8), // HexColor.fromHex("B6B2C8"),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 110,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Color(0xff5E5486),
                    )),
                Positioned(
                    bottom: 10,
                    //left: 015,
                    child: Container(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Bienvenue ,",
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'pour une experience optimisee , ',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'veuillez vous connecter',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
            child: MaterialButton(
              color: Color(0xffB68451),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                    Text(
                      'DEPOSER UNE ANNONCE',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  size: 20,
                ),
                SizedBox(
                  width: 24,
                ),
                Text('Se connecter', style: TextStyle(fontSize: 20))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
            child: Row(
              children: [
                Icon(
                  Icons.chat,
                  size: 20,
                ),
                SizedBox(
                  width: 24,
                ),
                Text('Chat', style: TextStyle(fontSize: 20))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
            child: Row(
              children: [
                Icon(
                  Icons.favorite,
                  size: 20,
                ),
                SizedBox(
                  width: 24,
                ),
                Text('Mes favoris', style: TextStyle(fontSize: 20))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
            child: Row(
              children: [
                Icon(Icons.language),
                SizedBox(
                  width: 24,
                ),
                Text('Langues', style: TextStyle(fontSize: 20))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
            child: Row(
              children: [
                Icon(
                  Icons.call,
                  size: 20,
                ),
                SizedBox(
                  width: 24,
                ),
                Text('Contactez nous', style: TextStyle(fontSize: 20))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  size: 20,
                ),
                SizedBox(
                  width: 24,
                ),
                Text('Informations', style: TextStyle(fontSize: 20))
              ],
            ),
          )
        ],
      ),
    );
  }
}
