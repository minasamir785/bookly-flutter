import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/Home/presentation/views/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class FeaturedBookView extends StatelessWidget {
  final BookModel book;
  const FeaturedBookView({
    required this.book,
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
        GoRouter.of(context).push(BookDetialsView.route, extra: book);
      },
      child: SizedBox(
        height: 0.3 * deviceHeight,
        child: AspectRatio(
          aspectRatio: 2.5 / 4,
          child: Container(
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: NetworkImage(
                  book.volumeInfo!.imageLinks!.thumbnail!,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: IconButton(
              icon: const Icon(
                FontAwesomeIcons.play,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
