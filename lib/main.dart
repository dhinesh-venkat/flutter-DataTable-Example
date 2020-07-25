import 'package:flutter/material.dart';
import 'package:portfolio/table.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    routes: {
      GenerateTable.routeName: (ctx) => GenerateTable(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataTable"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.yellow,
          onPressed: () {
            Navigator.of(context).pushNamed(GenerateTable.routeName);
          },
          child: Text("Generate Table from json"),
        ),
      ),
    );
  }
}
