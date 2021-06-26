import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'AppBar Tutorial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.orange,
        elevation: 20,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.ac_unit),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              }),
          IconButton(
              icon: Icon(Icons.access_alarm), onPressed: _incrementCounter),
          IconButton(
            icon: Icon(Icons.navigate_next),
            tooltip: " Go to the next page",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
        leading: Icon(Icons.accessibility),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
