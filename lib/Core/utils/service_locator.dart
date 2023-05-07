import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:bookly/Features/Home/data/repos/home_repo_implementation.dart';
import 'package:bookly/Features/Search/data/repos/search_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

abstract class GetItSetup {
  static final getIt = GetIt.instance;
  static void setup() {
    getIt.registerSingleton<ApiService>(
      ApiService(
        dio: Dio(),
      ),
    );
    getIt.registerSingleton<HomeRepImplementation>(
      HomeRepImplementation(apiService: getIt.get<ApiService>()),
    );
    getIt.registerSingleton<SearchRepoImplementation>(
      SearchRepoImplementation(apiService: getIt.get<ApiService>()),
    );
  }
}
