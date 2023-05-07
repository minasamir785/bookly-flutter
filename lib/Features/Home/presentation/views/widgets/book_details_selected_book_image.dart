import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSelectedBookImage extends StatelessWidget {
  const BookDetailsSelectedBookImage({
    super.key,
    this.imageHeight,
    this.aspectRatio,
    this.imgUrl,
  });

  final double? imageHeight;
  final double? aspectRatio;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    //

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return SizedBox(
      height: imageHeight ?? (deviceHeight * (280 / 810)),
      child: AspectRatio(
        aspectRatio: aspectRatio ?? 1.4 / 2.4,
        child: Container(
          margin: EdgeInsets.only(top: deviceHeight * (30 / 810)),
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * (100 / 375)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: CachedNetworkImageProvider(
                imgUrl ?? "",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
