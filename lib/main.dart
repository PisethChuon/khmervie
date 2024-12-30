// import 'package:Khmervie/Navagation/home.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const GetMaterialApp(home: HomeBarNavigator());
//   }
// }


import 'dart:convert';
import 'package:Khmervie/test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(BookApp());

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: BooksScreen(),
    );
  }
}

class BooksScreen extends StatefulWidget {
@override
_BooksScreenState createState() => _BooksScreenState();
}
class _BooksScreenState extends State<BooksScreen> {
  List<Book> _books = [];
  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }
  Future<void> _fetchBooks() async {
    final response = await http.get(Uri.parse('http://192.168.195.138:3000/api/books'));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      setState(() {
      _books = json.map((item) => Book.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load books');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: ListView.builder(
        itemCount: _books.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_books[index].title),
            subtitle: Text(_books[index].author),
          );
        },
      ),
    );
  }
 }
