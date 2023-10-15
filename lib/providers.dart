import 'package:book_store/Models/product.dart';
import 'package:book_store/Models/product_filter.dart';
import 'package:book_store/application/notifier/product_filter.dart';
import 'package:book_store/application/notifier/produtcs_notifier.dart';
import 'package:book_store/application/state/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:book_store/api/api_service.dart';
import 'package:book_store/Models/pagination.dart';
import 'package:book_store/Models/genre.dart';

import 'Models/slider.dart';
import 'application/notifier/cart_notifier.dart';
import 'application/state/cart_state.dart';

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

final productsFilterProvider =
    StateNotifierProvider<ProductsFilterNotifier, ProductFilterModel>(
  (ref) => ProductsFilterNotifier(),
);

final productsNotifierProvider =
    StateNotifierProvider<ProductsNotifier, ProductsState>(
  (ref) => ProductsNotifier(
    ref.watch(apiService),
    ref.watch(productsFilterProvider),
  ),
);

final sliderProvider =
    FutureProvider.family<List<SliderModel>?, PaginationModel>(
  (ref, paginationModel) {
    final sliderRepo = ref.watch(apiService);
    return sliderRepo.getSliders(
        paginationModel.page, paginationModel.pageSize);
  },
);

final cartItemsProvider = StateNotifierProvider<CartNotifier, CartState>(
  (ref) => CartNotifier(
    ref.watch(apiService),
  ),
);
