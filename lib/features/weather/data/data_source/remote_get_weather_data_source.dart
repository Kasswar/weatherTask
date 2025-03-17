import 'package:weather_task/core/constant/type_def.dart';
import 'package:weather_task/core/unified_api/api_variables.dart';
import 'package:weather_task/core/unified_api/get_api.dart';
import 'package:weather_task/features/weather/data/models/weather_model.dart';

class RemoteGetWeatherDataSource {
  Future<WeatherModel> remoteGetWeather(QueryParams params) async {
    GetApi getApi = GetApi(
        uri: ApiVariables.weather(params: params),
        fromJson: weatherModelFromJson);
    var resulte = await getApi.callRequest();
    return resulte;
  }
}
