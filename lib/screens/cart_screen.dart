import 'package:flutter/material.dart';

import '../../models/book_model.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Book> books = [
    Book(
        image: 'assets/verity.jpeg',
        name: 'Verity',
        author: 'Colleen Hoover',
        description: 'book',
        price: 50.0),
    Book(
        image: 'assets/girl.jpeg',
        name: 'Girl Wash Your Face',
        author: 'Rachel Hollis',
        description: 'book',
        price: 50.0),
    Book(
        image: 'assets/reedeming.jpg',
        name: 'Reedeming Love',
        author: 'Francine Rivers',
        description: 'book',
        price: 50.0),
    Book(
        image: 'assets/whentheyfindher.jpeg',
        name: 'When They Find Her',
        author: 'Lia Middleton',
        description: 'book',
        price: 50.0),
    Book(
        image: 'assets/thealchemist.jpeg',
        name: 'The Alchemist',
        author: 'Paulo Coelho',
        description: 'book',
        price: 50.0),
  ];

  void removeBookFromCart(Book book) {
    setState(() {
      books.remove(book);
    });
  }

  // CartScreen({required this.books});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return Card(
                  child: Column(children: [
                Expanded(
                  child: Image.asset(
                    book.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(book.author),
                      Text(
                        '\$${book.price.toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          removeBookFromCart(book);
                        },
                      ),
                    ],
                  ),
                ),
              ]));
            }));
  }
}
