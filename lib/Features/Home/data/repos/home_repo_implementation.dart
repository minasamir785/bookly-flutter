import 'dart:developer';

import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Core/errors/failures.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class HomeRepImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepImplementation({
    required this.apiService,
  });

  @override
  Future<Either<Faliure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=newest &q=subject: computer science");
      List<BookModel> books = [];
      for (var element in data["items"]) {
        books.add(BookModel.fromJson(element));
      }
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

  @override
  Future<Either<Faliure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free-ebooks&q=subject: computer science");
      //
      List<BookModel> books = [];
      for (var element in data["items"]) {
        books.add(BookModel.fromJson(element));
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
