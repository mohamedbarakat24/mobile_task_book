import 'package:flutter/material.dart';
import 'package:task_mobile_bool/model/model.dart';
import 'package:task_mobile_bool/utils/colors.dart';
import 'package:task_mobile_bool/utils/helper_functions.dart';

class AddBookPage extends StatefulWidget {
  final Function(Book) addBook;

  const AddBookPage({super.key, required this.addBook});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _description;
  String? _author;
  String? _imageUrl;
  DateTime? _publishedDate;
  double? _price;
  String? _selectedCategory;

  final List<String> categories = [
    'Chess Books',
    'Science',
    'Art',
    'Thriller',
    'Fantasy',
    'Biography'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _publishedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _publishedDate) {
      setState(() {
        _publishedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MyHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Book',
          style: TextStyle(color: MyColors.white),
        ),
        backgroundColor: MyColors.maincolor,
      ),
      body: Container(
        color: isDarkMode ? MyColors.white : MyColors.dark,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 16),
              TextFormField(
                style: const TextStyle(color: MyColors.white),
                cursorColor: MyColors.lightGrey,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.book_rounded),
                  labelStyle: const TextStyle(color: MyColors.lightGrey),
                  labelText: 'Book Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isDarkMode
                            ? Colors.grey
                            : Colors.black),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.all(12.0),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a book name' : null,
                onSaved: (value) => _name = value,
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: _selectedCategory,
                style: const TextStyle(color: MyColors.white),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.category_outlined),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelStyle: TextStyle(color: MyColors.white),
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12.0),
                ),
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),

                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a category' : null,
                onSaved: (value) => _selectedCategory = value,
                dropdownColor: MyColors.dark,
              ),
              const SizedBox(height: 16),
              TextFormField(
                style: const TextStyle(color: MyColors.white),
                cursorColor: MyColors.lightGrey,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description_outlined),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelStyle: TextStyle(color: MyColors.lightGrey),
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12.0),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a description' : null,
                onSaved: (value) => _description = value,
              ),
              const SizedBox(height: 16),


              TextFormField(
                style: const TextStyle(color: MyColors.white),
                cursorColor: MyColors.lightGrey,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelStyle: isDarkMode
                      ? const TextStyle(color: MyColors.lightGrey)
                      : const TextStyle(color: MyColors.white),
                  labelText: 'Author',
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(12.0),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter an author name' : null,
                onSaved: (value) => _author = value,
              ),
              const SizedBox(height: 16),


              TextFormField(

                style: const TextStyle(color: MyColors.white),
                cursorColor: MyColors.lightGrey,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.image),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelStyle: isDarkMode
                      ? const TextStyle(color: MyColors.lightGrey)
                      : const TextStyle(color: MyColors.white),
                  labelText: 'Image URL',
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(12.0),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter an image URL' : null,
                onSaved: (value) => _imageUrl = value,
              ),
              const SizedBox(height: 16),

              TextFormField(

                style: const TextStyle(color: MyColors.white),
                cursorColor: MyColors.lightGrey,
                decoration: InputDecoration(

                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelStyle: isDarkMode
                      ? const TextStyle(color: MyColors.lightGrey)
                      : const TextStyle(color: MyColors.white),
                  labelText: 'Price',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.attach_money),
                  contentPadding: const EdgeInsets.all(12.0),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Please enter a price'
                    : null,
                onSaved: (value) => _price = double.tryParse(value!),
              ),
              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: () => _selectDate(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0),
                  backgroundColor: MyColors.maincolor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.date_range,color: MyColors.white,),
                    const SizedBox(width: 8,),
                    Text(
                        _publishedDate == null
                            ? 'Select Publication Date'
                            : "Published on: ${_publishedDate?.day}/${_publishedDate?.month}/${_publishedDate?.year}",
                        style: const TextStyle(color: MyColors.white)),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Add Book Button
              ElevatedButton(

                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_name == null ||
                        _description == null ||
                        _author == null ||
                        _imageUrl == null ||
                        _publishedDate == null ||
                        _price == null ||
                        _selectedCategory == null) {
                      MyHelperFunctions.showSnackBar(
                          context, 'Please fill in all fields.');
                      return;
                    }

                    final newBook = Book(
                      name: _name!,
                      description: _description!,
                      author: _author!,
                      imageUrl: _imageUrl!,
                      publishedDate: _publishedDate!,
                      price: _price!,
                      category: _selectedCategory!, // Add category
                    );

                    widget.addBook(newBook);
                    Navigator.pop(context);
                  }
                },
                style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(MyColors.maincolor)),
                child: const Text(
                  'Add Book',
                  style: TextStyle(color: MyColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
