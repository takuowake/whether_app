import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whether_app/view_model/provider.dart';

void main() {
  test('CityNameProvider should hold the city name', () {
    var container = ProviderContainer();
    var cityNameProviderRef = container.read(cityNameProvider.notifier);
    cityNameProviderRef.state = 'New York';

    expect(cityNameProviderRef.state, 'New York');
  });
}
