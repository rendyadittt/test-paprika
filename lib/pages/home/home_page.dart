import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:test_paprika/controllers/home_controller.dart';
import 'package:test_paprika/helpers/helpers.dart';
import 'package:test_paprika/pages/home/widget/card_main.dart';
import 'package:test_paprika/pages/home/widget/list_advertising.dart';
import 'package:test_paprika/pages/home/widget/list_holder.dart';
import 'package:test_paprika/utilites/asset_constans.dart';
import 'package:test_paprika/utilites/colors.dart';
import 'package:test_paprika/utilites/fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BaseColor.bgColor,
        body: SafeArea(
            child: Stack(children: [
          Positioned(
              right: 0,
              child: Image.asset(
                AssetConstans.imgBlur,
                width: MediaQuery.of(context).size.width * 1,
              )),
          RefreshIndicator(
            onRefresh: () async {
              controller.loadMe();
              controller.loadCreditCard();
              controller.loadHistory();
              controller.loadAdvertising();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Obx(
                    () => controller.loadingMe.value == DataLoad.loading
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            controller.me.value!.record.photo),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Welcome Back",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TStyle.bold14.copyWith(),
                                      ),
                                      Text(
                                        controller.me.value!.record.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TStyle.regular12.copyWith(),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.notifications,
                                  color: BaseColor.purple,
                                ),
                              ],
                            ),
                          ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Row(
                      children: [
                        Image.asset(
                          AssetConstans.imgBot,
                          width: 84,
                          height: 84,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ethereum Wallet",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TStyle.bold24.copyWith(
                                  color: BaseColor.black.withOpacity(0.8)),
                            ),
                            Obx(
                              () => Text(
                                "ETH Price: ${Helpers.currency(controller.priceEth.value)}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TStyle.regular12.copyWith(
                                    color: BaseColor.black.withOpacity(0.8)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(() => controller.loadingMe.value == DataLoad.loading
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          width: MediaQuery.of(context).size.width,
                          height: 32,
                          decoration: BoxDecoration(
                              color: BaseColor.lightGrey,
                              borderRadius: BorderRadius.circular(4)),
                        )
                      : CardMain()),
                  ListHoler(),
                  ListAdvertising(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          )
        ])));
  }
}
