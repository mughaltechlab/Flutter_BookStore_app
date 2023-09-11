import 'package:book_store/constants/color_pallate.dart';
import 'package:book_store/screens/book_details_screen.dart';
import 'package:book_store/util/book.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  final Book book;

  const BookTile({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsScreen(book: book),
          ),
        );
      },
      child: Card(
        // color: Colors.grey.shade100,
        color: MyColor.primaryColor.withOpacity(.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            // color: Colors.grey.shade300,
            gradient: LinearGradient(colors: [
              Colors.grey.shade700,
              Colors.grey.shade500,
              Colors.grey.shade700,
            ]),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // cover image
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CoverImage(book: book),
              ),

              // equall gape between image and details
              const SizedBox(width: 20),

              // book details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Text(
                    book.title.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: MyColor.white.withOpacity(.9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // author
                  Row(
                    children: [
                      const Text(
                        'by:',
                        style: TextStyle(),
                      ),
                      Text(
                        book.author.toUpperCase(),
                        style: TextStyle(
                          color: MyColor.authorColor,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // price
                  Text(
                    '\$${book.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: MyColor.priceColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ______----DEVELOPED BY SAQIB AHMED MUGHAltECHLAB------_________________

// book cover image
class CoverImage extends StatelessWidget {
  const CoverImage({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      book.imageUrl!,
      fit: BoxFit.fitHeight,
    );
  }
}
