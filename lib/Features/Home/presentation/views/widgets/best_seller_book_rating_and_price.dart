import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BestSellerBookRatingsAndPrice extends StatelessWidget {
  const BestSellerBookRatingsAndPrice({super.key, required this.bookmodel});

  final BookModel bookmodel;

  @override
  Widget build(BuildContext context) {
    //

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return Flex(
      direction: Axis.horizontal,
      children: [
        Text(
          "Free",
          style: Styles.textstyle20.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: deviceWidth * 0.15,
        ),
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " ${bookmodel.volumeInfo!.averageRating ?? 0}",
                style: Styles.textstyle16,
              ),
              Text(
                "(${bookmodel.volumeInfo!.ratingsCount ?? 0})",
                overflow: TextOverflow.ellipsis,
                style: Styles.textstyleLowOpacity14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
