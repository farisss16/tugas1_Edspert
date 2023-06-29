import 'package:edspert/data/model/book_model.dart';
import 'package:edspert/domain/use_case/get_books_use_case.dart';
import 'package:edspert/presentation/state/view_state.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetBooksUseCase getBooksUseCase;

  HomeController({required this.getBooksUseCase});

  Rx<List<Book>> listBooks = Rx([]);
  Rx<ViewState> homeState = Rx(ViewState.initial);

  void getBooks() async {
    homeState(ViewState.loading);
    update();
    final result = await getBooksUseCase.call();
    listBooks(result);
    homeState(ViewState.success);
    update();
  }
}
