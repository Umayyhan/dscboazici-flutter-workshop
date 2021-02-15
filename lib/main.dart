import 'package:dscbogaziciflutterworkshop/savedItemsView.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final List<WordPair> _suggestions = <WordPair>[];
final TextStyle _biggerFont = const TextStyle(fontSize: 18);
final List<WordPair> _saved = List<WordPair>(); // Add this line.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EnglishWords());
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
        actions: [
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => SavedItems(
                            saved: _saved,
                          )),
                );
              }),
        ],
      ),
      body: Center(
        //child: Text('Hello World'),   // Replace this text...
        child: ListView.builder(
          itemCount: _suggestions.length,
          itemBuilder: (context, index) {
            final bool alreadySaved =
                _saved.contains(_suggestions[index]); // Add this line.
            return ListTile(
              title: Text(
                _suggestions[index].asPascalCase,
                style: _biggerFont,
              ),
              trailing: Icon(
                // Add the lines from here...
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
              ),
              onTap: () {
                // Add 9 lines from here...
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(_suggestions[index]);
                  } else {
                    _saved.add(_suggestions[index]);
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }
}
