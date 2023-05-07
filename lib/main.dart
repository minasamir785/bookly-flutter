import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Core/utils/app_router.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:bookly/Features/Home/data/repos/home_repo_implementation.dart';
import 'package:bookly/Features/Home/presentation/view%20model/featured%20books%20cubit/featuered_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/view%20model/newest%20books%20cubit/newest_books_cubit.dart';
import 'package:bookly/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatueredBooksCubit(
              homeRepo: GetIt.instance.get<HomeRepImplementation>()),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
              homeRepo: GetIt.instance.get<HomeRepImplementation>()),
        )
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
