import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_paprika/controllers/home_controller.dart';
import 'package:test_paprika/helpers/helpers.dart';
import 'package:test_paprika/pages/home/widget/sheet_holder.dart';
import 'package:test_paprika/pages/home/widget/sheet_transaction.dart';
import 'package:test_paprika/routes/routes_name.dart';
import 'package:test_paprika/utilites/asset_constans.dart';
import 'package:test_paprika/utilites/colors.dart';
import 'package:test_paprika/utilites/decoration.dart';
import 'package:test_paprika/utilites/fonts.dart';

class CardMain extends StatelessWidget {
  CardMain({super.key});
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
      decoration: BoxDecoration(
          color: BaseColor.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: shadows),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: Row(
              children: [
                Image.asset(
                  AssetConstans.icEth,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ETH",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TStyle.bold14.copyWith(),
                    ),
                    Text(
                      Helpers.currency(int.parse(controller.balance.value)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TStyle.regular12.copyWith(),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Get.bottomSheet(SheetHolder());
              },
              child: Column(
                children: [
                  const Icon(
                    Icons.add_rounded,
                    color: BaseColor.purple,
                  ),
                  Text(
                    "Top Up",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TStyle.bold12.copyWith(),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(RoutesName.history);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Icon(
                    Icons.history,
                    color: BaseColor.purple,
                  ),
                  Text(
                    "History",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TStyle.bold12.copyWith(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
