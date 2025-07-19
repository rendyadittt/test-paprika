import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:test_paprika/model/advertising_model.dart';
import 'package:test_paprika/utilites/colors.dart';
import 'package:test_paprika/utilites/fonts.dart';
import 'package:test_paprika/widget/appbar.dart';

class AdvertisingPage extends StatelessWidget {
  Advertising model;
  AdvertisingPage({super.key, required this.model}) {
    model = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BaseColor.bgColor,
        body: SafeArea(
            child: Column(
          children: [
            AppbarSheet(title: "Advertising", subtitle: ""),
            Container(
              height: 160,
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: CachedNetworkImageProvider(model.image),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter),
              ),
            ),
            Html(data: model.desc)
          ],
        )));
  }
}
