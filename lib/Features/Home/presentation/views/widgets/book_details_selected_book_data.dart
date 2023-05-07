import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/constant.dart';
import 'package:flutter/material.dart';

class BookDetailsSelectedBookData extends StatelessWidget {
  final BookModel book;

//

  const BookDetailsSelectedBookData({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    //
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return Container(
      margin: EdgeInsets.only(
        top: deviceHeight * (40 / 810),
        left: deviceWidth * (30 / 375),
        right: deviceWidth * (30 / 375),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            book.volumeInfo!.title ?? "",
            style: Styles.textstyle30.copyWith(fontFamily: kSpectralFont),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Text(
            (book.volumeInfo!.authors ?? []).join(", "),
            style: Styles.textstyleLowOpacity18,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: deviceHeight * (14 / 810),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 18,
              ),
              Text(
                " ${book.volumeInfo!.averageRating ?? '0'}",
                style: Styles.textstyle16,
              ),
              SizedBox(
                width: deviceWidth * (9 / 475),
              ),
              Text(
                "(${book.volumeInfo!.ratingsCount ?? '0'})",
                overflow: TextOverflow.ellipsis,
                style: Styles.textstyleLowOpacity14,
              ),
            ],
          )
        ],
      ),
    );
  }
}
