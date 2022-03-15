import 'package:http/http.dart' as http;

import 'anonce_model.dart';

class AnnonceRepository {
  static var client = http.Client();

  static Future<Annonce?> featcherAnnonce() async {
    var res = await client
        .get(Uri.parse('https://dashboard.royaimmo.ma/api/site/annonces'));
    var json = res.body;

    if (res.statusCode == 200) {
      return annonceFromJson(json);
    } else {
      return null;
    }
  }
}
