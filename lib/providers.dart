import 'package:bookstore/Models/product.dart';
import 'package:bookstore/Models/product_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookstore/api/api_service.dart';
import 'package:bookstore/Models/pagination.dart';
import 'package:bookstore/Models/genre.dart';

final genresProvider = FutureProvider.family<List<Genre>?, PaginationModel>(
    (ref, PaginationModel) {
  final apiRepository = ref.watch(apiService);

  return apiRepository.getGenres(
      PaginationModel.page, PaginationModel.pageSize);
});

final homeProductProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>(
  (ref, ProductFilterModel) {
    final apiRepository = ref.watch(apiService);

    return apiRepository.getProducts(ProductFilterModel);
  },
);
