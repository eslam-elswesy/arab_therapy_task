import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({Key? key, required this.imageLink, this.fit, this.errorWidget}) : super(key: key);

  final String imageLink;
  final BoxFit? fit;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: imageLink,
        fit: fit ?? BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: AppColors.white,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Opacity(
                opacity: 0.1,
                child: SvgPicture.asset(
                  '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
      ),
    );
  }
}
