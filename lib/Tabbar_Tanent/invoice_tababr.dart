import 'package:flutter/material.dart';

class InvoiceTabbar extends StatelessWidget {
  const InvoiceTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Column(children: [
          Container(
            height: 50,
            color: const Color.fromARGB(255, 246, 241, 241),
            padding: EdgeInsets.only(bottom: 15),
            child: TabBar(
              labelColor: const Color.fromARGB(255, 246, 241, 241),
              // isScrollable: true,
              unselectedLabelColor: Colors.red,

              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.red),
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
                          style: TextStyle(fontSize: 10),
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
                        "Paid",
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
                        "Pending",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
