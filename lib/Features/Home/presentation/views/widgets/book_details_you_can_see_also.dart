import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_selected_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsYouCanSeeAlso extends StatelessWidget {
  const BookDetailsYouCanSeeAlso({super.key});

  @override
  Widget build(BuildContext context) {
    //

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return Container(
      margin: EdgeInsets.only(top: deviceHeight * (49 / 810)),
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
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: BookDetailsSelectedBookImage(
                    aspectRatio: 3 / 5,
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
