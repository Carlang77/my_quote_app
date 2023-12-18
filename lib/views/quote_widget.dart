import 'package:flutter/material.dart';
import 'package:my_quote_app/controllers/quote_controller.dart';
import 'package:my_quote_app/views/quote_widget.dart';
import 'package:my_quote_app/models/quote_model.dart';

class QuoteWidget extends StatefulWidget {
  final QuoteModel? quote;

  QuoteWidget({required this.quote});

  @override
  _QuoteWidgetState createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
  int likes = 0; // Track the number of likes

  @override
  Widget build(BuildContext context) {
    if (widget.quote == null) {
      return CircularProgressIndicator();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.quote!.content,
          style: TextStyle(fontSize: 40),
        ),
        SizedBox(height: 10),
        Text(
          '- ${widget.quote!.author}',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {
                setState(() {
                  likes++;
                });
              },
            ),
            Text('$likes Likes'),
            SizedBox(width: 20),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                // Implement sharing functionality here
                _shareQuote(widget.quote!);
              },
            ),
          ],
        ),
      ],
    );
  }

  // Placeholder for sharing functionality
  void _shareQuote(QuoteModel quote) {
    // Implement sharing functionality here (e.g., using a share plugin)
    // For example, you can use the 'share' package:
    // https://pub.dev/packages/share
    // Example: Share.share('${quote.content} - ${quote.author}');
  }
}
