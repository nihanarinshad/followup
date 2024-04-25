import 'package:flutter/material.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/TABBAR_USER/Documents.dart';
import 'package:follow_up/TABBAR_USER/History.dart';
import 'package:follow_up/TABBAR_USER/Package.dart';
import 'package:follow_up/TABBAR_USER/Profile.dart';
import 'package:follow_up/TABBAR_USER/Transaction.dart';

class Myprofile extends StatefulWidget {
  @override
  _MyprofileState createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool showEditIcon = true; // Initially set to true to show the edit icon

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_tabChangeListener);
  }

  @override
  void dispose() {
    _tabController.removeListener(_tabChangeListener);
    _tabController.dispose();
    super.dispose();
  }

  void _tabChangeListener() {
    setState(() {
      // Show edit icon only when the profile tab is selected
      showEditIcon = _tabController.index == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'My Profile',
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 30),
              Text(
                'User 1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Spacer(),
              if (showEditIcon)
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit profile action
                  },
                ),
              SizedBox(width: 20),
            ],
          ),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                  icon: Icon(Icons.person),
                  child: Text('profile',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 10))),
              Tab(
                  icon: Icon(Icons.history),
                  child: Text('History',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 10))),
              Tab(
                  icon: Icon(Icons.local_offer),
                  child: Text('Package',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 10))),
              Tab(
                  icon: Icon(Icons.file_copy),
                  child: Text('Document',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 8))),
              Tab(
                  icon: Icon(Icons.money_off),
                  child: Text('Transaction',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 7))),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                profile(),
                history(),
                packages(),
                Documents(),
                UserTransaction(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
