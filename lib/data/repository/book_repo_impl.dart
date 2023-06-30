import 'package:edspert/data/data_source/remote_data_source/book_remote_data_source.dart';
import 'package:edspert/data/model/book_detail_response.dart';
import 'package:edspert/data/model/book_model.dart';
import 'package:edspert/domain/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;

  const BookRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Book>> getBooks() async => await remoteDataSource.getBooks();

  @override
  Future<BookDetailResponse> getDetailBook(String isbn13) async =>
      await remoteDataSource.getDetailBook(isbn13);

  @override
  Future<List<Book>> getBooksByName(String name) async =>
      await remoteDataSource.getBooksByName(name);
}
