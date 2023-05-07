import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Core/errors/failures.dart';

import 'package:bookly/Features/Search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplementation({
    required this.apiService,
  });

  @override
  Future<Either<Faliure, List<BookModel>>> fetchforBooksByName(
      {required String bookName}) async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free-ebooks&q=  ${bookName.toLowerCase()}");
      //
      List<BookModel> books = [];

      for (var element in data["items"]) {
        try {
          books.add(BookModel.fromJson(element));
        } catch (e) {
          books.add(BookModel.fromJson(element));
        }
      }

      //
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(dioError: e),
        );
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
