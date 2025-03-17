import 'package:weather_task/core/config/usecase.dart';
import 'package:weather_task/core/constant/type_def.dart';
import 'package:weather_task/features/weather/data/models/weather_model.dart';
import 'package:weather_task/features/weather/domain/repository/weather_repository.dart';

class GetWeatherUseCase extends UseCase<WeatherModel, WeatherParam> {
  final WeatherRepository weatherRepository;

  GetWeatherUseCase(this.weatherRepository);

  @override
  DataResponse<WeatherModel> call(WeatherParam params) {
    return weatherRepository.getWeather(params.getParams());
  }
}

class WeatherParam with Params {
  final String city;
  final int days;
  final String aqi;
  final String alerts;

  WeatherParam(
      {required this.city,
      required this.days,
      required this.aqi,
      required this.alerts});
  @override
  QueryParams getParams() {
    return {
      "key": "eb0315b46a6f4e00af9152404242407",
      "q": city,
      "days": days.toString(),
      "aqi": aqi,
      "alerts": alerts
    };
  }
}
