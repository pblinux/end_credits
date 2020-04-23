import 'package:end_credits/end_credits.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  Widget build(BuildContext context) {
    return Scaffold(
        body: EndCredits([
      Section(title: 'Cast', roles: [
        Role(name: 'Role 1', crew: [Responsable('John Doe')]),
        Role(name: 'Role 2', crew: [Responsable('John Doe')]),
        Role(name: 'Role 3', crew: [Responsable('John Doe')]),
        Role(name: 'Role 4', crew: [Responsable('John Doe')]),
        Role(name: 'Role 5', crew: [Responsable('John Doe')]),
      ]),
      Section(title: 'Producers', roles: [
        Role(name: 'Executive producer', crew: [
          Responsable('John Doe'),
          Responsable('John Doe'),
          Responsable('John Doe')
        ]),
        Role(name: 'Producer', crew: [
          Responsable('John Doe'),
          Responsable('John Doe'),
          Responsable('John Doe')
        ])
      ]),
      Section(title: 'Other', roles: [
        Role(name: 'Role', crew: [
          Responsable('John Doe'),
          Responsable('John Doe'),
          Responsable('John Doe'),
          Responsable('John Doe')
        ])
      ])
    ]));
  }
}
