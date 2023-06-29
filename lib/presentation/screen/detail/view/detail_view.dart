import 'package:dio/dio.dart';
import 'package:edspert/data/data_source/remote_data_source/book_remote_data_source.dart';
import 'package:edspert/data/repository/book_repo_impl.dart';
import 'package:edspert/domain/use_case/get_detail_book_use_case.dart';
import 'package:edspert/presentation/screen/detail/controller/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  final String isbn13;
  DetailView({super.key, required this.isbn13});

  final detailController = DetailController(
    getDetailBookUseCase: GetDetailBookUseCase(
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
      body: GetBuilder<DetailController>(
        init: detailController,
        initState: (state) => detailController.getDetailBook(isbn13),
        builder: (state) {
          if (state.detailState.value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Text(state.detailBook.value.authors ?? 'NO AUTHOR'),
          );
        },
      ),
    );
  }
}
