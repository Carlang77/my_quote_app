import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_quote_app/models/quote.dart';

class QuoteController {
  // Replace with your API endpoint
  final String _baseUrl = 'https://example.com/api/quotes';

  Future<List<Quote>> getQuotes() async {
    var url = Uri.parse(_baseUrl);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> quotesJson = json.decode(response.body);

      // Assuming the JSON is an array of quote objects
      List<Quote> quotes =
          quotesJson.map((json) => Quote.fromJson(json)).toList();
      return quotes;
    } else {
      // Handle the case when the server response is not successful
      throw Exception('Failed to load quotes');
    }
  }

  // You can add more methods here for posting new quotes,
  // updating or deleting them as per your API's capabilities.
}
