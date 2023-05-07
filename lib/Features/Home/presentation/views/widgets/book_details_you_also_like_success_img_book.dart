import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/Home/presentation/views/book_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimilarBookImageCustomedForSuccess extends StatelessWidget {
  const SimilarBookImageCustomedForSuccess({
    super.key,
    required this.book,
    this.imageHeight,
    this.aspectRatio,
    this.imgUrl,
  });

  final double? imageHeight;
  final double? aspectRatio;
  final String? imgUrl;
  final BookModel? book;

  @override
  Widget build(BuildContext context) {
    //

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(BookDetialsView.route, extra: book);
      },
      child: SizedBox(
        height: imageHeight ?? (deviceHeight * (320 / 810)),
        child: AspectRatio(
          aspectRatio: aspectRatio ?? 1.4 / 2.4,
          child: Container(
            margin: EdgeInsets.only(top: deviceHeight * (20 / 810)),
            padding:
                EdgeInsets.symmetric(horizontal: deviceWidth * (1.5 / 375)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imgUrl ?? "",
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
