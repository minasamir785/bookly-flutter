import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsPriceAndFreePreview extends StatelessWidget {
  final BookModel book;

  const BookDetailsPriceAndFreePreview({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    //
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return Container(
      margin: EdgeInsets.only(top: (37 / 810) * deviceHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              await launchUrl(
                  Uri.parse(book.accessInfo!.pdf?.acsTokenLink ?? ""));
            },
            child: Container(
              alignment: Alignment.center,
              height: deviceHeight * (50 / 810),
              width: deviceWidth * (150 / 475),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                color: Colors.white,
              ),
              child: Text(
                "Free",
                style: Styles.textstyle18.copyWith(color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await launchUrl(Uri.parse(book.volumeInfo!.previewLink ?? ""));
            },
            child: Container(
              alignment: Alignment.center,
              height: deviceHeight * (50 / 810),
              width: deviceWidth * (150 / 475),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Color(0xffEF8262),
              ),
              child: const Text(
                "Free preview",
                style: Styles.textstyle16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
