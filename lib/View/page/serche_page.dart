import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roya_immobilie/Model/anonce_model.dart';
import 'package:roya_immobilie/View/page/page_details/details.dart';

class Sercher extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<Sercher> {
  TextEditingController controller = new TextEditingController();

  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    final response = await http.get(Uri.parse(url));
    final responseJsoon = json.decode(response.body);
    final responseJson = responseJsoon["data"];
    setState(() {
      for (Map user in responseJson) {
        _userDetails.add(Annonce.fromJson(user.cast()));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(),
      appBar: AppBar(
        title: const Center(
            child: Icon(
          Icons.star,
          color: Colors.black,
        )),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              //menu.svg
              icon: SvgPicture.asset('assets/icon/menu.svg',
                  width: 25, height: 25, matchTextDirection: true),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),

      body: Container(
        color: Color(0xffefefef),
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      onChanged: onSearchTextChanged,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        controller.clear();
                        onSearchTextChanged('');
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _searchResult.length != 0 || controller.text.isNotEmpty
                  ? ListView.builder(
                      itemCount: _searchResult.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: (() => Get.to(Details(
                                data: _searchResult,
                                image: _searchResult[i].cover,
                              ))),
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  _searchResult[i].cover,
                                ),
                              ),
                              title: Text(_searchResult[i].title),
                            ),
                            margin: const EdgeInsets.all(0.0),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: _userDetails.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                _userDetails[index].cover,
                              ),
                            ),
                            title: Text(_userDetails[index].title),
                          ),
                          margin: const EdgeInsets.all(0.0),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.title.contains(text) || userDetail.address.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

List<Annonce> _searchResult = [];

List<Annonce> _userDetails = [];

final String url = "https://dashboard.royaimmo.ma/api/site/annonces";
