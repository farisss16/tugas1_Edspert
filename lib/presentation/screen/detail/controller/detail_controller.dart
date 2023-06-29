import 'package:edspert/data/model/book_detail_response.dart';
import 'package:edspert/domain/use_case/get_detail_book_use_case.dart';
import 'package:edspert/presentation/state/view_state.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final GetDetailBookUseCase getDetailBookUseCase;

  DetailController({required this.getDetailBookUseCase});

  Rx<ViewState> detailState = Rx(ViewState.initial);
  Rx<BookDetailResponse> detailBook = Rx(BookDetailResponse());

  void getDetailBook(String isbn13) async {
    detailState(ViewState.loading);
    update();

    final result = await getDetailBookUseCase.call(isbn13);
    detailBook(result);
    detailState(ViewState.success);
    update();
  }
}
