import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_book_rating_and_price.dart';
import 'package:bookly/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerBook extends StatelessWidget {
  const BestSellerBook({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  //
  @override
  Widget build(BuildContext context) {
    //

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(BookDetialsView.route, extra: bookModel);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.08,
        ),
        margin: EdgeInsets.symmetric(
          vertical: deviceHeight * 0.01,
        ),
        height: deviceHeight * 0.15,
        width: deviceWidth * 0.8,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            leadingBookImage(),
            SizedBox(
              width: deviceWidth * 0.08,
            ),
            Flexible(
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                direction: Axis.vertical,
                children: [
                  ...bestSellerBookSchimmer(),
                  Flexible(
                    child: BestSellerBookRatingsAndPrice(bookmodel: bookModel),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> bestSellerBookSchimmer() {
    return [
      Flexible(
        child: Text(
          bookModel.volumeInfo!.title!,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Styles.textstyle20.copyWith(
            fontFamily: kSpectralFont,
          ),
        ),
      ),
      Text(
        (bookModel.volumeInfo!.authors ?? []).join(", "),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: Styles.textstyleLowOpacity14,
      ),
    ];
  }

  Widget leadingBookImage() {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: Container(
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: CachedNetworkImage(
          imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail ?? "",
          errorWidget: (context, url, error) => const Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
