import 'package:flutter/material.dart';
import 'package:otobox/src/pages/home_page.dart';
import 'package:otobox/src/utils/size_config.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Center(
      child: Text(
        'Sale Page',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Add Car Page',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Rent Page',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Profile Page',
        style: optionStyle,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe92a, fontFamily: 'otobox'),
              size: 28,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe933, fontFamily: 'otobox'),
              size: 28,
            ),
            title: Text('Sale'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe92f, fontFamily: 'otobox'),
              size: 36,
            ),
            title: Text('Add car'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe932, fontFamily: 'otobox'),
              size: 28,
            ),
            title: Text('Rent'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe930, fontFamily: 'otobox'),
              size: 28,
            ),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
