import 'package:flutter/material.dart';
import 'package:task_mobile_bool/add_book.dart';
import 'package:task_mobile_bool/details_widget.dart';
import 'package:task_mobile_bool/model/model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book> books = [];

  void addBook(Book book) {
    if (!books.any((b) => b.name == book.name)) {
      setState(() {
        books.add(book);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Duplicate book!"),
      ));
    }
  }

  void deleteBook(int index) {
    setState(() {
      books.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Management'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddBookPage(addBook: addBook)));
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total Books: ${books.length}'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(books[index].name),
                  subtitle: Text(books[index].genre),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsPage(book: books[index])));
                  },
                  onLongPress: () => deleteBook(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
