import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double size04 = 4.0;
const double size08 = 8.0;
const double size16 = 16.0;
const double size36 = 36.0;
const double size48 = 48.0;
const double size56 = 56.0;

Widget horizontalSpace04 = SizedBox(width: size04.w);
Widget horizontalSpace08 = SizedBox(width: size08.w);
Widget horizontalSpace16 = SizedBox(width: size16.w);
Widget horizontalSpace36 = SizedBox(width: size36.w);
Widget horizontalSpace48 = SizedBox(width: size48.w);
Widget horizontalSpace56 = SizedBox(width: size56.w);

Widget verticalSpace04 = SizedBox(height: size04.h);
Widget verticalSpace08 = SizedBox(height: size08.h);
Widget verticalSpace16 = SizedBox(height: size16.h);
Widget verticalSpace36 = SizedBox(height: size36.h);
Widget verticalSpace48 = SizedBox(height: size48.h);
Widget verticalSpace56 = SizedBox(height: size56.h);

Widget spacedDivider = Column(
  children: <Widget>[
    verticalSpace16,
    Divider(color: Colors.blueGrey, height: 5.0.h),
    verticalSpace16,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height.h);
Widget horizontalSpace(double width) => SizedBox(width: width.w);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenHeight(context) - offsetBy) / dividedBy, max);

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenWidth(context) - offsetBy) / dividedBy, max);

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double quarterScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 4);

double getResponsiveHorizontalSpaceMedium(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 10);
double getResponsiveSmallFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 14, max: 15);

double getResponsiveMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 16, max: 17);

double getResponsiveLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 21, max: 31);

double getResponsiveExtraLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 25);

double getResponsiveMassiveFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 30);

double getResponsiveFontSize(BuildContext context,
    {double? fontSize, double? max}) {
  max ??= 100;

  var responsiveSize = min(
      screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
      max);

  return responsiveSize;
}
