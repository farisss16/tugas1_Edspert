import 'package:edspert/data/model/book_model.dart';
import 'package:edspert/domain/use_case/get_books_by_name_use_case.dart';
import 'package:edspert/presentation/state/view_state.dart';
import 'package:get/get.dart';

import '../../../../domain/use_case/get_books_use_case.dart';

class SearchController extends GetxController {
  final GetBooksUseCase getBooksUseCase;
  final GetBooksByNameUseCase getBooksByNameUseCase;

  SearchController(
      {required this.getBooksUseCase, required this.getBooksByNameUseCase});

  Rx<List<Book>> listBooks = Rx([]);
  Rx<ViewState> homeState = Rx(ViewState.initial);

  void getBooks([String name = '']) async {
    homeState(ViewState.loading);
    update();

    final List<Book> listBooks = name == ''
        ? await getBooksUseCase.call()
        : await getBooksByNameUseCase.call(name);
    this.listBooks(listBooks);
    homeState(ViewState.success);
    update();
  }
}
