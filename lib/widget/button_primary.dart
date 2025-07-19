import 'package:flutter/material.dart';
import 'package:test_paprika/utilites/colors.dart';
import 'package:test_paprika/utilites/fonts.dart';

class ButtonPrimary extends StatelessWidget {
  ButtonPrimary(
      {Key? key,
      required this.textButton,
      required this.onTap,
      this.withArrow = true,
        this.textStyle = TStyle.bold14,
      this.paddingVertical = 14,
      this.paddingHorizontal = 16,
      this.isActive = true,
      this.iconLeft = "",
        this.textColor = BaseColor.white,
      this.color = BaseColor.blue,
      this.borderRadius = const BorderRadius.all(Radius.circular(4)),
      })
      : super(key: key);

  final Color color;
  final TextStyle textStyle;
  final Color textColor;
  final String textButton;
  final VoidCallback onTap;
  final bool withArrow;
  final double paddingVertical, paddingHorizontal;
  final bool isActive;
  final String iconLeft;
  BorderRadius borderRadius = BorderRadius.circular(4);

  @override
  Widget build(BuildContext context) {
   return Container(
      decoration: BoxDecoration(
          color: isActive ? color : BaseColor.mediumGrey.withOpacity(0.5),
          borderRadius: borderRadius),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            onTap();
          },
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                textButton,
                  style:textStyle.copyWith(color:textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}