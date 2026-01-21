import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssetWidget extends StatelessWidget {
  const SvgAssetWidget({
    super.key,
    required this.assetName,
    required this.size,
    this.svgColor,
    this.isPaddingRequired = true,
  });

  final String assetName;
  final Color? svgColor;
  final double size;
  final bool isPaddingRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isPaddingRequired ? EdgeInsets.symmetric(horizontal: 3, vertical: 15) : EdgeInsets.zero,
      child: SvgPicture.asset(
        assetName,
        alignment: Alignment.center,
        height: size,
        width: size,
        colorFilter: svgColor != null ? ColorFilter.mode(svgColor!, BlendMode.srcIn) : null,
      ),
    );
  }
}
