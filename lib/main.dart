import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  //geneates dummy list
  // lenght and data
  final List<String> items = new List<String>.generate(30, (i) => "Items $i");
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Swipe to Dismiss"),
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, int index) {
          final item = items[index];
          return new Dismissible(
            key: new Key(item),
            onDismissed: (direction) {
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text("Item Dismissed"),
                  ));
            },
            background: new Container(color:Colors.red),
            child: new ListTile(
              title: new Text("$item"),
            ),
          );
        },
      ),
    );
  }
}
