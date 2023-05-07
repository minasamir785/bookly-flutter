import 'package:bookly/Features/Search/data/repos/search_repo_implementation.dart';
import 'package:bookly/Features/Search/presentation/view%20model/cubit/search_for_book_cubit.dart';
import 'package:bookly/Features/Search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SearchView extends StatelessWidget {
  static const route = "/SearchView";
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchForBookCubit(
            searchRepo: GetIt.instance.get<SearchRepoImplementation>()),
        child: const SearchViewBody(),
      ),
    );
  }
}
