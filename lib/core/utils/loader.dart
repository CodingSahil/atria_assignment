import 'package:atria_assignment/core/constants/colors.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.color, this.size = 18});

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(color: AppColors.black, strokeWidth: 2),
    );
  }
}
