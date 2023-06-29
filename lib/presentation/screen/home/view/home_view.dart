import 'package:dio/dio.dart';
import 'package:edspert/data/data_source/remote_data_source/book_remote_data_source.dart';
import 'package:edspert/data/repository/book_repo_impl.dart';
import 'package:edspert/domain/use_case/get_books_use_case.dart';
import 'package:edspert/presentation/screen/detail/view/detail_view.dart';
import 'package:edspert/presentation/screen/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final homeController = HomeController(
    getBooksUseCase: GetBooksUseCase(
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: GetBuilder<HomeController>(
        init: homeController,
        initState: (state) => homeController.getBooks(),
        builder: (state) {
          if (state.homeState.value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.listBooks.value.length,
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
                child: Card(
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title ?? ' NO TITLE',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(book.subtitle ?? ' NO TITLE'),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
