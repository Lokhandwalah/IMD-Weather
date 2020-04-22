import 'package:http/http.dart';
import 'dart:convert';

class Forecast {
  List days;
  Future<void> getForecast(location) async {
    String url = 'https://imd-weather.herokuapp.com/api/v1/' + location;
    Response response = await get(url);
    Map result = jsonDecode(response.body);
    days = result['data'][1]['forecast'];
  }
}
