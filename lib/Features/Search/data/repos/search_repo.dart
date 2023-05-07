import 'package:bookly/Core/errors/failures.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Faliure, List<BookModel>>> fetchforBooksByName(
      {required String bookName});
}
