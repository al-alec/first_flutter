import 'package:flutter/material.dart';
import 'main_image_box.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: _customAppBar(),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: [
            Text("Hello,", style: theme.textTheme.headline2),
            Text(
              "Lamar Jr.",
              style: theme.textTheme.headline1,
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          border: theme.inputDecorationTheme.border,
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                          hintStyle: theme.inputDecorationTheme.hintStyle)),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Icon(
                    Icons.settings_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MyImageBox(url: "https://images.unsplash.com/photo-1616617535619-55e3db07bd5b?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max",),
                  MyImageBox(url: "https://source.unsplash.com/random",),
                  MyImageBox(url: "https://source.unsplash.com/random",),
                ],
              ),
            ),
          ],
        ),
    bottomNavigationBar: _MyCustomBottomNav(),
    );
  }

  Widget _customAppBar() => AppBar(
        elevation: 0,
        //leading: Icon(Icons.arrow_back),
        //title: Text('Title'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(MdiIcons.fromString('gamepad-circle'), size: 25, ),
          ),
        ],
      );

  Widget _MyCustomBottomNav() => BottomNavigationBar(
    elevation: 0,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'School',
      ),
    ],
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black38,
    selectedIconTheme: IconThemeData(size: 30),
    onTap: _onItemTapped,
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
}
