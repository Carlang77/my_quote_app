import 'package:flutter/material.dart';
import 'package:my_quote_app/controllers/quote_controller.dart';
import 'package:my_quote_app/models/quote.dart';

class QuoteListScreen extends StatelessWidget {
  final QuoteController quoteController = QuoteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Previous Quotes')),
      body: FutureBuilder<List<Quote>>(
        future: quoteController.getQuotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var quote = snapshot.data![index];
                return ListTile(
                  title: Text(quote.text),
                  subtitle: Text('- ${quote.author}'),
                );
              },
            );
          } else {
            return Center(child: Text('No quotes found'));
          }
        },
      ),
    );
  }
}
