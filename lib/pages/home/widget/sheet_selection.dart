import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_paprika/utilites/colors.dart';
import 'package:test_paprika/widget/appbar.dart';
import 'package:test_paprika/widget/button_primary.dart';

class SheetSelection extends StatelessWidget {
  SheetSelection(
      {super.key,
      required this.yes,
      required this.onYes,
      this.title = "Select Action",
      this.desc = "Are you sure?"
      
      });
  String yes;
  String title, desc;
  VoidCallback? onYes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: BaseColor.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppbarSheet(
              title: title,
              subtitle:
                  desc),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ButtonPrimary(textButton: yes, onTap: onYes!),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
