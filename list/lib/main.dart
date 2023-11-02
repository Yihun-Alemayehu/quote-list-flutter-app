import 'package:flutter/material.dart';
import 'quote.dart';

void main() => runApp(const MaterialApp(
    home : Listdata(),
  ));

class Listdata extends StatefulWidget {
  const Listdata({super.key});

  @override
  State<Listdata> createState() => _ListdataState();
}

class _ListdataState extends State<Listdata> {

  List<Quote> quotes = [
    Quote(text: 'Life doesn’t get easier or more forgiving, we get stronger and more resilient.', author: 'Steve Maraboli'),
    Quote(text: 'Enthusiasm is common. Endurance is rare.', author: 'Angela Duckworth'),
    Quote(text: 'The oak fought the wind and was broken, the willow bent when it must and survived.', author: 'Robert Jordan'),
    Quote(text: 'Resilience is accepting your new reality, even if it’s less good than the one you had before. You can fight it, you can do nothing but scream about what you’ve lost, or you can accept that and try to put together something that’s good.', author: 'Elizabeth Edwards'),
    Quote(text: 'Hold yourself responsible for a higher standard than anybody else expects of you. Never excuse yourself. Never pity yourself. Be a hard master to yourself-and be lenient to everybody else.', author: 'Henry Ward Beecher'),
    Quote(text: 'If your heart is broken, make art with the pieces.', author: 'Shane Koyczan')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text('Quotes'),
        centerTitle: true,
      ),
      body: ListView(
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          delete: (){
            setState(() {
              quotes.remove(quote);
            });
          }
          )).toList(),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
 QuoteCard({
    required this.quote,
    required this.delete,
  });

  final Quote quote;
  final Function delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[400],
                letterSpacing: 2,
                fontFamily: 'playfair',
              ),
            ),
            SizedBox(height: 5,),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[400],
                letterSpacing: 2,
              ),
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: Icon(Icons.delete), 
              label: Text('Delete'),)
          ],
        ),
      ),
    );
  }
}
