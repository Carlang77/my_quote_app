// lib/quote_widget.dart

import 'package:flutter/material.dart';

class QuoteWidget extends StatelessWidget {
  final Map<String, dynamic>? quote;

  QuoteWidget({required this.quote});

  @override
  Widget build(BuildContext context) {
    if (quote == null) {
      // Handle the case where quote is null, for example, show a loading indicator or an error message.
      return CircularProgressIndicator();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          quote!['content'],
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          '- ${quote!['author']}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
