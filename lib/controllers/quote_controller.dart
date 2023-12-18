import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_quote_app/models/quote_model.dart';

class QuoteController {
  Future<QuoteModel> fetchQuote() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> quoteData = json.decode(response.body);
      return QuoteModel(
          content: quoteData['content'], author: quoteData['author']);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
