import 'package:flutter/material.dart';
import 'package:follow_up/Screens/BaseScreen.dart';

class ModeratorTransaction extends StatefulWidget {
  const ModeratorTransaction({super.key});

  @override
  State<ModeratorTransaction> createState() => _TenantTransactionState();
}

class _TenantTransactionState extends State<ModeratorTransaction> {
  final List<String> Idno = ['T001', 'T001', 'T001', 'T006', 'T005'];
  final List<String> Date = [
    '14-02-2003',
    '14-02-2003',
    '14-02-2003',
    '14-02-2003',
    '14-02-2003'
  ];
  final List<String> Amount = [
    '\$19900',
    '\$19900',
    '\$19900',
    '\$19900',
    '\$19900',
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Column(children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: Idno.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          color: Colors.white,
                        ),
                        child: ListView(children: [
                          ListTile(
                            leading: Text(
                              Idno[index],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            title: Center(
                                child: Text(Date[index],
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14))),
                            trailing: Text(Amount[index],
                                style: TextStyle(fontSize: 14)),
                          ),
                        ]),
                      ),
                    );
                  })),
        ]),
        appBarText: 'Transactions');
  }
}
