import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './Survivor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
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
  Future<List<Survivor>> survivors;

  @override
  void initState() {
    super.initState();
    survivors = fetchSurvivors();
  }

  Future<List<Survivor>> fetchSurvivors() async {
    final response = await http
        .get('http://zssn-backend-example.herokuapp.com/api/people.json');

    if (response.statusCode == 200) {
      Iterable data = json.decode(response.body);
      List<Survivor> survivors =
          data.map((model) => Survivor.fromJson(model)).toList();

      return survivors;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Widget futureListWidgt() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              final survivor = snapshot.data[index];
              return ListTile(
                  contentPadding: EdgeInsets.all(5),
                  title: Text(survivor.name),
                  subtitle:
                      Text("${survivor.age} years old - ${survivor.gender}"),
                  trailing: Icon(Icons.directions_run,
                      color: survivor.infected ? Colors.red : Colors.green));
            });
      },
      future: fetchSurvivors(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Zombie Survivor Social Network"),
        ),
        body: futureListWidgt());
  }
}
