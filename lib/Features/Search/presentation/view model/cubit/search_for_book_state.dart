part of 'search_for_book_cubit.dart';

abstract class SearchForBookState extends Equatable {
  const SearchForBookState();

  @override
  List<Object> get props => [];
}

class SearchForBookInitial extends SearchForBookState {}

class SearchForBookLoading extends SearchForBookState {}

class SearchForBookFailure extends SearchForBookState {
  final String errorMessage;

  const SearchForBookFailure({required this.errorMessage});
}

class SearchForBookSuccess extends SearchForBookState {
  final List<BookModel> books;

  const SearchForBookSuccess({required this.books});
}
