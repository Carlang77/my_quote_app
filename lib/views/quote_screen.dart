import 'package:flutter/material.dart';
import 'package:my_quote_app/controllers/quote_controller.dart';
import 'package:my_quote_app/views/quote_widget.dart';
import 'package:my_quote_app/models/quote_model.dart';

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final QuoteController _controller = QuoteController();

  Future<QuoteModel?> _fetchQuote() async {
    try {
      return await _controller.fetchQuote();
    } catch (error) {
      // Handle the error, e.g., show a snackbar
      print('Error fetching quote: $error');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Quote'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<QuoteModel?>(
                future: _fetchQuote(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return QuoteWidget(quote: snapshot.data);
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Trigger a reload by rebuilding the FutureBuilder
                  });
                },
                child: Text('Reload Quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
