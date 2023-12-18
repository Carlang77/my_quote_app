import 'package:flutter/material.dart';
import 'package:my_quote_app/controllers/quote_controller.dart';
import 'package:my_quote_app/models/quote.dart';

class MainScreen extends StatelessWidget {
  final QuoteController quoteController = QuoteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quote of the Day')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/quoteList');
          },
          child: Text('View Previous Quotes'),
        ),
      ),
    );
  }
}
