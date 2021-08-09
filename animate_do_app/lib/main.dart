import 'package:flutter/material.dart';

import 'src/pages/page1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animate do',
      home: Page1(),
    );
  }
}
