import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavedItems extends StatelessWidget {
  final List<WordPair> saved;

  const SavedItems({Key key, this.saved}) : super(key: key); // Add this line.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add 6 lines from here...
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView.builder(
        itemCount: saved.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              saved[index].asPascalCase,
            ),
          );
        },
      ),
    ); //
  }
}
