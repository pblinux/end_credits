import 'package:end_credits/end_credits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('end credtis is moving', (tester) async {
    const key = Key('end_credits_app');
    const widget = EndCreditsApp(key);
    await tester.pumpWidget(widget);
    final state = tester.state(find.byKey(key)) as _EndCreditsAppState;
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(state.currentOffset, isNot(0.0));
  });
}

///Widget to test
class EndCreditsApp extends StatefulWidget {
  const EndCreditsApp(Key key) : super(key: key);

  @override
  State<EndCreditsApp> createState() => _EndCreditsAppState();
}

class _EndCreditsAppState extends State<EndCreditsApp> {
  double currentOffset = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key('material_app'),
      home: Scaffold(
        key: const Key('scaffold'),
        body: EndCredits(
          [
            Section(
              title: 'Cast',
              roles: [
                Role(name: 'Role 1', crew: [const Responsable('John Doe')]),
                Role(name: 'Role 2', crew: [const Responsable('John Doe')]),
                Role(name: 'Role 3', crew: [const Responsable('John Doe')]),
                Role(name: 'Role 4', crew: [const Responsable('John Doe')]),
                Role(name: 'Role 5', crew: [const Responsable('John Doe')]),
              ],
            ),
            Section(
              title: 'Producers',
              roles: [
                Role(
                  name: 'Executive producer',
                  crew: [
                    const Responsable('John Doe'),
                    const Responsable('John Doe'),
                    const Responsable('John Doe')
                  ],
                ),
                Role(
                  name: 'Producer',
                  crew: [
                    const Responsable('John Doe'),
                    const Responsable('John Doe'),
                    const Responsable('John Doe')
                  ],
                )
              ],
            ),
            Section(
              title: 'Other',
              roles: [
                Role(
                  name: 'Role',
                  crew: [
                    const Responsable('John Doe'),
                    const Responsable('John Doe'),
                    const Responsable('John Doe'),
                    const Responsable('John Doe')
                  ],
                )
              ],
            )
          ],
          onScrollChange: _onScrollChange,
        ),
      ),
    );
  }

  void _onScrollChange(double offset) {
    if (offset > 0.0) {
      setState(() => currentOffset = offset);
    }
  }
}
