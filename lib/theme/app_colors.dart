import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundSplash;
  Color get background;
  Color get title;
  Color get button;
  Color get borderButton;
  Color get homeAddButton;
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
}
