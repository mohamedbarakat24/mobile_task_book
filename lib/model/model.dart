class Book {
  String name;
  String description;
  String author;
  String imageUrl;
  DateTime publishedDate;
  double price;
  final String category;

  Book({
    required this.name,
    required this.description,
    required this.author,
    required this.imageUrl,
    required this.publishedDate,
    required this.price,
    required this.category
  });
}