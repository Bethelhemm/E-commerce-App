import 'package:bookstore/Models/pagination.dart';
import 'package:bookstore/Models/product_filter.dart';
import 'package:bookstore/Models/product_sort.dart';
import 'package:bookstore/application/state/product_state.dart';
import 'package:bookstore/components/product_card.dart';
import 'package:bookstore/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? GenreId;
  String? GenreName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productFilters(GenreId: GenreId, GenreName: GenreName),
            Flexible(
              child: _ProductList(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangedDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      GenreName = arguments['genreName'];
      GenreId = arguments['genreId'];
    }
    super.didChangeDependencies();
  }
}

class _productFilters extends ConsumerWidget {
  final _sortByOptions = [
    ProductSortModel(
      value: "createdAt",
      label: "latest",
    ),
    ProductSortModel(
      value: "-productPrice",
      label: "price: High to Low",
    ),
    ProductSortModel(
      value: "productPrice",
      label: "price: Low to High",
    ),
  ];
  _productFilters({
    Key? key,
    this.GenreName,
    this.GenreId,
  });

  final String? GenreName;
  final String? GenreId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterProvider = ref.watch(productsFilterProvider);
    return Container(
      height: 51,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              GenreName!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: PopupMenuButton(
                onSelected: (sortBy) {
                  ProductFilterModel filterModel = ProductFilterModel(
                    paginationModel: PaginationModel(page: 0, pageSize: 10),
                    GenreId: filterProvider.GenreId,
                    sortBy: sortBy.toString(),
                  );
                  ref
                      .read(productsFilterProvider.notifier)
                      .setProductFilter(filterModel);

                  ref.read(productsNotifierProvider.notifier).getProducts();
                },
                initialValue: filterProvider.sortBy,
                itemBuilder: (BuildContext context) {
                  return _sortByOptions.map((item) {
                    return PopupMenuItem(
                      value: item.value,
                      child: InkWell(
                        child: Text(item.label!),
                      ),
                    );
                  }).toList();
                },
                icon: const Icon(Icons.filter_list_alt),
              ))
        ],
      ),
    );
  }
}

class _ProductList extends ConsumerWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsNotifierProvider);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final productsViewModel = ref.read(productsNotifierProvider.notifier);
        final productsState = ref.watch(productsNotifierProvider);

        if (productsState.hasNext) {
          productsViewModel.getProducts();
        }
      }
    });
    if (productsState.products.isEmpty) {
      if (!productsState.hasNext && productsState.isLoading) {
        return const Center(
          child: Text("No Products"),
        );
      }
      return const LinearProgressIndicator();
    }
    return RefreshIndicator(
      onRefresh: () async {
        ref.read(productsNotifierProvider.notifier).refreshProducts();
      },
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: GridView.count(
              crossAxisCount: 2,
              controller: _scrollController,
              children: List.generate(productsState.products.length, (index) {
                return ProductCard(
                  model: productsState.products[index],
                );
              }),
            ),
          ),
          Visibility(
            visible:
                productsState.isLoading && productsState.products.isNotEmpty,
            child: const SizedBox(
              height: 35,
              width: 35,
              child: const CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
