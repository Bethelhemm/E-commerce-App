import 'package:flutter/material.dart';
import '../models/books.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            book.coverImage,
            height: 200,
            width: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16.0),
          Text(
            book.bookName,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            book.author,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Price: \$${book.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
