import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/Home/presentation/view%20model/similar%20books%20cubit/similar_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_selected_book_image.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_you_can_also_like_shimmer.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_you_can_see_also_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class BookDetailsYouCanSeeAlso extends StatelessWidget {
  const BookDetailsYouCanSeeAlso({super.key});

  @override
  Widget build(BuildContext context) {
    //

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return BookDetailsYouCanSeeAlsoSuccess(
            books: state.books,
          );
        } else if (state is SimilarBooksFailure) {
          return SizedBox(
            height: 0.2 * deviceHeight,
            child: Center(
              child: Text(
                "${state.errMessage} 🔴 !  ",
                style: Styles.textstyle20,
              ),
            ),
          );
        } else {
          return const BookDetailsYouCanAlsoLikeShimmer();
        }
      },
    );
  }
}
