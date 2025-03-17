// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherModel({
    this.location,
    this.current,
    this.forecast,
  });

  WeatherModel copyWith({
    Location? location,
    Current? current,
    Forecast? forecast,
  }) =>
      WeatherModel(
        location: location ?? this.location,
        current: current ?? this.current,
        forecast: forecast ?? this.forecast,
      );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
        forecast: json["forecast"] == null
            ? null
            : Forecast.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current": current?.toJson(),
        "forecast": forecast?.toJson(),
      };
}

class Current {
  dynamic lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  dynamic isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  dynamic windDegree;
  String? windDir;
  dynamic pressureMb;
  double? pressureIn;
  dynamic precipMm;
  dynamic precipIn;
  dynamic humidity;
  dynamic cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpodynamicC;
  double? dewpodynamicF;
  dynamic visKm;
  dynamic visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;
  dynamic timeEpoch;
  String? time;
  dynamic snowCm;
  dynamic willItRain;
  dynamic chanceOfRain;
  dynamic willItSnow;
  dynamic chanceOfSnow;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpodynamicC,
    this.dewpodynamicF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
    this.timeEpoch,
    this.time,
    this.snowCm,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
  });

  Current copyWith({
    dynamic lastUpdatedEpoch,
    String? lastUpdated,
    double? tempC,
    double? tempF,
    dynamic isDay,
    Condition? condition,
    double? windMph,
    double? windKph,
    dynamic windDegree,
    String? windDir,
    dynamic pressureMb,
    double? pressureIn,
    dynamic precipMm,
    dynamic precipIn,
    dynamic humidity,
    dynamic cloud,
    double? feelslikeC,
    double? feelslikeF,
    double? windchillC,
    double? windchillF,
    double? heatindexC,
    double? heatindexF,
    double? dewpodynamicC,
    double? dewpodynamicF,
    dynamic visKm,
    dynamic visMiles,
    double? uv,
    double? gustMph,
    double? gustKph,
    dynamic timeEpoch,
    String? time,
    dynamic snowCm,
    dynamic willItRain,
    dynamic chanceOfRain,
    dynamic willItSnow,
    dynamic chanceOfSnow,
  }) =>
      Current(
        lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        tempC: tempC ?? this.tempC,
        tempF: tempF ?? this.tempF,
        isDay: isDay ?? this.isDay,
        condition: condition ?? this.condition,
        windMph: windMph ?? this.windMph,
        windKph: windKph ?? this.windKph,
        windDegree: windDegree ?? this.windDegree,
        windDir: windDir ?? this.windDir,
        pressureMb: pressureMb ?? this.pressureMb,
        pressureIn: pressureIn ?? this.pressureIn,
        precipMm: precipMm ?? this.precipMm,
        precipIn: precipIn ?? this.precipIn,
        humidity: humidity ?? this.humidity,
        cloud: cloud ?? this.cloud,
        feelslikeC: feelslikeC ?? this.feelslikeC,
        feelslikeF: feelslikeF ?? this.feelslikeF,
        windchillC: windchillC ?? this.windchillC,
        windchillF: windchillF ?? this.windchillF,
        heatindexC: heatindexC ?? this.heatindexC,
        heatindexF: heatindexF ?? this.heatindexF,
        dewpodynamicC: dewpodynamicC ?? this.dewpodynamicC,
        dewpodynamicF: dewpodynamicF ?? this.dewpodynamicF,
        visKm: visKm ?? this.visKm,
        visMiles: visMiles ?? this.visMiles,
        uv: uv ?? this.uv,
        gustMph: gustMph ?? this.gustMph,
        gustKph: gustKph ?? this.gustKph,
        timeEpoch: timeEpoch ?? this.timeEpoch,
        time: time ?? this.time,
        snowCm: snowCm ?? this.snowCm,
        willItRain: willItRain ?? this.willItRain,
        chanceOfRain: chanceOfRain ?? this.chanceOfRain,
        willItSnow: willItSnow ?? this.willItSnow,
        chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
      );

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"]?.toDouble(),
        tempF: json["temp_f"]?.toDouble(),
        isDay: json["is_day"],
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toDouble(),
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"]?.toDouble(),
        precipMm: json["precip_mm"],
        precipIn: json["precip_in"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"]?.toDouble(),
        feelslikeF: json["feelslike_f"]?.toDouble(),
        windchillC: json["windchill_c"]?.toDouble(),
        windchillF: json["windchill_f"]?.toDouble(),
        heatindexC: json["heatindex_c"]?.toDouble(),
        heatindexF: json["heatindex_f"]?.toDouble(),
        dewpodynamicC: json["dewpodynamic_c"]?.toDouble(),
        dewpodynamicF: json["dewpodynamic_f"]?.toDouble(),
        visKm: json["vis_km"],
        visMiles: json["vis_miles"],
        uv: json["uv"]?.toDouble(),
        gustMph: json["gust_mph"]?.toDouble(),
        gustKph: json["gust_kph"]?.toDouble(),
        timeEpoch: json["time_epoch"],
        time: json["time"],
        snowCm: json["snow_cm"],
        willItRain: json["will_it_rain"],
        chanceOfRain: json["chance_of_rain"],
        willItSnow: json["will_it_snow"],
        chanceOfSnow: json["chance_of_snow"],
      );

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition?.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "windchill_c": windchillC,
        "windchill_f": windchillF,
        "heatindex_c": heatindexC,
        "heatindex_f": heatindexF,
        "dewpodynamic_c": dewpodynamicC,
        "dewpodynamic_f": dewpodynamicF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
        "time_epoch": timeEpoch,
        "time": time,
        "snow_cm": snowCm,
        "will_it_rain": willItRain,
        "chance_of_rain": chanceOfRain,
        "will_it_snow": willItSnow,
        "chance_of_snow": chanceOfSnow,
      };
}

class Condition {
  Text? text;
  Icon? icon;
  dynamic code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  Condition copyWith({
    Text? text,
    Icon? icon,
    dynamic code,
  }) =>
      Condition(
        text: text ?? this.text,
        icon: icon ?? this.icon,
        code: code ?? this.code,
      );

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: textValues.map[json["text"]],
        icon: iconValues.map[json["icon"]],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "text": textValues.reverse[text],
        "icon": iconValues.reverse[icon],
        "code": code,
      };
}

enum Icon {
  CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_113_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_113_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_116_PNG
}

final iconValues = EnumValues({
  "//cdn.weatherapi.com/weather/64x64/day/113.png":
      Icon.CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_113_PNG,
  "//cdn.weatherapi.com/weather/64x64/night/113.png":
      Icon.CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_113_PNG,
  "//cdn.weatherapi.com/weather/64x64/night/116.png":
      Icon.CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_116_PNG
});

enum Text { CLEAR, PARTLY_CLOUDY, SUNNY }

final textValues = EnumValues({
  "Clear ": Text.CLEAR,
  "Partly Cloudy ": Text.PARTLY_CLOUDY,
  "Sunny": Text.SUNNY
});

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({
    this.forecastday,
  });

  Forecast copyWith({
    List<Forecastday>? forecastday,
  }) =>
      Forecast(
        forecastday: forecastday ?? this.forecastday,
      );

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: json["forecastday"] == null
            ? []
            : List<Forecastday>.from(
                json["forecastday"]!.map((x) => Forecastday.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecastday": forecastday == null
            ? []
            : List<dynamic>.from(forecastday!.map((x) => x.toJson())),
      };
}

class Forecastday {
  DateTime? date;
  dynamic dateEpoch;
  Day? day;
  Astro? astro;
  List<Current>? hour;

  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  Forecastday copyWith({
    DateTime? date,
    dynamic dateEpoch,
    Day? day,
    Astro? astro,
    List<Current>? hour,
  }) =>
      Forecastday(
        date: date ?? this.date,
        dateEpoch: dateEpoch ?? this.dateEpoch,
        day: day ?? this.day,
        astro: astro ?? this.astro,
        hour: hour ?? this.hour,
      );

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: json["day"] == null ? null : Day.fromJson(json["day"]),
        astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
        hour: json["hour"] == null
            ? []
            : List<Current>.from(json["hour"]!.map((x) => Current.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch,
        "day": day?.toJson(),
        "astro": astro?.toJson(),
        "hour": hour == null
            ? []
            : List<dynamic>.from(hour!.map((x) => x.toJson())),
      };
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  dynamic moonIllumination;
  dynamic isMoonUp;
  dynamic isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  Astro copyWith({
    String? sunrise,
    String? sunset,
    String? moonrise,
    String? moonset,
    String? moonPhase,
    dynamic moonIllumination,
    dynamic isMoonUp,
    dynamic isSunUp,
  }) =>
      Astro(
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
        moonrise: moonrise ?? this.moonrise,
        moonset: moonset ?? this.moonset,
        moonPhase: moonPhase ?? this.moonPhase,
        moonIllumination: moonIllumination ?? this.moonIllumination,
        isMoonUp: isMoonUp ?? this.isMoonUp,
        isSunUp: isSunUp ?? this.isSunUp,
      );

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"],
        moonIllumination: json["moon_illumination"],
        isMoonUp: json["is_moon_up"],
        isSunUp: json["is_sun_up"],
      );

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "moon_illumination": moonIllumination,
        "is_moon_up": isMoonUp,
        "is_sun_up": isSunUp,
      };
}

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mdynamicempC;
  double? mdynamicempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  dynamic totalprecipMm;
  dynamic totalprecipIn;
  dynamic totalsnowCm;
  dynamic avgvisKm;
  dynamic avgvisMiles;
  dynamic avghumidity;
  dynamic dailyWillItRain;
  dynamic dailyChanceOfRain;
  dynamic dailyWillItSnow;
  dynamic dailyChanceOfSnow;
  Condition? condition;
  double? uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mdynamicempC,
    this.mdynamicempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  Day copyWith({
    double? maxtempC,
    double? maxtempF,
    double? mdynamicempC,
    double? mdynamicempF,
    double? avgtempC,
    double? avgtempF,
    double? maxwindMph,
    double? maxwindKph,
    dynamic totalprecipMm,
    dynamic totalprecipIn,
    dynamic totalsnowCm,
    dynamic avgvisKm,
    dynamic avgvisMiles,
    dynamic avghumidity,
    dynamic dailyWillItRain,
    dynamic dailyChanceOfRain,
    dynamic dailyWillItSnow,
    dynamic dailyChanceOfSnow,
    Condition? condition,
    double? uv,
  }) =>
      Day(
        maxtempC: maxtempC ?? this.maxtempC,
        maxtempF: maxtempF ?? this.maxtempF,
        mdynamicempC: mdynamicempC ?? this.mdynamicempC,
        mdynamicempF: mdynamicempF ?? this.mdynamicempF,
        avgtempC: avgtempC ?? this.avgtempC,
        avgtempF: avgtempF ?? this.avgtempF,
        maxwindMph: maxwindMph ?? this.maxwindMph,
        maxwindKph: maxwindKph ?? this.maxwindKph,
        totalprecipMm: totalprecipMm ?? this.totalprecipMm,
        totalprecipIn: totalprecipIn ?? this.totalprecipIn,
        totalsnowCm: totalsnowCm ?? this.totalsnowCm,
        avgvisKm: avgvisKm ?? this.avgvisKm,
        avgvisMiles: avgvisMiles ?? this.avgvisMiles,
        avghumidity: avghumidity ?? this.avghumidity,
        dailyWillItRain: dailyWillItRain ?? this.dailyWillItRain,
        dailyChanceOfRain: dailyChanceOfRain ?? this.dailyChanceOfRain,
        dailyWillItSnow: dailyWillItSnow ?? this.dailyWillItSnow,
        dailyChanceOfSnow: dailyChanceOfSnow ?? this.dailyChanceOfSnow,
        condition: condition ?? this.condition,
        uv: uv ?? this.uv,
      );

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"]?.toDouble(),
        maxtempF: json["maxtemp_f"]?.toDouble(),
        mdynamicempC: json["mdynamicemp_c"]?.toDouble(),
        mdynamicempF: json["mdynamicemp_f"]?.toDouble(),
        avgtempC: json["avgtemp_c"]?.toDouble(),
        avgtempF: json["avgtemp_f"]?.toDouble(),
        maxwindMph: json["maxwind_mph"]?.toDouble(),
        maxwindKph: json["maxwind_kph"]?.toDouble(),
        totalprecipMm: json["totalprecip_mm"],
        totalprecipIn: json["totalprecip_in"],
        totalsnowCm: json["totalsnow_cm"],
        avgvisKm: json["avgvis_km"],
        avgvisMiles: json["avgvis_miles"],
        avghumidity: json["avghumidity"],
        dailyWillItRain: json["daily_will_it_rain"],
        dailyChanceOfRain: json["daily_chance_of_rain"],
        dailyWillItSnow: json["daily_will_it_snow"],
        dailyChanceOfSnow: json["daily_chance_of_snow"],
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        uv: json["uv"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "maxtemp_f": maxtempF,
        "mdynamicemp_c": mdynamicempC,
        "mdynamicemp_f": mdynamicempF,
        "avgtemp_c": avgtempC,
        "avgtemp_f": avgtempF,
        "maxwind_mph": maxwindMph,
        "maxwind_kph": maxwindKph,
        "totalprecip_mm": totalprecipMm,
        "totalprecip_in": totalprecipIn,
        "totalsnow_cm": totalsnowCm,
        "avgvis_km": avgvisKm,
        "avgvis_miles": avgvisMiles,
        "avghumidity": avghumidity,
        "daily_will_it_rain": dailyWillItRain,
        "daily_chance_of_rain": dailyChanceOfRain,
        "daily_will_it_snow": dailyWillItSnow,
        "daily_chance_of_snow": dailyChanceOfSnow,
        "condition": condition?.toJson(),
        "uv": uv,
      };
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  dynamic localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  Location copyWith({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tzId,
    dynamic localtimeEpoch,
    String? localtime,
  }) =>
      Location(
        name: name ?? this.name,
        region: region ?? this.region,
        country: country ?? this.country,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        tzId: tzId ?? this.tzId,
        localtimeEpoch: localtimeEpoch ?? this.localtimeEpoch,
        localtime: localtime ?? this.localtime,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
