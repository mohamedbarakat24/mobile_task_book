import 'package:flutter/material.dart';
import 'package:task_mobile_bool/model/model.dart';
import 'package:task_mobile_bool/utils/colors.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.dark ,
      appBar: AppBar(
        title: Text(book.name ,style: const TextStyle(color: MyColors.white),
      ),
      backgroundColor: MyColors.maincolor,),
      body: Container(
        color: MyColors.dark,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Image.network(
                book.imageUrl,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey,
                    child: const Center(child: Text('Image not available')),
                  );
                },
              ),
              const SizedBox(height: 16),


              Text(
                book.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color:MyColors.textWhite),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text('Author: ${book.author}', style: const TextStyle(fontSize: 18, color: MyColors.textWhite)),
              const SizedBox(height: 8),
              Text('Price: \$${book.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, color:MyColors.textWhite)),
              const SizedBox(height: 8),
              Text('Published on: ${book.publishedDate.toLocal().toString().split(' ')[0]}', style: const TextStyle(fontSize: 18, color: MyColors.textWhite)),
              const SizedBox(height: 8),
              Text("Description: ${book.description}",
                style: const TextStyle(fontSize: 16, color: MyColors.textWhite),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                  color: getCategoryColor(book.category),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  book.category,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case 'Chess Books':
        return Colors.blue;
      case 'Science':
        return Colors.green;
      case 'Art':
        return Colors.purple;
      case 'Thriller':
        return Colors.red;
      case 'Fantasy':
        return Colors.orange;
      case 'Biography':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }
}
