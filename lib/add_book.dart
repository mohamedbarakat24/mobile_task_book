import 'package:flutter/material.dart';
import 'package:task_mobile_bool/model/model.dart';

class AddBookPage extends StatefulWidget {
  final Function(Book) addBook;

  AddBookPage({required this.addBook});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final TextEditingController nameController = TextEditingController();
  String selectedGenre = 'Fiction';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Book')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Book Name'),
            ),
            DropdownButton<String>(
              value: selectedGenre,
              onChanged: (String? newValue) {
                setState(() {
                  selectedGenre = newValue!;
                });
              },
              items: <String>['Fiction', 'Non-fiction', 'Science', 'History']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                widget.addBook(Book(nameController.text, selectedGenre));
                Navigator.of(context).pop();
              },
              child: Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}
