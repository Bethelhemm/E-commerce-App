import 'package:book_store/Models/pagination.dart';
import 'package:book_store/Models/product.dart';
import 'package:book_store/Models/product_filter.dart';
import 'package:book_store/components/product_card.dart';
import 'package:book_store/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:book_store/Models/genre.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProductWidget extends ConsumerWidget {
  const HomeProductWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> list = List<Product>.empty(growable: true);

    list.add(
      Product(
        productName: "The Silent Patient",
        genre: Genre(
            GenreName: "thriller",
            GenreImage: "assets/silent patient.jpeg",
            GenreId: "1234"),
        prodectDescription:
            "The Silent Patient is a shocking psychological thriller of a woman's act of violence against her husband―and of the therapist obsessed with uncovering her motive. Alicia Berenson's life is seemingly perfect.",
        productPrice: 30,
        productSalePrice: 26,
        productImage: "assets/thriller.jpeg",
        productSKU: "GA-100",
        productType: "simple",
        productStatus: "IN",
        productId: "123",
      ),
    );
    return Container(
      color: const Color(0xffF4F7FA),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 15),
              child: Text(
                "Top 10 books",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: _productList(ref),
        )
      ]),
    );
  }

  Widget _productList(WidgetRef ref) {
    final products = ref.watch(
      homeProductProvider(
        ProductFilterModel(
          paginationModel: PaginationModel(page: 1, pageSize: 10),
        ),
      ),
    );
    return products.when(
      data: (list) {
        return _buildProductList(list!);
      },
      error: (_, __) {
        return const Center(child: Text("ERROR"));
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildProductList(List<Product> products) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            var data = products![index];
            return GestureDetector(
              onTap: () {},
              child: ProductCard(
                model: data,
              ),
            );
          }),
    );
  }
}
