import 'package:flutter/material.dart';
import 'package:bookstore/screens/book_detail.dart';
import 'package:bookstore/Models/books.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Book> books = [
    Book(
      id: '1',
      bookName: 'Maybe Someday',
      author: 'Colleen Hoover',
      coverImage: 'assets/maybe someday.jpeg',
      price: 10.00,
    ),
    Book(
      id: '2',
      bookName: 'The Alchemist',
      author: 'Paulo Coelho',
      coverImage: 'assets/alhemist.jpeg',
      price: 12.0,
    ),
    Book(
      id: '3',
      bookName: 'The Silent Patient',
      author: 'Alex Michaelides',
      coverImage: 'assets/silent patient.jpeg',
      price: 22.2,
    ),
  ];

  List<Book> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    filteredBooks.addAll(books);
  }

  void onSearchTextChanged(String searchText) {
    setState(() {
      filteredBooks = books
          .where((book) =>
              book.bookName.toLowerCase().contains(searchText.toLowerCase()) ||
              book.author.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('As The Page Turns'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: onSearchTextChanged,
                decoration: InputDecoration(
                  hintText: 'Search items...',
                ),
              ),
            ),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                padding: EdgeInsets.all(8.0),
                itemCount: filteredBooks.length,
                itemBuilder: (BuildContext context, int index) {
                  final book = filteredBooks[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailScreen(book: book),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            book.coverImage,
                            height: 150,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            book.bookName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            book.author,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_sharp),
              label: 'Add to cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onNavItemTapped,
        ));
  }
}
