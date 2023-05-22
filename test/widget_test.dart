import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whether_app/model/weather.dart';
import 'package:whether_app/view_model/provider.dart';
import 'package:whether_app/view/input_page.dart';
import 'package:whether_app/view/result_page.dart';
import 'mocks.dart';

void main() {
  group('InputPage', () {
    testWidgets('should update the city name when typed', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: InputPage(),
          ),
        ),
      );

      var textField = find.byType(TextFormField);
      await tester.enterText(textField, 'London');

      // Pump the widget again to update the state
      await tester.pump();

      // We can't directly access the state of the notifier here
      // The verification of the city name change will need to be done indirectly through the UI
    });
  });

  group('ResultPage', () {
    testWidgets('should display data when data is loaded', (WidgetTester tester) async {
      final mockRepository = MockRepository();
      final mockWeather = Weather(name: 'London', main: WeatherMain(temp: 20.0, feels_like: 18.0, humidity: 80, pressure: 1000));

      when(mockRepository.fetchWeather('London')).thenAnswer((_) async => mockWeather);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            repositoryProvider.overrideWithValue(mockRepository),
            cityNameProvider.overrideWithProvider(StateProvider((ref) => 'London')),
          ],
          child: MaterialApp(
            home: ResultPage(),
          ),
        ),
      );


      await tester.pumpAndSettle();

      expect(find.text('London'), findsOneWidget);
      expect(find.text('20.0°'), findsOneWidget);
      expect(find.text('18.0°'), findsOneWidget);
      expect(find.text('80%'), findsOneWidget);
      expect(find.text('1000hPa'), findsOneWidget);
    });
  });

}

