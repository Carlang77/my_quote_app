import 'package:flutter/material.dart';
import 'views/main_screen.dart';
import 'views/quote_list_screen.dart';

void main() {
  runApp(QuoteApp());
}

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/quoteList': (context) => QuoteListScreen(),
      },
    );
  }
}
