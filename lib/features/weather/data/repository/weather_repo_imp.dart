import 'package:weather_task/core/constant/type_def.dart';
import 'package:weather_task/core/unified_api/handling_exception_manager.dart';
import 'package:weather_task/features/weather/data/data_source/remote_get_weather_data_source.dart';
import 'package:weather_task/features/weather/data/models/weather_model.dart';
import 'package:weather_task/features/weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImp
    with HandlingExceptionManager
    implements WeatherRepository {
  final remoteGetWeatherDataSource = RemoteGetWeatherDataSource();
  @override
  DataResponse<WeatherModel> getWeather(QueryParams params) async {
    return wrapHandling(
      tryCall: () async {
        var result = await remoteGetWeatherDataSource.remoteGetWeather(params);
        return result;
      },
    );
  }
}
