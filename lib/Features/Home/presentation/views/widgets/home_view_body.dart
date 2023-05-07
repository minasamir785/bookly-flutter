import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/Home/presentation/view%20model/featured%20books%20cubit/featuered_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/view%20model/newest%20books%20cubit/newest_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_book_item.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_books_list.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/featured_book_item.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/featured_items_list.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/text_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FeatueredBooksCubit>(context).fetchFeaturedBooks();
    BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
  }

  //
  @override
  Widget build(BuildContext context) {
    //
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: const [
                CustomeAppBar(),
                FeaturedItemsList(),
                TextBestSeller(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: BestSellerBooksList(),
          )
        ],
      ),
    );
  }
}
