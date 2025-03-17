import 'dart:developer';

import '../constant/type_def.dart';

class ApiVariables {
  //////////////
  ///General///
  /////////////
  static const scheme = 'https';
  static const host = "api.weatherapi.com";
  // final _host = '192.168.243.1';
  // final _port = 5000;

  static Uri _mainUri({
    required String path,
    QueryParams? queryParameters,
  }) {
    final uri = Uri(
      scheme: scheme,
      host: host,
      // port: _port,
      path: 'v1/$path',
      queryParameters: queryParameters,
    );
    log(uri.toString());
    return uri;
  }

  static Uri weather({QueryParams? params}) => _mainUri(
        path: "forecast.json",
        queryParameters: params,
      );
}
