import 'package:bookly/Core/errors/failures.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Faliure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Faliure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Faliure, List<BookModel>>> fetchSimilarBooks(
      {required String bookName});
}
