import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:point_tab_indicator/point_tab_indicator.dart';

void main() => runApp(MyApp());

const kMainColor = Color(0xFF573851);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'point_tab_indicator',
      home: MyHomePage(title: 'Flutter Custom Tab Indicator Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title, style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(child: Text('Sun.')),
              Tab(child: Text('Mon.')),
              Tab(child: Text('Tue.')),
              Tab(child: Text('Wed.')),
              Tab(child: Text('Thu.')),
              Tab(child: Text('Fri.')),
              Tab(child: Text('Sat.')),
            ],
            indicator: PointTabIndicator(
              color: Colors.purple,
              // radius: 5.0,
              // showLine: true,
              // lineColor: Colors.grey,
              // lineWidth: 1.0,
              // paddingBottom: 2.0,
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(color: Colors.orange),
            Container(color: Colors.green),
            Container(color: Colors.red),
            Container(color: Colors.yellow),
            Container(color: Colors.purple),
            Container(color: Colors.grey),
            Container(color: Colors.brown),
          ],
        ),
      ),
    );
  }
}
