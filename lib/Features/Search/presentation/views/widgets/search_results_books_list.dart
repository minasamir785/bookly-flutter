import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_book_item.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_book_schimmer.dart';
import 'package:bookly/Features/Search/presentation/view%20model/cubit/search_for_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsBooksList extends StatelessWidget {
  const SearchResultsBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchForBookCubit, SearchForBookState>(
      builder: (context, state) {
        if (state is SearchForBookSuccess) {
          return Container(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return BestSellerBook(
                  bookModel: state.books[index],
                );
              },
            ),
          );
        } else if (state is SearchForBookFailure) {
          return const Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
              size: 40,
            ),
          );
        } else if (state is SearchForBookLoading) {
          return Container(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const BestSellerBookSchimmer();
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
