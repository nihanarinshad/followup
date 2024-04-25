import 'package:flutter/material.dart';
import 'package:follow_up/Partner/partner_edit.dart';
import 'package:follow_up/PARTNER_TABBAR/Documents.dart';
import 'package:follow_up/PARTNER_TABBAR/MyUsers.dart';
import 'package:follow_up/PARTNER_TABBAR/Packages.dart';
import 'package:follow_up/PARTNER_TABBAR/Profile.dart';
import 'package:follow_up/PARTNER_TABBAR/Trasactions.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:get/get.dart';

class PartnerMyprofile extends StatefulWidget {
  @override
  _MyprofisleState createState() => _MyprofisleState();
}

class _MyprofisleState extends State<PartnerMyprofile>
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
                'Partner 1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Spacer(),
              if (showEditIcon)
                IconButton(
                  icon: Icon(
                    Icons.edit_note_outlined,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Get.to(Partneredit());
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
                  child: Text('MyUsers',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 9))),
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
                PartnMyprofile(),
                MyUsers(),
                Partnerpackages(),
                PartnerDocuments(),
                PartnerTransaction(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
