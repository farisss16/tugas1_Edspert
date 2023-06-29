import 'package:edspert/data/model/book_model.dart';

class BookResponse {
  final String? error;
  final String? total;
  final List<Book>? books;

  BookResponse({
    this.error,
    this.total,
    this.books,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) => BookResponse(
        error: json["error"],
        total: json["total"],
        books: json["books"] == null
            ? []
            : List<Book>.from(json["books"]!.map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "books": books == null
            ? []
            : List<dynamic>.from(books!.map((x) => x.toJson())),
      };
}
