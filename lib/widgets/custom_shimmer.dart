import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  const CustomShimmer(
      {this.height,
      this.width,
      this.borderRadius,
      this.verticalPadding,
      this.horizontalPadding});

  const CustomShimmer.circle(double radius)
      : this(height: radius, width: radius,borderRadius: radius);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 0,
          horizontal: horizontalPadding ?? 0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          color: Colors.grey,
        ),
        width: width,
        height: height,
      ),
    );
  }
}
