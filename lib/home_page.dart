import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_mobile_bool/add_book.dart';
import 'package:task_mobile_bool/details_widget.dart';
import 'package:task_mobile_bool/model/model.dart';
import 'package:task_mobile_bool/utils/colors.dart';
import 'package:task_mobile_bool/utils/helper_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  List<Book> books = [];

  final Map<String, Color> categoryColors = {
    'Chess Books': Colors.blue,
    'Science': Colors.green,
    'Art': Colors.purple,
    'Thriller': Colors.red,
    'Fantasy': Colors.orange,
    'Biography': Colors.teal,
  };

  void addBook(Book book) {
    if (!books.any((b) => b.name == book.name)) {
      setState(() {
        books.add(book);
      });
      MyHelperFunctions.showSnackBar(context, "${book.name} added!");
    } else {
      MyHelperFunctions.showSnackBar(context, "Duplicate book!");
    }
  }

  void deleteBook(int index) {
    setState(() {
      books.removeAt(index);
      MyHelperFunctions.showSnackBar(context, "Book deleted!");
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MyHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Library Management', style: TextStyle(color: MyColors.white)),
        backgroundColor: MyColors.maincolor,
      ),
      body: Container(
        color:  MyColors.dark ,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              Text(
                'Total Books: ${books.length}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyColors.textWhite ,
                ),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    Book currentBook = books[index];

                    return Dismissible(
                      key: Key(currentBook.name),
                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onDismissed: (direction) {
                        deleteBook(index);
                      },
                      child: Card(
                        elevation: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color: MyColors.lightGrey,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookDetailPage(book: currentBook),
                              ),
                            );
                          },
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          title: Text(
                            currentBook.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: isDarkMode ? MyColors.textWhite : MyColors.textPrimary,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Author: ${currentBook.author}', style: TextStyle(fontSize: 16, color: isDarkMode ? MyColors.textWhite : MyColors.textPrimary)),
                              Text('Price: \$${currentBook.price}', style: TextStyle(fontSize: 16, color: isDarkMode ? MyColors.textWhite : MyColors.textPrimary)),
                              Text('Published: ${DateFormat('dd/MM/yyyy').format(currentBook.publishedDate)}',
                                  style: TextStyle(fontSize: 16, color: isDarkMode ? MyColors.textWhite : MyColors.textPrimary)),
                              // Category with unique color
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: categoryColors[currentBook.category] ?? Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  currentBook.category,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddBookPage(addBook: addBook)));
        },
        backgroundColor: MyColors.maincolor,
        child: const Icon(Icons.add, color: MyColors.white),
      ),
    );
  }
}