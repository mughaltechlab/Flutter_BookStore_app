// here i create a book model such as its image,title,author,price and its description

class Book {
  final String? imageUrl;
  final String title;
  final String author;
  final double price;
  final String description;

  Book({
    this.imageUrl,
    required this.title,
    required this.author,
    required this.price,
    required this.description,
  });
}
