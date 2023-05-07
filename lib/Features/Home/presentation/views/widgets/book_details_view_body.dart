import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_cutom_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_price_and_free_preview.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_selected_book_data.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_selected_book_image.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_you_can_see_also.dart';
import 'package:bookly/constant.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: const [
                BookDetailsCutomAppBar(),
                BookDetailsSelectedBookImage(),
                BookDetailsSelectedBookData(),
                BookDetailsPriceAndFreePreview(),
                BookDetailsYouCanSeeAlso(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
