import 'package:dio/dio.dart';
import 'package:edspert/data/model/book_detail_response.dart';
import 'package:edspert/data/model/book_model.dart';
import 'package:edspert/data/model/book_response.dart';

class BookRemoteDataSource {
  final Dio client;
  const BookRemoteDataSource({required this.client});

  Future<List<Book>> getBooksByName(String name) async {
    try {
      final String url = 'https://api.itbook.store/1.0/search/$name';
      final response = await client.get(url);
      BookResponse decodedResponse = BookResponse.fromJson(response.data);
      List<Book> listBooks = decodedResponse.books ?? [];

      return listBooks;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<BookDetailResponse> getDetailBook(String isbn13) async {
    try {
      final url = 'https://api.itbook.store/1.0/books/$isbn13';
      final response = await client.get(url);
      BookDetailResponse decodedResponse =
          BookDetailResponse.fromJson(response.data);
      return decodedResponse;
    } catch (e) {
      print(e.toString());
      return BookDetailResponse();
    }
  }

  Future<List<Book>> getBooks() async {
    try {
      const url = 'https://api.itbook.store/1.0/new';
      final response = await client.get(url);
      BookResponse decodedResponse = BookResponse.fromJson(response.data);
      List<Book> listBooks = decodedResponse.books ?? [];

      return listBooks;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
