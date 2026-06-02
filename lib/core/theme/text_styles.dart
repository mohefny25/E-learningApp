import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_academy/core/constants/app_colors.dart';

class AppTextStyles{
  static TextStyle s30w700 (BuildContext context)=>TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.headerColor
  );
  static TextStyle s24w600 (BuildContext context)=>TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white
  );
  static TextStyle s14w600 (BuildContext context)=>TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black
  );
  static TextStyle s18w600 (BuildContext context)=>TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white
  );
  static TextStyle s20w700 (BuildContext context)=>TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.white
  );
  static TextStyle s12w600 (BuildContext context)=>TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.cardCostColor
  );
  static TextStyle s16w400 (BuildContext context)=>TextStyle(
      fontSize: 12,
      color: Colors.black,
  );



}