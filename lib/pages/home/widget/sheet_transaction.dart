import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_paprika/controllers/home_controller.dart';
import 'package:test_paprika/helpers/helpers.dart';
import 'package:test_paprika/utilites/colors.dart';
import 'package:test_paprika/utilites/decoration.dart';
import 'package:test_paprika/utilites/fonts.dart';
import 'package:test_paprika/widget/appbar.dart';
import 'package:test_paprika/widget/button_primary.dart';

class SheetTransaction extends StatelessWidget {
  TextEditingController ctrlAmount = TextEditingController();
  SheetTransaction({super.key, required this.index});
  int index;
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: BaseColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppbarSheet(
            title: "Buy ETH",
            subtitle: "Please Enter Amount",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: BaseColor.white.withOpacity(0.25),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      controller: ctrlAmount,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.sentences,
                      style: TStyle.regular12,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {},
                      decoration: kDecorationForm.copyWith(
                        hintStyle: TStyle.regular12
                            .copyWith(color: BaseColor.mediumGrey),
                        hintText: "Enter Amount",
                        fillColor: BaseColor.lightGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: ButtonPrimary(
                    textButton: "Buy Eth",
                    onTap: () {
                      if (ctrlAmount.value.text.isEmpty) {
                        Helpers.setSnackbar("Please Enter Amount");
                      } else {
                        final holder = homeController.creditCard.value!.record[index];
                        final int amount = int.parse(ctrlAmount.value.text);
                        final int currentBalance = holder.balance;
                        final int newBalance = currentBalance - amount;

                        holder.balance = newBalance < 0 ? 0 : newBalance;

                        var count = int.parse(ctrlAmount.value.text) + int.parse(homeController.balance.value);
                        homeController.balance.value = count.toString();

                        Get.back();

                        homeController.creditCard.refresh();
                        homeController.addTransaction(status: true, total: int.parse(ctrlAmount.value.text), date: DateTime.now(), method: holder.category);
                        Get.back();
                        Get.back();
                        Helpers.setSnackbar("Top Up Succesfuly");
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          )
        ],
      ),
    );
  }
}
