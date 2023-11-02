import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notes/components/theme/colors.dart';

class SvgCircleImage extends StatelessWidget {
  const SvgCircleImage({
    super.key,
    required this.svgFromAsset,
    required this.radius,
  });

  final String svgFromAsset;

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: MyColors.svgCircleImageBgColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.asset(
          svgFromAsset,
        ),
      ),
    );
  }
}
