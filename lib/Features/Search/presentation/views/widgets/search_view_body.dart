import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_book_item.dart';
import 'package:bookly/Features/Search/presentation/views/widgets/search_results_books_list.dart';
import 'package:bookly/Features/Search/presentation/views/widgets/search_results_text.dart';
import 'package:bookly/Features/Search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          SearchTextField(),
          SearchResultsText(),
          Expanded(
            child: SearchResultsBooksList(),
          ),
        ],
      ),
    );
  }
}
