import 'package:flutter/material.dart';
import 'firstPage.dart';
import 'secondPage.dart';
import 'thirdPage.dart';

void main() => runApp(new MyTrackTimeApp());

class MyTrackTimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Track Time',
      home: new MyTabs(),
    );
  }
}

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
    void initState() {
      super.initState();
      tabController = new TabController(vsync: this, length: 3);
    }
  @override
    void dispose() {
      tabController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("My Track Time"),
      ),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          new FirstPage(),
          new SecondPage(),
          new ThirdPage(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.lightBlue[500],
        child: new TabBar(
          indicatorColor: Colors.deepOrangeAccent,
          controller: tabController,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.list)),
            new Tab(icon: new Icon(Icons.history)),
            new Tab(icon: new Icon(Icons.graphic_eq)),
          ],
        ),
      ),
    );
  }
}
