
import 'package:flutter/material.dart';
import 'package:test_paprika/utilites/colors.dart';
import 'package:test_paprika/utilites/fonts.dart';

InputDecoration kDecorationForm = InputDecoration(
  contentPadding: const EdgeInsets.only(left: 16, right: 16),
  filled: true,
  fillColor: BaseColor.lightGrey,
  hintStyle: TStyle.regular14.copyWith(color: BaseColor.mediumGrey),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
  ),

  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide:  BorderSide(
      color: BaseColor.red,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide:  BorderSide(
      color: BaseColor.red,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
  ),
  // errorStyle: TStyle.body.copyWith(color: kColorRed100),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
  ),
);

BoxDecoration kBoxShadow = BoxDecoration(
    color: BaseColor.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: shadows);

List<BoxShadow> shadows = [
  BoxShadow(
    color: BaseColor.black.withOpacity(0.02),
    offset: const Offset(0, 1),
    blurRadius: 3,
  ),
];

List<BoxShadow> shadowExtra = [BoxShadow(
    color: BaseColor.black.withOpacity(0.20),
    offset: const Offset(3, 8),
    blurRadius: 6,
  ),];

List<BoxShadow> shadowAdd = [BoxShadow(
    color: BaseColor.black.withOpacity(0.20),
    offset: const Offset(3, 3),
    blurRadius: 3,
  ),];

List<BoxShadow> shadowWalletMenu = [BoxShadow(
    color: BaseColor.black.withOpacity(0.08),
    offset: const Offset(2, 10),
    blurRadius: 6,
  ),];

Gradient gradientChat = const LinearGradient(
  colors: [BaseColor.purple, BaseColor.blue],
  begin: FractionalOffset(0.1, 0.08),
  end: FractionalOffset(1, 0.0),
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp,
);

const Gradient gradientButton = RadialGradient(
  center: Alignment(-0.014, 1),
  radius: 1,
  colors: <Color>[Color(0xFFC598FF), Color(0xFF0888FF)],
  stops: <double>[0, 1],
);
