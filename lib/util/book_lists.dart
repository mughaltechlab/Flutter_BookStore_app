// here i create books list class, where we storing all details about books
// and creating a bunch of books..developed by SAQIB AHMED__MUGHALTECHLAB

import 'package:book_store/util/book.dart';
import 'package:book_store/util/book_tile.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  final List<Book> books;
  static List<Book> booksList = [
    Book(
        imageUrl:
            'https://m.media-amazon.com/images/I/8179uEK+gcL._AC_UF1000,1000_QL80_.jpg',
        title: 'Harry Potter',
        author: 'JK Rowling',
        price: 10,
        description:
            'Its Fictional and amazing magical, mystrical Storial Book.'),
    Book(
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1663805647i/136251.jpg',
        title: 'Book 2',
        author: 'author 2',
        price: 11,
        description: 'Book Description.....'),
    Book(
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1663805647i/136251.jpg',
        title: 'Book 3',
        author: 'author 3',
        price: 3,
        description: 'Book Description.....'),
    Book(
        imageUrl:
            'https://m.media-amazon.com/images/I/8179uEK+gcL._AC_UF1000,1000_QL80_.jpg',
        title: 'Book 4',
        author: 'author 4',
        price: 4,
        description: 'Book Description.....'),
    Book(
        imageUrl:
            'https://m.media-amazon.com/images/I/8179uEK+gcL._AC_UF1000,1000_QL80_.jpg',
        title: 'Book 5',
        author: 'author 5',
        price: 2,
        description: 'Book Description.....'),
    Book(
        imageUrl:
            'https://m.media-amazon.com/images/I/8179uEK+gcL._AC_UF1000,1000_QL80_.jpg',
        title: 'Book 6',
        author: 'author 6',
        price: 15,
        description: 'Book Description.....'),
    Book(
        imageUrl:
            'https://m.media-amazon.com/images/I/8179uEK+gcL._AC_UF1000,1000_QL80_.jpg',
        title: 'Book 7',
        author: 'author 7',
        price: 5,
        description: 'Book Description.....'),
    Book(
        imageUrl:
            'https://m.media-amazon.com/images/I/8179uEK+gcL._AC_UF1000,1000_QL80_.jpg',
        title: 'Book 8',
        author: 'author 8',
        price: 20,
        description: 'Book Description.....'),
  ];

  const BookList({super.key, required this.books});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ListView.builder(
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return BookTile(book: books[index]);
        },
      ),
    );
  }
}
// ______----DEVELOPED BY SAQIB AHMED MUGHAltECHLAB------_________________
