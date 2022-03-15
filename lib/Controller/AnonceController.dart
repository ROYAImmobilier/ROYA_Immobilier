import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Model/anonce_model.dart';
import 'package:roya_immobilie/Model/repositery.dart';

class AnnonceController extends GetxController {
  AnnonceController() {
    getAnnonce();
  }

  List<Annonce> ListAnnonce = [];

  getAnnonce() async {
    try {
      print("aaaaaaaa");
      var annonce = await AnnonceRepository.featcherAnnonce();
      if (annonce != null) {
        ListAnnonce = annonce as List<Annonce>;
        print("aaaaaaaa" + ListAnnonce.toString());
      }
    } catch (e) {
    } finally {}
  }
}



  
/*
class JokeController extends GetxController {
  var allJoke = <Joke>[].obs;
  var allJokes = [].obs;
 var remaining = [].obs;
  var isLoding = true.obs;
  var isError = false.obs;
  // var repo = jokeRepository();
  @override
  void onInit() {
    try {
      Hive.registerAdapter(JokeAdapter());
    } catch (e) {
      print('eeerroorree :  '+ e.toString());
    }
    getJokeys();
    ever(isError, (value) {
      if (value == isError(true)) {
        Get.snackbar("problem", "issues in your internet conection",
            backgroundColor: Colors.black, colorText: Colors.white);
      }
    });
    super.onInit();
  }
  addTodo(Joke todo) async {
    
    allJokes.add(todo);
    var box = await Hive.openBox('db');
    box.put('todos', allJokes.toList());
    
  }
Future getTodos() async {
    Box box;
    print("Getting todos");
    try {
      box = await Hive.box('db');
    } catch (error) {
      
        print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
      print(error);
    }
box = await Hive.openBox('db');
    var tds = box.get('todos');
    print("TODOS $tds");
    if (tds != null) allJokes.value = tds;
    for (Joke todo in allJokes) {
      
        remaining.add(todo);
      
      
    }
  }
  getJokeys() async {
    try {
      isLoding(false);
      var jokes = await jokeRepository.featcherJoke();
      if (jokes != null) {
        allJoke.value = jokes;
      for(int i=0;i<allJoke.length;i++){
        addTodo(allJoke[i]); 
      }
      getTodos();
       
      }
    } catch (e) {
      isError(true);
    } finally {
      isLoding(false);
    }
  }
  postdata()async{
    try {
      var response = await http.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          body: {
              "userId": '10',
              "title": "aaaaaaaaaaaaaaaaa",
              "body": "bbbbbbbbbbbbbbbbbbbbbbbb",
          }
      );
          print(response.body);
    }catch(e){
      print('error'+ e.toString());
    }
  }
}
*/