import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required this.homeRepo}) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  void fetchNewestBooks() async {
    emit(NewestBooksLoading());

    var results = await homeRepo.fetchNewestBooks();

    results.fold((failure) {
      emit(NewestBooksFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(NewestBooksSuccess(books: books));
    });
  }
}
