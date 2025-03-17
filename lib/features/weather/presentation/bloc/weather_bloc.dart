import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_task/features/weather/data/models/weather_model.dart';
import 'package:weather_task/features/weather/data/repository/weather_repo_imp.dart';
import 'package:weather_task/features/weather/domain/usecases/get_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final getWeatherUseCase = GetWeatherUseCase(WeatherRepositoryImp());
  WeatherBloc() : super(WeatherState()) {
    on<SearchEvent>(
      (event, emit) {
        if (state.isSearch) {
          emit(state.copyWith(isSearch: false));
        } else {
          emit(state.copyWith(isSearch: true));
        }
      },
    );
    on<GetWeatherEvent>((event, emit) async {
      emit(state.copyWith(weatherStatus: WeatherStatus.load));
      var result = await getWeatherUseCase(WeatherParam(
          city: event.weatherParam.city,
          days: event.weatherParam.days,
          aqi: event.weatherParam.aqi,
          alerts: event.weatherParam.alerts));

      result.fold((fail) {
        emit(state.copyWith(
            weatherStatus: WeatherStatus.fail, errorMsg: fail.message));
      }, (response) {
        emit(state.copyWith(
            weatherStatus: WeatherStatus.succ, weatherModel: response));
      });
    });
  }
}
