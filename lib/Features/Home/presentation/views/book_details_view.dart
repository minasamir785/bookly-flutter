import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/Home/presentation/view%20model/similar%20books%20cubit/similar_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetialsView extends StatefulWidget {
  static const route = "/BookDetialsView";

  final BookModel bookModel;
  const BookDetialsView({super.key, required this.bookModel});

  @override
  State<BookDetialsView> createState() => _BookDetialsViewState();
}

class _BookDetialsViewState extends State<BookDetialsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetchFeaturedBooks(
        bookName: widget.bookModel.volumeInfo?.categories?[0] ?? "computer");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(bookModel: widget.bookModel),
    );
  }
}
