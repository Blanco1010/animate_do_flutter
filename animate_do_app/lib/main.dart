import 'package:flutter/material.dart';

import 'src/pages/navigation_page.dart';
import 'src/pages/page1.dart';
import 'src/pages/twitter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animate do',
      home: NavigationPage(),
      //home: Page1(),
      //home: TwitterPage(),
    );
  }
}
