import 'package:bookstore/Models/pagination.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bookstore/Models/genre.dart';
import '../providers.dart';

class HomeCategoriesWidget extends ConsumerWidget {
  const HomeCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "All Genres",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _genreList(ref),
          )
        ],
      ),
    );
  }

  Widget _genreList(WidgetRef ref) {
    final genres =
        ref.watch(genresProvider(PaginationModel(page: 1, pageSize: 10)));
    return genres.when(
        data: (list) {
          return _buildGenreList(list!);
        },
        error: (_, __) => const Center(
              child: Text("ERROR"),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _buildGenreList(List<Genre> genres) {
    return Container(
      height: 100,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          var data = genres[index];
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    child: Image.network(
                      data.fullImagePath,
                      height: 50,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.GenreName,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
