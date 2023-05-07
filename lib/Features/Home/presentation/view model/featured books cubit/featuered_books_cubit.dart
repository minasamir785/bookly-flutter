import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featuered_books_state.dart';

class FeatueredBooksCubit extends Cubit<FeatueredBooksState> {
  FeatueredBooksCubit({
    required this.homeRepo,
  }) : super(FeatueredBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeatueredBooksLoading());

    var results = await homeRepo.fetchFeaturedBooks();

    results.fold((failure) {
      emit(FeatueredBooksFailure(errMessage: failure.errorMessage));
    }, (books) {
      emit(FeatueredBooksSuccess(books: books));
    });
  }
}
