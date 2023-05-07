import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_book_rating_and_price.dart';
import 'package:bookly/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerBook extends StatelessWidget {
  const BestSellerBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(BookDetialsView.route);
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
                  ...BookNameAndAutherName(),
                  const Flexible(
                    child: BestSellerBookRatingsAndPrice(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> BookNameAndAutherName() {
    return [
      Flexible(
        child: Text(
          "Harry Potter and the Chamber of Secrets ",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Styles.textstyle20.copyWith(
            fontFamily: kSpectralFont,
          ),
        ),
      ),
      Text(
        "J. K. Rowling",
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
          image: const DecorationImage(
            image: NetworkImage(
              "https://picsum.photos/200/300",
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
