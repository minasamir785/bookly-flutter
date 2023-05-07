part of 'featuered_books_cubit.dart';

abstract class FeatueredBooksState extends Equatable {
  const FeatueredBooksState();

  @override
  List<Object> get props => [];
}

class FeatueredBooksInitial extends FeatueredBooksState {}

class FeatueredBooksLoading extends FeatueredBooksState {}

class FeatueredBooksSuccess extends FeatueredBooksState {
  final List<BookModel> books;

  const FeatueredBooksSuccess({
    required this.books,
  });
}

class FeatueredBooksFailure extends FeatueredBooksState {
  final String errMessage;

  const FeatueredBooksFailure({
    required this.errMessage,
  });
}
