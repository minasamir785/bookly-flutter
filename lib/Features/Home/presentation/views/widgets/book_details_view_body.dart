import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_cutom_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_price_and_free_preview.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_selected_book_data.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_selected_book_image.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_you_can_see_also.dart';
import 'package:bookly/constant.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailsViewBody({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const BookDetailsCutomAppBar(),
                BookDetailsSelectedBookImage(
                    imgUrl: bookModel.volumeInfo!.imageLinks!.thumbnail),
                BookDetailsSelectedBookData(
                  book: bookModel,
                ),
                BookDetailsPriceAndFreePreview(book: bookModel),
                const BookDetailsYouCanSeeAlso(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
