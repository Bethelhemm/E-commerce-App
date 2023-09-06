import 'package:bookstore/Models/genre.dart';
import 'package:bookstore/Models/product.dart';
import 'package:bookstore/widgets/widget_home_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/semantics.dart';
import 'package:bookstore/widgets/widget_home.dart';
import 'package:bookstore/components/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // retrieve data from backend
    Product model = Product(
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
    );
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            const HomeCategoriesWidget(),
            const HomeProductWidget()
            // ProductCard(
            //   model: model,
            // )
          ],
        ),
      ),
    );
  }
}
