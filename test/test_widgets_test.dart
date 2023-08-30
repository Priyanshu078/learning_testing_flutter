import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("My Widget has a title and a body", (widgetTester) async {
    await widgetTester.pumpWidget(const MyWidget(title: "title", body: 'body'));

    final titleFinder = find.text('title');
    final bodyFinder = find.text('body');

    expect(titleFinder, findsOneWidget);
    expect(bodyFinder, findsOneWidget);
  });

  testWidgets("find by text", (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      title: "MyApp",
      home: Text("H"),
    ));
    expect(find.text('H'), findsOneWidget);
  });

  testWidgets('find by key', (widgetTester) async {
    var key = const Key('Hello');

    await widgetTester.pumpWidget(MaterialApp(
      key: key,
      home: const Text("Hello"),
    ));

    var findBykey = find.byKey(key);

    expect(findBykey, findsOneWidget);
  });

  testWidgets("find by widget", (widgetTester) async {
    var widget = Container(
      color: Colors.red,
    );

    await widgetTester.pumpWidget(MaterialApp(
      title: "mYapp",
      home: Container(child: widget),
    ));

    var findyWidget = find.byWidget(widget);

    expect(findyWidget, findsOneWidget);
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test App",
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(body),
        ),
      ),
    );
  }
}
