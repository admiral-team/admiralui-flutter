import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter = _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: PrimaryButton(
                title: 'Primary Button',
                sizeType: ButtonSizeType.medium,
                direction: IconDirection.left,
                icon: Icon(
                  Icons.headphones,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: SecondaryButton(
                title: 'Secondary Button',
                sizeType: ButtonSizeType.medium,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: GhostButton(
                title: 'Ghost Button',
                sizeType: ButtonSizeType.medium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(AdmiralIcons.admiral_ic_doc_attention_solid),
      ),
    );
  }
}
