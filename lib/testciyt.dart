import 'package:flutter/material.dart';

import 'Model/cityrepo.dart';
import 'View/order/order_distination.dart';

class TextCity extends StatefulWidget {
  const TextCity({Key? key}) : super(key: key);

  @override
  State<TextCity> createState() => _TextCityState();
}

class _TextCityState extends State<TextCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: CityRepo.fetchCity(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              print(snapshot.data[2]["city_name"]);
              return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Add_Annonce(
                              long: snapshot.data.length,
                              data: snapshot.data.toString(),
                            )),
                  );
                },
                child: Text('Click mw!'),
              );
            } else {
              return Text(
                "no data",
                style: TextStyle(color: Colors.black),
              );
            }
          }),
    );
  }
}
