import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whether_app/service/weather_api_client.dart';

import '../model/weather.dart';
import '../repository/repository.dart';

// 都市名の状態を管理するためのProviderを作成
final cityNameProvider = StateProvider((ref) => 'Tokyo');

// Repository(APIの取得)を管理するためのProviderを作成
final repositoryProvider = Provider((ref) => Repository(api: WeatherApiClient()));

// APIの取得を非同期で管理するためのProviderを作成
final dataProvider = FutureProvider.autoDispose<Weather>((ref) async {
 // Repositoryのインスタンスを取得
 final repository = ref.read(repositoryProvider);

 // 都市名の状態を監視
 final cityName = ref.watch(cityNameProvider.notifier);

 // 都市名を組み込み、APIを取得する
 return await repository.fetchWeather(cityName.state);
});