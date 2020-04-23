import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:end_credits/end_credits.dart';

void main() {
  testWidgets('end credtis is moving', (tester) async {
    final key = Key('end_credits_app');
    final widget = EndCreditsApp(key);
    await tester.pumpWidget(widget);
    final state = tester.state(find.byKey(key)) as _EndCreditsAppState;
    await tester.pumpAndSettle(Duration(seconds: 1));
    expect(state.currentOffset, isNot(0.0));
  });
}

///Widget to test
class EndCreditsApp extends StatefulWidget {
  EndCreditsApp(Key key) : super(key: key);

  @override
  _EndCreditsAppState createState() => _EndCreditsAppState();
}

class _EndCreditsAppState extends State<EndCreditsApp> {
  double currentOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        key: Key('material_app'),
        home: Scaffold(
            key: Key('scaffold'),
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
            ], onScrollChange: _onScrollChange)));
  }

  void _onScrollChange(double offset) {
    if (offset > 0.0) {
      setState(() => currentOffset = offset);
    }
  }
}
