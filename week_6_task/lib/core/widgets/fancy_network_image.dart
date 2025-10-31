import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FancyNetworkImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadiusGeometry;

  const FancyNetworkImage({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
    this.borderRadiusGeometry,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadiusGeometry ?? BorderRadius.circular(16.r),
      child: FancyShimmerImage(
        imageUrl: imagePath,
        width: width,
        height: height,
        boxFit: BoxFit.fill,
        shimmerBaseColor: Colors.grey[300]!,
        shimmerHighlightColor: Colors.grey[100]!,
        shimmerBackColor: Colors.grey[100]!,
        errorWidget: const Center(child: Icon(Icons.error)),
        alignment: Alignment.center,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: borderRadiusGeometry ?? BorderRadius.circular(16.r),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
