import 'package:flutter/material.dart';
import 'package:test_paprika/utilites/colors.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(top: 8),
          width: MediaQuery.of(context).size.width,
          height: 48,
          decoration: BoxDecoration(
            color: BaseColor.lightGrey,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
        );
      }
    );
  }
}