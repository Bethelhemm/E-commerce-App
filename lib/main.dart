// import 'package:book_store/screens/cover_page.dart';
import 'package:book_store/screens/cover_page.dart';
import 'package:flutter/material.dart';
// import '../screens/homepage.dart';

// void main() {
//   runApp(const HomeApp());
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Padding(
        padding: MediaQuery.of(context).size.width > 750
            ? EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 4)
            : const EdgeInsets.all(0),
        child: const CoverPage(),
      ),
    );
  }
}
