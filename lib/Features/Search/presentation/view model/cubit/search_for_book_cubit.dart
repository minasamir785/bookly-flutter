import 'package:bloc/bloc.dart';
import 'package:bookly/Core/errors/failures.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/Search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_for_book_state.dart';

class SearchForBookCubit extends Cubit<SearchForBookState> {
  SearchForBookCubit({
    required this.searchRepo,
  }) : super(SearchForBookInitial());
  SearchRepo searchRepo;

  Future<void> fetchBooksByName({required String bookName}) async {
    emit(SearchForBookLoading());

    var results = await searchRepo.fetchforBooksByName(bookName: bookName);

    results.fold((failure) {
      emit(SearchForBookFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(SearchForBookSuccess(books: books));
    });
  }
}
