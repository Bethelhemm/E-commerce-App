import 'package:book_store/Models/pagination.dart';
import 'package:book_store/Models/product_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsFilterNotifier extends StateNotifier<ProductFilterModel> {
  ProductsFilterNotifier()
      : super(
          ProductFilterModel(
            paginationModel: PaginationModel(
              page: 0,
              pageSize: 10,
            ),
          ),
        );

  void setProductFilter(ProductFilterModel model) {
    state = model;
  }
}
