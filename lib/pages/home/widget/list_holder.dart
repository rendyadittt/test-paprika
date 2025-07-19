import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_paprika/controllers/home_controller.dart';
import 'package:test_paprika/helpers/helpers.dart';
import 'package:test_paprika/pages/home/widget/sheet_selection.dart';
import 'package:test_paprika/pages/home/widget/sheet_transaction.dart';
import 'package:test_paprika/utilites/colors.dart';
import 'package:test_paprika/utilites/decoration.dart';
import 'package:test_paprika/utilites/fonts.dart';
import 'package:test_paprika/widget/shimmer_list.dart';

class ListHoler extends StatelessWidget {
  ListHoler({super.key});
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loadingCreditCard.value == DataLoad.loading
          ? const ShimmerList()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    "Your Holder",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TStyle.bold14.copyWith(),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.creditCard.value!.record.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                            top: 8,
                          ),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: BaseColor.white, boxShadow: shadows),
                          child: InkWell(
                            onTap: () {
                              controller.selectedHolder.value = controller.creditCard.value!;
                              Get.bottomSheet(SheetTransaction(index: index,)).then((value) {
                                controller.selectedHolder.value = null;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              controller.creditCard.value!
                                                  .record[index].logo)),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.creditCard.value!.record[index]
                                              .cardHolder,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TStyle.regular12.copyWith(
                                              color: BaseColor.mediumGrey),
                                        ),
                                        Text(
                                          Helpers.currency(controller.creditCard.value!.record[index].balance),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TStyle.regular12.copyWith(color: BaseColor.mediumGrey),
                                        ),
                                        Text(
                                          controller.creditCard.value!.record[index]
                                              .cardNumber,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TStyle.bold14.copyWith(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(onPressed: () {
                                    Get.bottomSheet(SheetSelection(yes: "Delete Holder Now", onYes: () {
                                      controller.deleteCreditCardById(controller.creditCard.value!.record[index].id);
                                      Get.back();
                                    }));
                                  }, icon: const Icon(Icons.delete, size: 16,), color: BaseColor.mediumGrey,)
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
    );
  }
}
