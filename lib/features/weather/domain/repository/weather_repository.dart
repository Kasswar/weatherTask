import 'package:weather_task/features/weather/data/models/weather_model.dart';

import '../../../../core/constant/type_def.dart';

abstract class WeatherRepository {
  DataResponse<WeatherModel> getWeather(QueryParams params);
}
