import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/src/pages/navigation_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate do'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (BuildContext context) => TwitterPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (BuildContext context) => Page1(),
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: SlideInRight(
        child: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => NavigationPage(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
                delay: Duration(milliseconds: 2200),
                child: Icon(Icons.new_releases, color: Colors.blue, size: 40)),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text(
                'Titulo',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 2000),
              child: Text(
                'Soy un texto pequeño',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 2000),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
