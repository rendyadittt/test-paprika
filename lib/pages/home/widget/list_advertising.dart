import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_paprika/controllers/home_controller.dart';
import 'package:test_paprika/helpers/helpers.dart';
import 'package:test_paprika/routes/routes_name.dart';
import 'package:test_paprika/utilites/fonts.dart';
import 'package:test_paprika/widget/shimmer_list.dart';

class ListAdvertising extends StatelessWidget {
  ListAdvertising({super.key});
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loadingAdvertising.value == DataLoad.loading
          ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ShimmerList(),
            )
          : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16),
                 child: Text(
                   "Advertising",
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                   style: TStyle.bold14.copyWith(),
                 ),
               ),
               const SizedBox(height: 8),
              SizedBox(
                  height: 160,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.advertising.value!.record.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(RoutesName.advertising, arguments: controller
                                      .advertising.value!.record[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: index == 0 ? 0 : 8),
                            height: 160,
                            width: MediaQuery.of(context).size.width - 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(controller
                                      .advertising.value!.record[index].image),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter),
                            ),
                          ),
                        );
                      }),
                ),
            ],
          ),
    );
  }
}
