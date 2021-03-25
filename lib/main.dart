import 'package:flutter/material.dart';
import 'package:project18/helper/database_helper.dart';
import 'package:sqflite/sqlite_api.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // get all
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          trailing: IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              // delete one
              // get all
            },
          ),
        );
      }),
      floatingActionButton: fab,
    );
  }

  Widget get fab => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              print(await DatabaseHelper().addUser());
              //
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.list),
            onPressed: () async {
              print(await DatabaseHelper().getUsers());
              //
            },
          ),
        ],
      );
}
