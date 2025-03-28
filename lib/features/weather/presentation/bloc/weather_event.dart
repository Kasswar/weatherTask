part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final WeatherParam weatherParam;

  GetWeatherEvent({required this.weatherParam});
}

class SearchEvent extends WeatherEvent {}
