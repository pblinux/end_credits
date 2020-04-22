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
        body: EndCredits(
      [
        Section(title: 'Cast', roles: [
          Role(name: 'Role 1', crew: [Responsable('John Doe')])
        ]),
        Section(title: 'Other', roles: [
          Role(
              name: 'Role 2',
              crew: [Responsable('John Doe'), Responsable('John Doe')])
        ]),
        Section(title: 'Other', roles: [
          Role(name: 'Role 3', crew: [
            Responsable('John Doeeeeeeeeee'),
            Responsable('John Doe'),
            Responsable('John Doe'),
            Responsable('John Doe')
          ])
        ]),
        Section(title: 'Other', roles: [
          Role(name: 'Role 44444444455555555555555555555', crew: [
            Responsable('John Doeeeeeeeeeeeeeeeeeeeeeeeeee'),
            Responsable('John Doe'),
            Responsable('John Doe'),
            Responsable('John Doe')
          ])
        ])
      ],
      onScrollChange: (offset) {
        print(offset);
      },
    ));
  }
}
