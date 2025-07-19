import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_paprika/controllers/home_controller.dart';
import 'package:test_paprika/helpers/helpers.dart';
import 'package:test_paprika/utilites/asset_constans.dart';
import 'package:test_paprika/utilites/colors.dart';
import 'package:test_paprika/utilites/decoration.dart';
import 'package:test_paprika/utilites/fonts.dart';
import 'package:test_paprika/widget/appbar.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor.bgColor,
      body: SafeArea(child: Column(
        children: [
          AppbarSheet(title: "History Transaction", subtitle: ""),
          ListView.builder(
            shrinkWrap: true,
            itemCount: controller.history.value!.record.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: index == 0 ? 0 : 8),
                decoration: BoxDecoration(
                  color: BaseColor.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: shadows
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                     controller.history.value!.record[index].method == "visa" ? Image.asset(AssetConstans.imgVisa, width: 28, height: 28) : Image.asset(AssetConstans.imgMasterCard, width: 28, height: 28),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           controller.history.value!.record[index].status ? "Succes" : "Failed",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TStyle.bold12.copyWith(),
                          ),
                          Text(
                            controller.history.value!.record[index].date.toString().substring(0,10),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TStyle.regular12.copyWith(color: BaseColor.mediumGrey),
                          ),
                          Text(
                            Helpers.currency(controller.history.value!.record[index].total),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TStyle.bold12.copyWith(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          )
        ],
      )),
    );
  }
}