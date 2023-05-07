import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/Home/data/repos/home_repo_implementation.dart';
import 'package:bookly/Features/Home/presentation/view%20model/similar%20books%20cubit/similar_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/Home/presentation/views/home_view.dart';
import 'package:bookly/Features/Search/presentation/views/search_view.dart';
import 'package:bookly/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  //Sliding Trantion Function
  //(BuildContext, Animation<double>, Animation<double>, Widget)

  //
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.route,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.route,
        builder: (context, state) => const HomeView(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeView(),
          transitionDuration: kTranstionDuration,
          transitionsBuilder: customFadingTranstion,
        ),
      ),
      GoRoute(
        path: BookDetialsView.route,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
              homeRepo: GetIt.instance.get<HomeRepImplementation>()),
          child: BookDetialsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: SearchView.route,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}

Widget customSlidingTranstion(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  const begin = Offset(0.0, 0.25);
  const end = Offset.zero;
  const curve = Curves.easeIn;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}

Widget customFadingTranstion(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
