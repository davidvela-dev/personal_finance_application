import 'package:flutter/material.dart';

// screens for dynamic layout
import 'home.dart';
import 'movements.dart';
import 'budgets.dart';
import 'reports.dart';

class ViewsLayout extends StatefulWidget {
  final int initialIndex; // save initial screen

  const ViewsLayout({
    super.key,
    this.initialIndex = 0,
  }); // constructor to be called with parameter index

  @override
  State<ViewsLayout> createState() => _ViewsLayoutState();
}

class _ViewsLayoutState extends State<ViewsLayout> {
  late int _currentIndex; // initialized when view is loaded

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // index asigned to route
  }

  // screens list with indexes
  final List<Widget> _pantallas = const [
    HomeView(),
    MovementsView(),
    BudgetsView(),
    ReportsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // index stack keeps the state of each screen
      body: IndexedStack(
        index: _currentIndex, // current selected screen
        children: _pantallas, // list of screens
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // show all menu elements without hiding
        currentIndex: _currentIndex, // private variable for current index
        selectedItemColor: Colors.black, // black color for selected elements
        unselectedItemColor: Colors.grey, // gray color for unselected elements
        // hide labels
        showUnselectedLabels: false,
        showSelectedLabels: false,

        // icons list
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Movements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Budgets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Reports',
          ),
        ],

        onTap: (index) {
          // current index is changed to index of current screen from list
          setState(() {
            _currentIndex = index; // flutter draws new content
          });
        },
      ),
    );
  }
}
