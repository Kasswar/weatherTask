import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_task/core/config/app_colors.dart';
import 'package:weather_task/core/text/text14.dart';

class CustomItem extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String url1;
  final bool isNull;
  const CustomItem(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.url1,
      required this.isNull});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
          border: Border.all(color: AppColors.green)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text14(
            text: text1,
            isBold: true,
            color: AppColors.red,
          ),
          Text14(
            text: text2,
            isBold: true,
            color: AppColors.red,
          ),
          isNull
              ? CachedNetworkImage(
                  imageUrl: "https://api.weatherapi.com$url1",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : Icon(
                  Icons.error,
                  size: 50,
                  color: AppColors.red,
                ),
          Text14(
            text: text3,
            isBold: true,
            color: AppColors.red,
          ),
        ],
      ),
    );
  }
}
