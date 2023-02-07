import 'package:elaaj/home/home.dart';
import 'package:flutter/material.dart';

import 'appointment_page.dart';
class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPage = 0;
  final PageController _page = PageController();
  @override
  Widget build(BuildContext context){
  return Scaffold(
  body: PageView(
  controller: _page,
  onPageChanged: ((value) {
  setState(() {
  //update page index when tab presse
  currentPage = value;
  });
  }),
  children: const <Widget>[
  HomePage(),
  AppointmentPage(),
  ],
    ),
    bottomNavigationBar: BottomNavigationBar(
    currentIndex: currentPage,
    onTap: (page) {
      setState(() {
        currentPage = page;
        _page.animateToPage(
          page,
          duration: const Duration (milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    },
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(
    Icons.home,
    ),
    // title: Text(
    // 'Home',
    // ),
    ),
    BottomNavigationBarItem(
    icon: Icon(
    Icons.message,
    ),
    // title: Text(
    // 'Messages',
    // ),
    ),
    BottomNavigationBarItem(
    icon: Icon(
    Icons.person,
    ),


    ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.calendar_month,
        ),

      ),
    ],
    ),
    );
  }
}


