import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
      key: _bottomNavigationKey,
      backgroundColor: Colors.blueAccent,
      items: <Widget>[
      Icon(Icons.add, size: 30),
      Icon(Icons.list, size: 30),
      Icon(Icons.compare_arrows, size: 30),
      Icon(Icons.list, size: 30),
      Icon(Icons.compare_arrows, size: 30),
    ],
    onTap: (index) {
      setState(() {
       _page = index;
      });
    },
  ),
  body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(_page.toString(), textScaleFactor: 10.0),
                RaisedButton(
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                    //Page change using state does the same as clicking index 1 navigation button
                    final CurvedNavigationBarState navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState.setPage(1);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
