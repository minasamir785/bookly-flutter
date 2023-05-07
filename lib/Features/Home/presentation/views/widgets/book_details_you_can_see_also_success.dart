import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_selected_book_image.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_you_also_like_success_img_book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookDetailsYouCanSeeAlsoSuccess extends StatelessWidget {
  final List<BookModel> books;
  const BookDetailsYouCanSeeAlsoSuccess({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    //

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return Container(
      margin: EdgeInsets.only(top: deviceHeight * (25 / 810)),
      padding: EdgeInsets.symmetric(horizontal: deviceWidth * (30 / 375)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You can also like",
            style: Styles.textstyle14,
          ),
          SizedBox(
            height: deviceHeight * (140 / 810),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SimilarBookImageCustomedForSuccess(
                    book: books[index],
                    aspectRatio: 3 / 5,
                    imgUrl:
                        books[index].volumeInfo?.imageLinks?.thumbnail ?? "",
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
