part of 'weather_bloc.dart';

enum WeatherStatus { init, load, succ, fail }

class WeatherState {
  final WeatherStatus weatherStatus;
  final WeatherModel? weatherModel;
  final String errorMsg;
  final bool isSearch;

  WeatherState(
      {this.weatherStatus = WeatherStatus.init,
      this.weatherModel,
      this.errorMsg = "",
      this.isSearch = false});

  WeatherState copyWith(
      {WeatherStatus? weatherStatus,
      WeatherModel? weatherModel,
      String? errorMsg,
      bool? isSearch}) {
    return WeatherState(
        weatherStatus: weatherStatus ?? this.weatherStatus,
        weatherModel: weatherModel ?? this.weatherModel,
        errorMsg: errorMsg ?? this.errorMsg,
        isSearch: isSearch ?? this.isSearch);
  }
}
