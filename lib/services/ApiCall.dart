import 'package:http/http.dart';
import 'dart:convert';

class Forecast {
  List data;
  List regions;
  List forecasts;
  Future<void> getForecast(location) async {
    print('Fetching');
    String url = 'https://imd-weather.herokuapp.com/api/v1/' + location;
    Response response = await get(url);
    Map result = jsonDecode(response.body);
    data = result['data'];
    regions = List(data.length);
    forecasts = List(data.length);
    for (var i = 0; i < data.length; i++) {
      regions[i] = data[i]['location'].substring(7);
      forecasts[i] = data[i]['forecast'];
    }
  }
}
