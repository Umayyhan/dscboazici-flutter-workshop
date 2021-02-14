import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final List<WordPair> _suggestions = <WordPair>[];
final TextStyle _biggerFont = const TextStyle(fontSize: 18);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          //child: Text('Hello World'),   // Replace this text...
          child: EnglishWords(), // With this text.
        ),
      ),
    );
  }
}

class EnglishWords extends StatefulWidget {
  @override
  _EnglishWordsState createState() => _EnglishWordsState();
}

class _EnglishWordsState extends State<EnglishWords> {
  @override
  Widget build(BuildContext context) {
    _suggestions.addAll(generateWordPairs().take(10));

    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
          leading: Icon(Icons.favorite),
        );
      },
    );
  }
}
