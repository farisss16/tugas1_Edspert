import 'package:edspert/data/model/book_model.dart';
import 'package:edspert/domain/repository/book_repository.dart';

class GetBooksUseCase {
  final BookRepository repository;

  const GetBooksUseCase({required this.repository});

  Future<List<Book>> call() async => await repository.getBooks();
}
