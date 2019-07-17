import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pension/pages/home/index_home.dart';
import 'package:flutter_pension/pages/find/index_find.dart';
import 'package:flutter_pension/pages/finance/index_finance.dart';
import 'package:flutter_pension/pages/my/index_my.dart';

class AppNavigator extends StatefulWidget {
  @override
  _AppNavigatorState createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  final PageController _pageController = PageController();
  final List<Widget> _tabView = [
    IndexHome(),
    IndexFinance(),
    IndexFind(),
    IndexMy()
  ];
  int _tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          children: _tabView,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: Container(
          child: SafeArea(
              child: CupertinoTabBar(
                  backgroundColor: Colors.white,
                  activeColor: Colors.orangeAccent,
                  inactiveColor: Colors.black,
                  currentIndex: _tabIndex,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home,size: 26.0,),title: Text('首页')),
                    BottomNavigationBarItem(icon: Icon(Icons.attach_money,size: 26.0,),title: Text('金融')),
                    BottomNavigationBarItem(icon: Icon(Icons.favorite_border,size: 26.0,),title: Text('发现')),
                    BottomNavigationBarItem(icon: Icon(CupertinoIcons.person,size: 26.0,),title: Text('我的')),
                  ],
                onTap: (index){
                    _pageController.jumpToPage(index);
                    setState(() {
                      _tabIndex = index;
                    });
                },
              )
          ),
        )
    );
  }
}
