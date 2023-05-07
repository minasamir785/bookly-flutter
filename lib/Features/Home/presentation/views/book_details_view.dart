import 'package:bookly/Features/Home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetialsView extends StatelessWidget {
  static const route = "/BookDetialsView";
  const BookDetialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookDetailsViewBody(),
    );
  }
}
