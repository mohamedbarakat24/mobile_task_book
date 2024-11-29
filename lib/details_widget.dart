import 'package:flutter/material.dart';
import 'package:task_mobile_bool/model/model.dart';

class DetailsPage extends StatelessWidget {
  final Book book;

  DetailsPage({required this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Genre: ${book.genre}'),
      ),
    );
  }
}
