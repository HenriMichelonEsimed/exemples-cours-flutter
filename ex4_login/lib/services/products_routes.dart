
import 'package:ex4_login/models/car.dart';
import 'package:ex4_login/services/dummyapi.dart';
import 'package:http/http.dart' as http;

class CarRoutes extends DummyAPI {
  static const productsRoutes = '${DummyAPI.apiUrl}/products';

  Future insert(Car car) async {
    var result = await http.post(Uri.https(DummyAPI.apiServer, productsRoutes), body: car.toMap());
    if (result.statusCode != 200) throw StatusErrorException(result.statusCode);
  }
}