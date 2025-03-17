import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_task/core/config/app_colors.dart';
import 'package:weather_task/core/text/text14.dart';
import 'package:weather_task/core/text/text16.dart';
import 'package:weather_task/features/weather/domain/usecases/get_weather_usecase.dart';
import 'package:weather_task/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_task/features/weather/presentation/screen/custom_item.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late TextEditingController searchController;
  late WeatherBloc weatherBloc;

  @override
  void initState() {
    super.initState();
    weatherBloc = WeatherBloc()
      ..add(GetWeatherEvent(
          weatherParam:
              WeatherParam(city: "Cairo", days: 1, aqi: "no", alerts: "no")));
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => weatherBloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text16(
            text: "Weather app",
            isBold: true,
            color: AppColors.green,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  weatherBloc.add(SearchEvent());
                },
                icon: Icon(
                  Icons.search,
                  color: AppColors.green,
                ))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            weatherBloc.add(GetWeatherEvent(
                weatherParam: WeatherParam(
                    city: "Cairo", days: 1, aqi: "no", alerts: "no")));
          },
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              // if () {
              //   return;
              // } else if () {
              //   return ;
              // }
              return SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    state.isSearch
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: TextFormField(
                              controller: searchController,
                              onChanged: (val) {
                                weatherBloc.add(GetWeatherEvent(
                                    weatherParam: WeatherParam(
                                        city: val,
                                        days: 1,
                                        aqi: "no",
                                        alerts: "no")));
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Icon(
                                  Icons.location_city,
                                  color: AppColors.green,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    state.weatherStatus == WeatherStatus.init ||
                            state.weatherStatus == WeatherStatus.load
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : state.weatherStatus == WeatherStatus.fail
                            ? Center(
                                child: Text16(
                                  text:
                                      "There is no weather data, try to search by city name",
                                  color: AppColors.red,
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text14(
                                    text: state.weatherModel!.location!.name!,
                                    isBold: true,
                                    color: AppColors.green,
                                  ),
                                  Text14(
                                    text: state.weatherModel!.current!
                                                .condition!.text ==
                                            null
                                        ? "Sunny"
                                        : state.weatherModel!.current!
                                            .condition!.text!.name,
                                    isBold: true,
                                    color: AppColors.green,
                                  ),
                                  Text14(
                                    text: state.weatherModel!.current!.tempC!
                                            .toString() ??
                                        "0.0",
                                    isBold: true,
                                    color: AppColors.green,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      state.weatherModel!.current!.condition!
                                                  .icon !=
                                              null
                                          ? CachedNetworkImage(
                                              imageUrl:
                                                  "https://api.weatherapi.com${state.weatherModel!.current!.condition!.icon!.name}",
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            )
                                          : Icon(
                                              Icons.error,
                                              size: 50,
                                              color: AppColors.red,
                                            ),
                                      Column(
                                        children: [
                                          Text14(
                                            text:
                                                "Avg Temp: ${state.weatherModel!.forecast!.forecastday![0].day!.avgtempC ?? "0.0"}",
                                            isBold: true,
                                            color: AppColors.red,
                                          ),
                                          Text14(
                                            text:
                                                "Max Temp: ${state.weatherModel!.forecast!.forecastday![0].day!.maxtempC ?? "0.0"}",
                                            isBold: true,
                                            color: AppColors.red,
                                          ),
                                          Text14(
                                            text:
                                                "Min Temp: ${state.weatherModel!.forecast!.forecastday![0].day!.mdynamicempC ?? "0.0"}",
                                            isBold: true,
                                            color: AppColors.red,
                                          ),
                                          Text14(
                                            text:
                                                "Humidty: ${state.weatherModel!.forecast!.forecastday![0].hour![0].humidity ?? "0.0"}",
                                            isBold: true,
                                            color: AppColors.red,
                                          ),
                                          Text14(
                                            text:
                                                "Pressure: ${state.weatherModel!.forecast!.forecastday![0].hour![0].pressureIn ?? "0.0"}",
                                            isBold: true,
                                            color: AppColors.red,
                                          ),
                                          Text14(
                                            text:
                                                "Wind: ${state.weatherModel!.forecast!.forecastday![0].hour![0].windKph ?? "0.0"}",
                                            isBold: true,
                                            color: AppColors.red,
                                          ),
                                          Text14(
                                            text:
                                                "Visible: ${state.weatherModel!.forecast!.forecastday![0].hour![0].visKm ?? "0.0"}",
                                            isBold: true,
                                            color: AppColors.red,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: ListView.builder(
                                        itemCount: state.weatherModel!.forecast!
                                            .forecastday![0].hour!.length,
                                        shrinkWrap: true,
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: CustomItem(
                                              text1: state
                                                  .weatherModel!
                                                  .forecast!
                                                  .forecastday![0]
                                                  .hour![index]
                                                  .time!
                                                  .substring(state
                                                          .weatherModel!
                                                          .forecast!
                                                          .forecastday![0]
                                                          .hour![index]
                                                          .time!
                                                          .length -
                                                      5),
                                              text2: state
                                                  .weatherModel!
                                                  .forecast!
                                                  .forecastday![0]
                                                  .hour![index]
                                                  .tempC
                                                  .toString(),
                                              isNull: state
                                                          .weatherModel!
                                                          .forecast!
                                                          .forecastday![0]
                                                          .hour![index]
                                                          .condition!
                                                          .icon !=
                                                      null
                                                  ? true
                                                  : false,
                                              url1:
                                                  "https://api.weatherapi.com${state.weatherModel!.forecast!.forecastday![0].hour![index].condition!.icon!.name}",
                                              text3: state
                                                  .weatherModel!
                                                  .forecast!
                                                  .forecastday![0]
                                                  .hour![index]
                                                  .condition!
                                                  .text!
                                                  .name
                                                  .toString(),
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
