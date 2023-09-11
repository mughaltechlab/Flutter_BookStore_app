import 'package:book_store/constants/color_pallate.dart';
import 'package:book_store/util/book.dart';
import 'package:book_store/util/book_lists.dart';
import 'package:book_store/util/cart_icon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // text editing controller for searching text from search bar
  TextEditingController _searchC = TextEditingController();

  List<Book> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchC = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColor.primaryColor,
        title: RichText(
            text: TextSpan(
          children: [
            TextSpan(
              text: 'BOO',
              style: TextStyle(
                color: Colors.blue.shade100,
                // color: MyColor.secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(
              text: 'K',
              style: TextStyle(
                fontFamily: 'serif',
                color: Colors.redAccent,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: 'store',
              style: TextStyle(
                // color: MyColor.secondaryColor,
                color: Colors.blue.shade100,

                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )),
        actions: const [
          CartIcon(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            // search bar

            SearchBar(
              controller: _searchC,
              onChanged: _handleSearch,
              shadowColor: MaterialStatePropertyAll(MyColor.primaryColor),
              textStyle: MaterialStatePropertyAll(TextStyle(
                color: MyColor.primaryColor,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              )),
              backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200),
              leading: const Icon(
                Icons.search_rounded,
                color: Colors.blue,
                size: 24,
              ),
            ),

            // books list

            Expanded(
                child: BookList(
              books: _searchResults.isNotEmpty
                  ? _searchResults
                  : BookList.booksList,
            )),
          ],
        ),
      ),
    );
  }

// ----------____________-----------Functions------__________----------
// developed---by---mughaltechlab----saqib--ahmed
// github: mughaltechlab-----------------------------------------

  void _handleSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _searchResults = BookList.booksList
            .where((book) =>
                book.title.toLowerCase().contains(query.toLowerCase()) ||
                book.author.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }
}
