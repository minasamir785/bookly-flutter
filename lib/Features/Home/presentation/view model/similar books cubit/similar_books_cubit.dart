import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_details_cutom_app_bar.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit({required this.homeRepo}) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks({required String bookName}) async {
    emit(SimilarBooksLoading());

    var results = await homeRepo.fetchSimilarBooks(bookName: bookName);
    results.fold((failure) {
      emit(SimilarBooksFailure(errMessage: failure.errorMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books: books));
    });
  }
}
