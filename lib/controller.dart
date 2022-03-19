
import 'package:get/get.dart';
import 'package:roya_immobilie/Model/joke.dart';
import 'package:roya_immobilie/Model/repositery.dart';


class AnnonceController extends GetxController {
  var allJokes =<Joke> [].obs;

 
 
   onInit() {

   
    getJokeys();
   

    super.onInit();
  }
  getJokeys() async {
    try {
      var jokes = await jokeRepository.featcherJoke();
     
      if (jokes != null) {
          allJokes.value = jokes;
          print("gg 00 : "+allJokes[0].title.toString());
          print("gg 00 : "+allJokes.length.toString());

      }
    } catch (e) {

    } finally {

    }update();
  }
  
}
