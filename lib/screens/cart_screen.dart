import 'package:book_store/constants/color_pallate.dart';
import 'package:book_store/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
        title: Text(
          'Cart Screen',
          style: TextStyle(
            color: MyColor.secondaryColor,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cart.length,
        itemBuilder: (BuildContext context, int index) {
          final book = cartProvider.cart[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Image.network(book.imageUrl!),
                title: Text(
                  book.title,
                  style: TextStyle(
                    color: MyColor.authorColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(book.author),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // remove button
                    GestureDetector(
                      onTap: () {
                        cartProvider.removeFromCart(book);
                      },
                      child: const Icon(
                        Icons.cancel_outlined,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 5),
                    // price
                    Text(
                      '\$${book.price.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: MyColor.black,
                          fontSize: 16.5,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
// ______________________________________________________________________________
// developed---by---mughaltechlab----saqib--ahmed
// --------------------------I_________N_____F__________O-----------------
// github: mughaltechlab-----------------whatsapp: 923111377533 ----------------------
// _____________________________________________________________________________
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: MyColor.primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
          style: TextStyle(
            color: MyColor.priceColor,
            wordSpacing: 20.0,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
