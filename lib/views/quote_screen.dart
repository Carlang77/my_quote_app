// Import necessary Flutter libraries and the custom classes from the app.
import 'package:flutter/material.dart';
import 'package:my_quote_app/controllers/quote_controller.dart';
import 'package:my_quote_app/views/quote_widget.dart';
import 'package:my_quote_app/models/quote_model.dart';

// Define a StatefulWidget named QuoteScreen to represent the main screen of the app.
class QuoteScreen extends StatefulWidget {
  @override
  // Create a state for the QuoteScreen.
  _QuoteScreenState createState() => _QuoteScreenState();
}

// Define the state for QuoteScreen.
class _QuoteScreenState extends State<QuoteScreen> {
  // Create an instance of QuoteController to manage quote-related functionality.
  final QuoteController _controller = QuoteController();

  // Define a function to fetch a quote asynchronously and handle errors.
  Future<QuoteModel?> _fetchQuote() async {
    try {
      return await _controller.fetchQuote();
    } catch (error) {
      // Handle the error, e.g., print an error message and return null.
      print('Error fetching quote: $error');
      return null;
    }
  }

  // Override the build method to build the UI of the QuoteScreen.
  @override
  Widget build(BuildContext context) {
    // Return a Scaffold widget, providing basic material design structure.
    return Scaffold(
      // Set the app bar with a title.
      appBar: AppBar(
        title: Text('Daily Quote'),
      ),

      // Sets the body of the Scaffold with padding and a central column.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Uses FutureBuilder to asynchronously build the UI based on the future quote.
              FutureBuilder<QuoteModel?>(
                future: _fetchQuote(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Shows a loading indicator if the quote is still loading.
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError || snapshot.data == null) {
                    // Show an error message if there's an error or no quote data.
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Displays the quote using the QuoteWidget.
                    return QuoteWidget(quote: snapshot.data);
                  }
                },
              ),
              // Adds spacing between the quote and the reload button.
              SizedBox(height: 20),
              // Adds a button to reload the quote.
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Triggers a reload by rebuilding the FutureBuilder.
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
