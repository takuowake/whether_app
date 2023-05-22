import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:whether_app/model/weather.dart';
import 'package:whether_app/repository/repository.dart';
import 'package:whether_app/service/weather_api_client.dart';

import 'repository_test.mocks.dart';

@GenerateMocks([WeatherApiClient])
void main() {
  test('Repository should fetch weather data', () async {
    var mockApiClient = MockWeatherApiClient();
    var repository = Repository(api: mockApiClient);
    var cityName = 'Tokyo';

    when(mockApiClient.fetchWeather(cityName))
        .thenAnswer((_) async => Weather());

    await repository.fetchWeather(cityName);

    verify(mockApiClient.fetchWeather(cityName)).called(1);
  });
}
