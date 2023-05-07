import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_book_item.dart';
import 'package:flutter/material.dart';

class SearchResultsBooksList extends StatelessWidget {
  const SearchResultsBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const BestSellerBook();
        },
      ),
    );
  }
}
