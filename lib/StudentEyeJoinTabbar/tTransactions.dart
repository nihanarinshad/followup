import 'package:flutter/material.dart';

class TenantsTransaction extends StatefulWidget {
  const TenantsTransaction({super.key});

  @override
  State<TenantsTransaction> createState() => _TenantTransactionState();
}

class _TenantTransactionState extends State<TenantsTransaction> {
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
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView(
          children: [
            ListTile(
              leading: Text(
                'pending',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.pink,
                    const Color.fromARGB(255, 160, 2, 55)
                  ], begin: Alignment.topCenter, end: Alignment.topRight),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Text(
                  '5000/-',
                  style: TextStyle(color: Colors.white),
                )),
                height: 40,
                width: 100,
              ),
              // trailing: ElevatedButtonz,
            )
          ],
        ),
        height: 60,
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView(
          children: [
            ListTile(
              leading: Text(
                'paid',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 2, 237, 10),
                    Color(0xFF049308)
                  ], begin: Alignment.topCenter, end: Alignment.topRight),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Text(
                  '5000/-',
                  style: TextStyle(color: Colors.white),
                )),
                height: 40,
                width: 100,
              ),
              // trailing: ElevatedButtonz,
            )
          ],
        ),
        height: 55,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              'Transactions',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Expanded(
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
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
                        trailing:
                            Text(Amount[index], style: TextStyle(fontSize: 14)),
                      ),
                    ]),
                  ),
                );
              })),
    ]);
  }
}
