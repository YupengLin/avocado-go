import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gogrow/Custom_BlocObserver/notifire_clor.dart';
import 'package:gogrow/bottom_bar/bottom_pages/Home.dart';
import 'package:gogrow/bottom_bar/bottom_pages/Order.dart';
import 'package:gogrow/bottom_bar/bottom_pages/Portfolio.dart';
import 'package:gogrow/bottom_bar/bottom_pages/Profile.dart';
import 'package:gogrow/bottom_bar/bottom_pages/Stock_Exchange.dart';
import '../utils/medeiaqury/medeiaqury.dart';

class bottom_Home extends StatefulWidget {
  @override
  _bottom_HomeState createState() => _bottom_HomeState();
}

class _bottom_HomeState extends State<bottom_Home> {
  int _selectedIndex = 0;

  late ColorNotifier notifire;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: notifire.getwihitecolor,
          unselectedItemColor: notifire.getgrey.withOpacity(.80),
          selectedLabelStyle: const TextStyle(fontFamily: 'Gilroy_Medium'),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: notifire.getbluecolor,
          selectedIconTheme: IconThemeData(color: notifire.getbluecolor),
          unselectedLabelStyle: const TextStyle(fontFamily: 'Gilroy_Medium'),
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                backgroundColor: notifire.getwihitecolor,
                icon: Image.asset("assets/images/Home-Filled.png",
                    height: height / 30),
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: notifire.getwihitecolor,
                icon: Image.asset("assets/images/Portfolio-outline.png",
                    height: height / 30),
                label: 'Portfolio'),
            BottomNavigationBarItem(
                backgroundColor: notifire.getwihitecolor,
                icon: Image.asset("assets/images/exchange.png",
                    height: height / 20),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: notifire.getwihitecolor,
                icon: Image.asset("assets/images/Order-outline.png",
                    height: height / 30),
                label: 'Order'),
            BottomNavigationBarItem(
              backgroundColor: notifire.getwihitecolor,
              icon: Image.asset("assets/images/User-outline.png",
                  height: height / 30),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
            _buildOffstageNavigator(4),
          ],
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const Home(),
          const Portfolio(),
          const Stock_Exchange(),
          const Order(),
          const Profile(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
