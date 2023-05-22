import 'package:whether_app/service/weather_api_client.dart';

class Repository {
  final WeatherApiClient api;

  Repository({required this.api});

  dynamic fetchWeather(String? location) async {
    return api.fetchWeather(location);
  }
}
