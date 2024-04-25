import 'package:flutter/material.dart';
import 'package:follow_up/Screens/baseScreen.dart';

import 'package:follow_up/Tenant_Student/Student.dart';
import 'package:follow_up/Tenant_Student/student_joined.dart';
import 'package:follow_up/Tenant_Withdrawelrequest/Withdrawelrequest.dart';

class WithdrawelRequestTabbarrs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'Withdrawelrequest',
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                height: 50,
                color: const Color.fromARGB(255, 246, 241, 241),
                padding: EdgeInsets.only(bottom: 15, top: 5),
                child: TabBar(
                  unselectedLabelColor: Colors.red,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  tabs: [
                    Container(
                      child: Tab(
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.only(right: 16, left: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.red, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "All",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(right: 12, left: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.red, width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Initiated",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(right: 4, left: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.red, width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "pending",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Withrdrawelrequest(),
                  JoinedScreen(),
                  CallAgainScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JoinedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Joined Screen'),
    );
  }
}

class CallAgainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Call Again Screen'),
    );
  }
}
