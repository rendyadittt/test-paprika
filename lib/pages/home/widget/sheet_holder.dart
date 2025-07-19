import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_paprika/pages/home/widget/list_holder.dart';
import 'package:test_paprika/utilites/colors.dart';
import 'package:test_paprika/widget/appbar.dart';
import 'package:test_paprika/widget/button_primary.dart';

class SheetHolder extends StatelessWidget {
  SheetHolder(
      {super.key,
      this.title = "Select Holder",
      this.desc = "Please select holder to continue"
      
      });
  String title, desc;

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
          ListHoler()
        ],
      ),
    );
  }
}
