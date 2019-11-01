import 'package:flutter/material.dart';
import './Quote.dart';
// import './QuoteCard.dart';

void main() => runApp(
      MaterialApp(
        home: QuotesList(),
      ),
    );

class QuotesList extends StatefulWidget {
  @override
  _QuotesListState createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {
  List<Quote> quotes = [
    Quote(
      author: "Nandy Mandy",
      text: "I have enrgy and passion to turn my dreams into reality.",
    ),
    Quote(
      author: "Warren Buffet",
      text: "I will be millionaire by the age of 30.",
    ),
    Quote(
      author: "Nicola Tesla",
      text: "I will go to USA and Setup a huge business.",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome Quotes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
          // children: quotes
          //     .map((quote) => QuoteCard(
          //         quote: quote,
          //         delete: () {
          //           setState(() {
          //             quotes.remove(quote);
          //           });
          //         }))
          //     .toList(),
          ),
    );
  }
}
