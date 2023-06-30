import 'package:dio/dio.dart';
import 'package:edspert/data/data_source/remote_data_source/book_remote_data_source.dart';
import 'package:edspert/data/repository/book_repo_impl.dart';
import 'package:edspert/domain/use_case/get_books_by_name_use_case.dart';
import 'package:edspert/domain/use_case/get_books_use_case.dart';
import 'package:edspert/presentation/screen/detail/view/detail_view.dart';
import 'package:edspert/presentation/screen/search/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final searchController = SearchController(
    getBooksUseCase: GetBooksUseCase(
      repository: BookRepositoryImpl(
        remoteDataSource: BookRemoteDataSource(
          client: Dio(),
        ),
      ),
    ),
    getBooksByNameUseCase: GetBooksByNameUseCase(
      repository: BookRepositoryImpl(
        remoteDataSource: BookRemoteDataSource(
          client: Dio(),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => searchController.getBooks(value),
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: const Icon(Icons.search),
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            ),
            Expanded(
              child: GetBuilder<SearchController>(
                init: searchController,
                initState: (state) => searchController.getBooks(),
                builder: (state) {
                  if (state.homeState.value.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.listBooks.value.length,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    itemBuilder: (context, index) {
                      final book = state.listBooks.value[index];

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailView(isbn13: book.isbn13 ?? ''),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(width: 8.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            book.title ?? 'No title',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
