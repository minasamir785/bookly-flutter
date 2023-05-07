import 'dart:async';

import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/presentation/view%20model/featured%20books%20cubit/featuered_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/featured_book_item.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/featured_books_schimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedItemsList extends StatefulWidget {
  const FeaturedItemsList({
    super.key,
  });

  @override
  State<FeaturedItemsList> createState() => _FeaturedItemsListState();
}

class _FeaturedItemsListState extends State<FeaturedItemsList> {
  //Varible declartion

  //ScrollController
  final ScrollController scrollController = ScrollController();
  //Timer
  late Timer timer;

  //Double
  late double deviceHeight;
  late double deviceWidth;

  @override
  void initState() {
    super.initState();
    timer = createPeriodicScollController(scrollController);
  }

  @override
  void dispose() {
    timer.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //

    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    //
    return BlocBuilder<FeatueredBooksCubit, FeatueredBooksState>(
      builder: (context, state) {
        if (state is FeatueredBooksLoading) {
          return const FeaturedBooksShimmer();
        } else if (state is FeatueredBooksSuccess) {
          return SizedBox(
            height: 0.3 * deviceHeight,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FeaturedBookView(book: state.books[index]),
                );
              },
            ),
          );
        } else {
          return SizedBox(
            height: 0.2 * deviceHeight,
            child: const Center(
              child: Text(
                "Something went wrong 🔴 !",
                style: Styles.textstyle20,
              ),
            ),
          );
        }
      },
    );
  }

  Timer createPeriodicScollController(ScrollController scrollController) {
    Timer timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (scrollController.hasClients) {
        double maxScrollExtent = scrollController.position.maxScrollExtent;
        double currentOffset = scrollController.offset;
        double newOffset = currentOffset +
            (2.5 / 4) * (0.3 * MediaQuery.of(context).size.height);
        if (newOffset >= maxScrollExtent) {
          newOffset = 0.0;
        }
        scrollController.animateTo(
          newOffset,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
    return timer;
  }
}
