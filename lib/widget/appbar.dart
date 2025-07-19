import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_paprika/utilites/colors.dart';
import 'package:test_paprika/utilites/fonts.dart';

class AppbarSheet extends StatelessWidget {
  AppbarSheet({super.key, required this.title, required this.subtitle});
  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40, height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: BaseColor.mediumGrey.withOpacity(0.2)
                    ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TStyle.bold14.copyWith(),
                  ),
                  Text(
                    subtitle,
                    style: TStyle.regular12.copyWith(color: BaseColor.mediumGrey),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close_rounded, color: BaseColor.black,))
          ],
        ),
      ),
    );
  }
}
