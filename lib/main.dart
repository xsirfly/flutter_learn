import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hello flutter",
      home: NameContent(),
      theme: ThemeData(primaryColor: Colors.white)
    );
  }
}

class _NameState extends State<NameContent> {
  List<WordPair> _namePairs = List<WordPair>();
  Set<WordPair> _favorites = Set<WordPair>();
  
  Widget _getItem(BuildContext context, int i) {
    if (i.isOdd) {
      return Divider();
    }
    int index = i ~/ 2;
    if (index >= _namePairs.length) {
      _namePairs.addAll(generateWordPairs().take(10));
    }
    bool isFav = _favorites.contains(_namePairs[index]);
    return ListTile(
        title: Text(_namePairs[index].asCamelCase),
        trailing: isFav ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_border),
        onTap: (){
          setState(() {
            if (isFav) {
              _favorites.remove(_namePairs[index]);
            } else {
              _favorites.add(_namePairs[index]);
            }
          });
        });

  }

  void _pushFav() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (buildContext) {
        final Iterable<ListTile> tiles = _favorites.map(
              (WordPair pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
              ),
            );
          },
        );

        final List<Widget> divided = ListTile
            .divideTiles(
          context: context,
          tiles: tiles,
        )
            .toList();

        return Scaffold(
          appBar: AppBar(title: Text("favorites")),
          body: ListView(children: divided),
        );
      })
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello flutter"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushFav,
          )
        ],
      ),
      body: Center(
          child: ListView.builder(itemBuilder: _getItem)
      ),
    );
  }
}

class NameContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NameState();
  }
}
