import 'package:edspert/data/model/book_detail_response.dart';
import 'package:edspert/data/model/book_model.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();

  Future<BookDetailResponse> getDetailBook(String isbn13);
}
