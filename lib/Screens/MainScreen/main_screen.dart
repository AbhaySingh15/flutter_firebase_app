import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/MainScreen/MyAccountScreen/my_account.dart';
import 'HomeScreen/home_screen.dart';
import 'MyLearningScreen/my_learning_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = [
    HomeScreen(),
    MyLearningScreen(),
    MyAccountScreen(),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
        ),
        body: pageList[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_fill),
              label: 'My learning',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'My account')
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
