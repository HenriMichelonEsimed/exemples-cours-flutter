import 'package:ex3_front_api/model/results.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StatusErrorException {
  final int statusCode;
  const StatusErrorException(this.statusCode);
}

class AdresseAPI {
  static const apiServer = 'api-adresse.data.gouv.fr';
  static const apiUrl = '';
  static const searchRoute = '$apiUrl/search';

  Future<Results> search(String query) async {
    var result = await http.get(Uri.https(apiServer,searchRoute,
        { 'q' : query, 'limit' : '10' }));
    if (result.statusCode == 200) {
      final Map<String, dynamic> datas = jsonDecode(result.body);
      return Results.fromJson(datas);
    }
    throw StatusErrorException(result.statusCode);
  }

}