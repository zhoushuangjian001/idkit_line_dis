import 'package:flutter/material.dart';
import 'package:idkit_line/idkit_line.dart';
import 'package:idkit_line/idkit_line.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("虚线测试"),
      ),
      body: DottedPage(),
    );
  }
}

class DottedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IDKitLine(
        width: 100,
        height: 100,
        painter: IDKitLinedot(
          color: Colors.red,
          paintWidth: 3,
          direction: Direction.vertical,
          itemLength: 6,
          itemInterval: 1,
        ),
      ),
    );
  }
}
