import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:craft_closet/bloc/GoogleAuthenticationBloc.dart';
import 'package:craft_closet/model/GoogleAuthenticationModel.dart';
import 'package:craft_closet/view/NavBar.dart';

void main() => runApp(new MyApp());

final Map<IconData, String> bottomBarMap = Map.from({
  Icons.dashboard: 'Dashboard',
  Icons.list: 'Inventory',
  Icons.note_add: 'Invoice',
//  Icons.assignment: 'Order Form',
//  Icons.history: 'Transaction History'
});

//    Scaffold(
//    body: new MyHomePage(title: 'Flutter Demo Home Page'),
//    bottomNavigationBar: new NavBar(bottomBarMap),
//    );


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Craft Closet',
      theme: new ThemeData.dark(),
      home: new Scaffold(
        body: new MyHomePage(title: 'Flutter Demo Home Page'),
        bottomNavigationBar: new NavBar(bottomBarMap),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    var authBlock = new GoogleAuthenticationBlock();
    final Stream<GoogleAuthenticationModel> uid = authBlock.handleSignIn();
    uid.listen((data) {
      print('State: ${data.state}, UID: ${data.uid}');
    });

    final Stream<String> uidStream = authBlock.getUID();
    uidStream.listen((data) {
      print('Your UID is: $data');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
