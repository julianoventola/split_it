import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundSplash;
  Color get background;
  Color get title;
  Color get button;
  Color get borderButton;
  Color get homeAddButton;
  Color get backgroundIconInfoCardPositive;
  Color get backgroundIconInfoCardNegative;
  Color get infoCardNegative;
  Color get infoCardPositive;
}

class AppColorDefault implements AppColors {
  @override
  Color get backgroundSplash => Color(0xff40b38c);

  @override
  Color get background => Color(0xffffffff);

  @override
  Color get title => Color(0xff40b28c);

  @override
  Color get button => Color(0xff666666);

  @override
  Color get borderButton => Color(0xffDCE0E6);

  @override
  Color get homeAddButton => Color(0xfff5f5f5);

  @override
  Color get backgroundIconInfoCardPositive => Color(0xffE8F7F2);

  @override
  Color get backgroundIconInfoCardNegative => Color(0xfffdecef);

  @override
  Color get infoCardPositive => Color(0xff40b38c);

  @override
  Color get infoCardNegative => Color(0xffE83F5B);
}
