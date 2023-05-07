import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/presentation/view%20model/newest%20books%20cubit/newest_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_book_item.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_book_schimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class BestSellerBooksList extends StatelessWidget {
  const BestSellerBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksLoading) {
          return const BestSellerBookSchimmer();
        } else if (state is NewestBooksSuccess) {
          return Container(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return BestSellerBook(
                  bookModel: state.books[index],
                );
              },
            ),
          );
        } else {
          return SizedBox(
            height: 0.2 * deviceHeight,
            child: Center(
              child: Text(
                "${(state as NewestBooksFailure).errorMessage} 🔴 !  ",
                style: Styles.textstyle20,
              ),
            ),
          );
        }
      },
    );
  }
}
