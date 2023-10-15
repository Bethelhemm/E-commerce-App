import 'dart:ffi';

import 'package:book_store/Models/pagination.dart';
import 'package:book_store/Models/product_filter.dart';
import 'package:book_store/api/api_service.dart';
import 'package:book_store/application/state/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsNotifier extends StateNotifier<ProductsState> {
  final APIService _apiService;
  final ProductFilterModel _filterModel;

  ProductsNotifier(this._apiService, this._filterModel)
      : super(const ProductsState());

  int _page = 1;

  Future<void> getProducts() async {
    if (state.isLoading || !state.hasNext) {
      return;
    }
    state = state.copyWith(isLoading: true);
    var filerModel = _filterModel.copyWith(
        paginationModel: PaginationModel(
      page: _page,
      pageSize: 10,
    ));

    final products = await _apiService.getProducts(filerModel);
    final newProducts = [...state.products, ...products!];

    if (products.length % 10 != 0 || products.isEmpty) {
      state = state.copyWith(hasNext: false);
    }

    Future.delayed(const Duration(milliseconds: 1500), () {
      state = state.copyWith(products: newProducts);

      _page++;

      state = state.copyWith(isLoading: false);
    });
  }

  Future<void> refreshProducts() async {
    state = state.copyWith(
      products: [],
      hasNext: true,
    );
    _page = 1;
    await getProducts();
  }
}
