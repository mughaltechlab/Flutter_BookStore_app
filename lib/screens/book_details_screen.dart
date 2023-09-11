// ______________________________________________________________________________
// developed---by---mughaltechlab----saqib--ahmed
// --------------------------I_________N_____F__________O-----------------
// github: mughaltechlab-----------------whatsapp: 923111377533 ----------------------
// _____________________________________________________________________________
import 'package:book_store/constants/color_pallate.dart';
import 'package:book_store/util/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';
import '../util/book.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  const BookDetailsScreen({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
        actions: const [
          CartIcon(),
        ],
        title: Text(
          '${book.title} Book Details',
          style: TextStyle(
            color: MyColor.secondaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          // cover image
          Image.network(
            book.imageUrl!,
            width: 300,
          ),

          // details

          Expanded(
            child: Container(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: MediaQuery.of(context).size.height * 1,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: MyColor.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0).copyWith(
                  top: 20,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    // title
                    Text(
                      book.title.toUpperCase(),
                      style: TextStyle(
                        color: MyColor.secondaryColor,
                        fontSize: 20,
                        // fontStyle: FontStyle.italic,
                        fontFamily: 'serif',
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // author
                    Text(
                      book.author.toUpperCase(),
                      style: TextStyle(
                        color: MyColor.authorColor,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'serif',
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // price
                    Text(
                      '\$${book.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: MyColor.priceColor,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'serif',
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    // description
                    Text(
                      book.description,
                      style: TextStyle(
                        color: MyColor.white.withAlpha(150),
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'serif',
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    // button
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(book);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(MyColor.secondaryColor),
                        ),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
