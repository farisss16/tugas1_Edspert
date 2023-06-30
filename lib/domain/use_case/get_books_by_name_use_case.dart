import 'package:edspert/data/model/book_model.dart';
import 'package:edspert/domain/repository/book_repository.dart';

class GetBooksByNameUseCase {
  final BookRepository repository;

  const GetBooksByNameUseCase({required this.repository});

  Future<List<Book>> call(String name) async =>
      await repository.getBooksByName(name);
}
